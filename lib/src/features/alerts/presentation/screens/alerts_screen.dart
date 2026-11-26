/// SAFENAV CAVITE - Alerts Screen
///
/// Alerts and notifications screen with filtering, search,
/// real-time Firestore updates, and detailed alert views.
///
/// Follows the Figma Alerts design as the visual source of truth while
/// preserving all existing functionality: Firebase Cloud Messaging,
/// Firestore alert data, acknowledgment workflows, and alert creation.
library;

import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../features/admin/data/repositories/alerts_repository.dart';
import '../../../../features/emergency/presentation/providers/emergency_providers.dart';
import '../../../../features/map/presentation/providers/map_providers.dart';
import '../../../../shared/models/alert.dart';
import '../../../../shared/models/user.dart';
import '../../../../shared/widgets/widgets.dart';

// ============================================================================
// Top-level providers
// ============================================================================

/// Stream provider for real-time alerts using Firestore snapshots.
/// Uses repository.watchAlerts() for true real-time updates.
final filteredAlertsProvider = StreamProvider.family<List<Alert>, FilterParams>((
  ref,
  params,
) {
  final repository = ref.watch(alertsRepositoryProvider);

  return repository
      .watchAlerts(
        status: params.status,
        severity: params.severity,
        buildingId: params.userBuildingIds.isNotEmpty
            ? params.userBuildingIds.first
            : null,
        targetRoles: params.userRoles.isNotEmpty ? params.userRoles : null,
        limit: 100,
      )
      .map((alerts) {
        // Client-side filtering for type and search (Firestore compound query limitations)
        var filtered = alerts;

        if (params.type != null) {
          filtered = filtered.where((a) => a.type == params.type).toList();
        }

        if (params.searchQuery.isNotEmpty) {
          final query = params.searchQuery.toLowerCase();
          filtered = filtered.where((alert) {
            return alert.title.toLowerCase().contains(query) ||
                alert.message.toLowerCase().contains(query) ||
                (alert.locationName?.toLowerCase().contains(query) ?? false);
          }).toList();
        }

        // Filter by building IDs if needed (for multiple buildings)
        if (params.userBuildingIds.length > 1) {
          filtered = filtered.where((alert) {
            if (alert.targetBuildingIds.isEmpty) return true; // Global alerts
            return alert.targetBuildingIds.any(
              (id) => params.userBuildingIds.contains(id),
            );
          }).toList();
        }

        return filtered;
      });
});

/// Provider for unread alerts count (for badge on tab) - real-time stream.
final unreadAlertsCountStreamProvider = StreamProvider<int>((ref) {
  final currentUser = ref.watch(currentUserProvider);
  if (currentUser == null) return Stream.value(0);

  final repository = ref.watch(alertsRepositoryProvider);
  return repository
      .watchAlerts(
        status: AlertStatus.active,
        targetRoles: [currentUser.role.name],
        limit: 100,
      )
      .map((alerts) => alerts.length);
});

/// Provider for map initial center (used when navigating from alert detail).
final alertMapCenterProvider = StateProvider<LatLng?>((ref) => null);

// ============================================================================
// Filter parameters for alerts query
// ============================================================================

@immutable
class FilterParams {
  final AlertStatus? status;
  final AlertSeverity? severity;
  final AlertType? type;
  final String searchQuery;
  final List<String> userRoles;
  final List<String> userBuildingIds;

  const FilterParams({
    this.status,
    this.severity,
    this.type,
    this.searchQuery = '',
    this.userRoles = const [],
    this.userBuildingIds = const [],
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FilterParams &&
        runtimeType == other.runtimeType &&
        status == other.status &&
        severity == other.severity &&
        type == other.type &&
        searchQuery == other.searchQuery &&
        _listEquals(userRoles, other.userRoles) &&
        _listEquals(userBuildingIds, other.userBuildingIds);
  }

  static bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hash(
    status,
    severity,
    type,
    searchQuery,
    Object.hashAll(userRoles),
    Object.hashAll(userBuildingIds),
  );
}

// ============================================================================
// AlertsScreen
// ============================================================================

/// Alerts screen - 4th tab in bottom navigation
class AlertsScreen extends ConsumerStatefulWidget {
  const AlertsScreen({super.key});

  @override
  ConsumerState<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends ConsumerState<AlertsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  AlertSeverity? _selectedSeverity;
  AlertType? _selectedType;
  String _searchQuery = '';
  final ScrollController _scrollController = ScrollController();
  StreamSubscription<String>? _fcmRegistrationSubscription;
  StreamSubscription<RemoteMessage>? _foregroundMessageSubscription;
  StreamSubscription<RemoteMessage>? _openedMessageSubscription;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(_onScroll);
    // Initialize FCM for push notifications
    _initFCM();
  }

  @override
  void dispose() {
    _fcmRegistrationSubscription?.cancel();
    _foregroundMessageSubscription?.cancel();
    _openedMessageSubscription?.cancel();
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Initialize Firebase Cloud Messaging for critical/emergency alerts
  Future<void> _initFCM() async {
    try {
      final messaging = FirebaseMessaging.instance;
      // Request permission for notifications
      await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      // Register and receive the FCM token through the SDK's current API.
      _fcmRegistrationSubscription = messaging.onRegistered.listen(
        (token) => _registerFCMToken(token),
      );
      await messaging.register();

      // Handle foreground messages
      _foregroundMessageSubscription = FirebaseMessaging.onMessage.listen((
        RemoteMessage message,
      ) {
        if (mounted) {
          _showNotificationBanner(message);
        }
      });

      // Handle notification taps when app is in background
      _openedMessageSubscription = FirebaseMessaging.onMessageOpenedApp.listen((
        RemoteMessage message,
      ) {
        if (mounted && message.data['alertId'] != null) {
          context.push(AppRoutes.alertDetailRoute(message.data['alertId']));
        }
      });
    } catch (e) {
      debugPrint('[ALERTS] FCM initialization failed: $e');
    }
  }

  Future<void> _registerFCMToken(String token) async {
    if (!mounted) return;

    final currentUser = ref.read(currentUserProvider);
    if (currentUser == null) return;

    try {
      final registerToken = FirebaseFunctions.instance.httpsCallable(
        'registerToken',
      );
      await registerToken.call({
        'token': token,
        'platform': Platform.operatingSystem,
      });
      debugPrint('[ALERTS] FCM Token registered: $token');

      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.id)
          .update({
            'fcmToken': token,
            'updatedAt': FieldValue.serverTimestamp(),
          });
      debugPrint(
        '[ALERTS] FCM token persisted to user profile: ${currentUser.id}',
      );
    } catch (e) {
      debugPrint('[ALERTS] Failed to register FCM token: $e');
    }
  }

  /// Show in-app notification banner for foreground messages
  void _showNotificationBanner(RemoteMessage message) {
    final data = message.data;
    final title = data['title'] ?? message.notification?.title ?? 'New Alert';
    final body = data['message'] ?? message.notification?.body ?? '';
    final severity = data['severity'] ?? 'info';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(body),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: _getSeverityColorFromString(severity),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'View',
          textColor: Colors.white,
          onPressed: () {
            if (data['alertId'] != null) {
              context.push(AppRoutes.alertDetailRoute(data['alertId']));
            }
          },
        ),
      ),
    );
  }

  Color _getSeverityColorFromString(String severity) {
    switch (severity.toLowerCase()) {
      case 'emergency':
      case 'critical':
        return Colors.red;
      case 'warning':
        return Colors.amber.shade800;
      default:
        return Colors.blue;
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // The stream provider handles real-time updates via Firestore snapshots
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentUser = ref.watch(currentUserProvider);
    final canCreateAlert = currentUser != null && currentUser.canAccessAdmin;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: _buildFilterTabs(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context),
            tooltip: 'Search alerts',
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
            tooltip: 'Filter alerts',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Active filters indicator
            if (_selectedSeverity != null ||
                _selectedType != null ||
                _searchQuery.isNotEmpty)
              _buildActiveFilters(context),

            // Alerts list with real-time updates
            Expanded(child: _buildAlertsList(context)),
          ],
        ),
      ),
      floatingActionButton: canCreateAlert
          ? FloatingActionButton.extended(
              onPressed: () => _navigateToCreateAlert(context),
              icon: const Icon(Icons.add_alert),
              label: const Text('New Alert'),
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            )
          : null,
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            icon: const Icon(Icons.notifications_outlined, size: 20),
            text: 'Alert',
          ),
          Tab(
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.call_missed_outgoing, size: 18),
                SizedBox(width: 6),
                Text('Missed calls'),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.message_outlined, size: 20),
                const SizedBox(width: 6),
                const Text('Messages'),
              ],
            ),
          ),
        ],
        labelStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(fontWeight: FontWeight.w400),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        dividerColor: Colors.transparent,
      ),
    );
  }

  Widget _buildActiveFilters(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final filters = <Widget>[];

    if (_selectedSeverity != null) {
      filters.add(
        AppChip(
          label: _selectedSeverity!.displayName,
          backgroundColor: _getSeverityColor(_selectedSeverity!)
              .withValues(alpha: 0.15),
          onDeleted: () => setState(() => _selectedSeverity = null),
        ),
      );
    }

    if (_selectedType != null) {
      filters.add(
        AppChip(
          label: _selectedType!.displayName,
          backgroundColor: colorScheme.primaryContainer,
          onDeleted: () => setState(() => _selectedType = null),
        ),
      );
    }

    if (_searchQuery.isNotEmpty) {
      filters.add(
        AppChip(
          label: 'Search: "$_searchQuery"',
          backgroundColor: colorScheme.tertiaryContainer,
          onDeleted: () => setState(() => _searchQuery = ''),
        ),
      );
    }

    filters.add(
      AppTextButton(
        onPressed: () => setState(() {
          _selectedSeverity = null;
          _selectedType = null;
          _searchQuery = '';
        }),
        label: 'Clear all',
        icon: Icons.clear_all,
        iconPosition: IconPosition.leading,
        size: ButtonSize.small,
        fullWidth: false,
        semanticLabel: 'Clear all filters',
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Wrap(spacing: 8, runSpacing: 4, children: filters),
    );
  }

  Widget _buildAlertsList(BuildContext context) {
    final tabIndex = _tabController.index;

    // Missed calls and Messages tabs have no backing data source (no call-log
    // or messaging infrastructure exists in the project). Show honest empty
    // states instead of mapping alert data to these tabs.
    if (tabIndex == 1 || tabIndex == 2) {
      return _buildEmptyState(context);
    }

    final currentUser = ref.watch(currentUserProvider);
    final userRoles = currentUser != null
        ? [currentUser.role.name]
        : <String>[];
    final department = currentUser?.department;
    final userBuildingIds = (department != null && department.isNotEmpty)
        ? [department]
        : <String>[];

    final watchStatus = null; // Tab 0: all alerts, any status
    final watchSeverity = _selectedSeverity;
    final watchType = _selectedType;

    final alertsAsync = ref.watch(
      filteredAlertsProvider(
        FilterParams(
          status: watchStatus,
          severity: watchSeverity,
          type: watchType,
          searchQuery: _searchQuery,
          userRoles: userRoles,
          userBuildingIds: userBuildingIds,
        ),
      ),
    );

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(
          filteredAlertsProvider(
            FilterParams(
              status: watchStatus,
              severity: watchSeverity,
              type: watchType,
              searchQuery: _searchQuery,
              userRoles: userRoles,
              userBuildingIds: userBuildingIds,
            ),
          ),
        );
      },
      child: alertsAsync.when(
        data: (alerts) {
          if (alerts.isEmpty) {
            return _buildEmptyState(context);
          }

          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: alerts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final alert = alerts[index];
              return _AlertTile(
                alert: alert,
                onTap: () => _navigateToAlertDetail(context, alert),
                onAcknowledge: () => _acknowledgeAlert(context, alert),
              );
            },
          );
        },
        loading: () => _buildShimmerList(context),
        error: (error, stack) =>
            _buildErrorState(context, error.toString(), () {
              ref.invalidate(
                filteredAlertsProvider(
                  FilterParams(
                    status: watchStatus,
                    severity: watchSeverity,
                    type: watchType,
                    searchQuery: _searchQuery,
                    userRoles: userRoles,
                    userBuildingIds: userBuildingIds,
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildShimmerList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) => SkeletonCard(
        height: 100,
        showAvatar: true,
        showTitle: true,
        showSubtitle: true,
        lines: 2,
        semanticLabel: 'Loading alert ${index + 1}',
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final hasFilters =
        _selectedSeverity != null ||
        _selectedType != null ||
        _searchQuery.isNotEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NotificationsEmptyState(
          onRefresh: hasFilters
              ? () => setState(() {
                  _selectedSeverity = null;
                  _selectedType = null;
                  _searchQuery = '';
                })
              : null,
        ),
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    String error,
    VoidCallback onRetry,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: NetworkErrorState(onRetry: onRetry, customMessage: error),
      ),
    );
  }

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.emergency:
        return Colors.red;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.warning:
        return Colors.amber;
      case AlertSeverity.info:
        return Colors.blue;
    }
  }

  void _showSearchDialog(BuildContext context) {
    final controller = TextEditingController(text: _searchQuery);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Alerts'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Search by title, message, or location...',
            prefixIcon: Icon(Icons.search),
          ),
          autofocus: true,
          onSubmitted: (value) {
            setState(() => _searchQuery = value);
            Navigator.pop(context);
          },
        ),
        actions: [
          AppTextButton(
            onPressed: () => Navigator.pop(context),
            label: 'Cancel',
            fullWidth: false,
          ),
          AppFilledButton(
            onPressed: () {
              setState(() => _searchQuery = controller.text);
              Navigator.pop(context);
            },
            label: 'Search',
            size: ButtonSize.small,
            fullWidth: false,
            semanticLabel: 'Apply search filter',
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    AlertSeverity? tempSeverity = _selectedSeverity;
    AlertType? tempType = _selectedType;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Alerts'),
        content: StatefulBuilder(
          builder: (context, setStateDialog) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Severity', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: AlertSeverity.values.map((severity) {
                  final isSelected = tempSeverity == severity;
                  return AppFilterChip(
                    label: severity.displayName,
                    selected: isSelected,
                    backgroundColor: _getSeverityColor(severity)
                        .withValues(alpha: 0.15),
                    selectedColor: _getSeverityColor(severity)
                        .withValues(alpha: 0.25),
                    onSelected: (selected) {
                      setStateDialog(
                        () => tempSeverity = selected ? severity : null,
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Text('Type', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: AlertType.values.map((type) {
                  final isSelected = tempType == type;
                  return AppFilterChip(
                    label: type.displayName,
                    selected: isSelected,
                    backgroundColor: colorScheme.surfaceContainerHigh,
                    selectedColor: colorScheme.primaryContainer,
                    onSelected: (selected) =>
                        setStateDialog(() => tempType = selected ? type : null),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        actions: [
          AppTextButton(
            onPressed: () => Navigator.pop(context),
            label: 'Cancel',
            fullWidth: false,
          ),
          AppTextButton(
            onPressed: () {
              setState(() {
                _selectedSeverity = null;
                _selectedType = null;
              });
              Navigator.pop(context);
            },
            label: 'Clear All',
            fullWidth: false,
            semanticLabel: 'Clear all filters',
          ),
          AppFilledButton(
            onPressed: () {
              setState(() {
                _selectedSeverity = tempSeverity;
                _selectedType = tempType;
              });
              Navigator.pop(context);
            },
            label: 'Apply',
            size: ButtonSize.small,
            fullWidth: false,
            semanticLabel: 'Apply filters',
          ),
        ],
      ),
    );
  }

  void _navigateToAlertDetail(BuildContext context, Alert alert) {
    context.push(AppRoutes.alertDetailRoute(alert.id));
  }

  void _navigateToCreateAlert(BuildContext context) {
    context.push(AppRoutes.createAlertRoute);
  }

  Future<void> _acknowledgeAlert(BuildContext context, Alert alert) async {
    final currentUser = ref.read(currentUserProvider);
    if (currentUser == null) return;

    final repository = ref.read(alertsRepositoryProvider);
    final result = await repository.acknowledgeAlert(alert.id, currentUser.id);

    if (context.mounted) {
      if (result.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Alert acknowledged'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
        // The stream provider will automatically update the UI
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to acknowledge: ${result.failure.message}'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}

// ============================================================================
// Alert tile widget - Figma-inspired design with avatar, name, role, actions
// ============================================================================

class _AlertTile extends StatelessWidget {
  const _AlertTile({
    required this.alert,
    required this.onTap,
    required this.onAcknowledge,
  });

  final Alert alert;
  final VoidCallback onTap;
  final VoidCallback onAcknowledge;

  /// Gets initials for avatar from alert creator or type
  String _getAvatarInitials() {
    if (alert.createdBy != null && alert.createdBy!.isNotEmpty) {
      final parts = alert.createdBy!.split('_');
      if (parts.length >= 2) {
        return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      }
      return alert.createdBy![0].toUpperCase();
    }
    return alert.type.displayName[0].toUpperCase();
  }

  /// Gets a short role label from the alert
  String _getRoleLabel() {
    return alert.createdByRole != null && alert.createdByRole!.isNotEmpty
        ? alert.createdByRole!
        : alert.type.displayName;
  }

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.emergency:
        return Colors.red;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.warning:
        return Colors.amber;
      case AlertSeverity.info:
        return Colors.blue;
    }
  }

  Color _getStatusColor(AlertStatus status) {
    switch (status) {
      case AlertStatus.active:
        return Colors.green;
      case AlertStatus.acknowledged:
        return Colors.blue;
      case AlertStatus.resolved:
        return Colors.grey;
      case AlertStatus.expired:
        return Colors.orange;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final severityColor = _getSeverityColor(alert.severity);
    final isUnread = alert.status == AlertStatus.active;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header row: avatar + name + role + time
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar chip with initials
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: severityColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: severityColor.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    _getAvatarInitials(),
                    style: TextStyle(
                      color: severityColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Name, role, and severity badge
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            alert.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isUnread
                                  ? colorScheme.onSurface
                                  : colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: severityColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: severityColor.withValues(alpha: 0.5),
                            ),
                          ),
                          child: Text(
                            alert.severity.displayName,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                              color: severityColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _getRoleLabel(),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Time
              Text(
                _formatTimestamp(alert.createdAt),
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Message preview
          Text(
            alert.message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 12),

          // Location + status row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (alert.locationName != null) ...[
                Icon(
                  Icons.location_on,
                  size: 14,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    alert.locationName!,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 11,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16),
              ],
              // Status badge (if not active)
              if (alert.status != AlertStatus.active) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(alert.status)
                        .withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _getStatusColor(alert.status)
                          .withValues(alpha: 0.5),
                    ),
                  ),
                  child: Text(
                    alert.status.displayName,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(
                      color: _getStatusColor(alert.status),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 16),

          // Action row: Acknowledge button (only for active/unread alerts)
          if (isUnread) ...[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: AppFilledButton(
                    onPressed: onAcknowledge,
                    label: 'Acknowledge',
                    icon: Icons.check_circle,
                    iconPosition: IconPosition.leading,
                    size: ButtonSize.small,
                    fullWidth: false,
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    semanticLabel: 'Acknowledge this alert',
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ============================================================================
// Meta row for alert details
// ============================================================================

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueStyle,
  });

  final IconData icon;
  final String label;
  final String value;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  value,
                  style: valueStyle ?? Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Alert detail screen with enhanced features
// ============================================================================

class AlertDetailScreen extends ConsumerStatefulWidget {
  const AlertDetailScreen({super.key, required this.alertId});

  final String alertId;

  @override
  ConsumerState<AlertDetailScreen> createState() => _AlertDetailScreenState();
}

class _AlertDetailScreenState extends ConsumerState<AlertDetailScreen> {
  Alert? _alert;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadAlert();
  }

  Future<void> _loadAlert() async {
    final repository = ref.read(alertsRepositoryProvider);
    final result = await repository.getAlert(widget.alertId);
    if (mounted) {
      if (result.isSuccess) {
        setState(() {
          _alert = result.value;
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = result.failure.message;
          _isLoading = false;
        });
      }
    }
  }

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.emergency:
        return Colors.red;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.warning:
        return Colors.amber;
      case AlertSeverity.info:
        return Colors.blue;
    }
  }

  Color _getStatusColor(AlertStatus status) {
    switch (status) {
      case AlertStatus.active:
        return Colors.green;
      case AlertStatus.acknowledged:
        return Colors.blue;
      case AlertStatus.resolved:
        return Colors.grey;
      case AlertStatus.expired:
        return Colors.orange;
    }
  }

  String _formatFullTimestamp(DateTime timestamp) {
    return '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _acknowledgeAlert(Alert alert) async {
    final currentUser = ref.read(currentUserProvider);
    if (currentUser == null) return;

    final repository = ref.read(alertsRepositoryProvider);
    final result = await repository.acknowledgeAlert(alert.id, currentUser.id);

    if (mounted) {
      if (result.isSuccess) {
        setState(() {
          _alert = result.value;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Alert acknowledged'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to acknowledge: ${result.failure.message}'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _showResolveDialog(BuildContext context, Alert alert) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resolve Alert'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add resolution notes (optional):'),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Resolution notes...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          AppTextButton(
            onPressed: () => Navigator.pop(context),
            label: 'Cancel',
            fullWidth: false,
          ),
          AppFilledButton(
            onPressed: () {
              Navigator.pop(context);
              _resolveAlert(
                alert,
                controller.text.trim().isEmpty ? null : controller.text.trim(),
              );
            },
            label: 'Resolve',
            size: ButtonSize.small,
            fullWidth: false,
            semanticLabel: 'Confirm resolving this alert',
          ),
        ],
      ),
    );
  }

  Future<void> _resolveAlert(Alert alert, String? notes) async {
    final currentUser = ref.read(currentUserProvider);
    if (currentUser == null) return;

    final repository = ref.read(alertsRepositoryProvider);
    final result = await repository.resolveAlert(
      alert.id,
      currentUser.id,
      notes: notes,
    );

    if (mounted) {
      if (result.isSuccess) {
        setState(() {
          _alert = result.value;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Alert resolved'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to resolve: ${result.failure.message}'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _openMap(BuildContext context, Alert alert) {
    if (alert.latitude == null || alert.longitude == null) return;

    // Set the map center to alert coordinates and navigate to map screen
    final latLng = LatLng(alert.latitude!, alert.longitude!);
    ref.read(alertMapCenterProvider.notifier).state = latLng;
    ref.read(mapViewStateProvider.notifier).setCenter(latLng);
    context.push(AppRoutes.map);
  }

  Future<void> _shareAlert(BuildContext context, Alert alert) async {
    final text =
        '''
${alert.title}

${alert.message}

Type: ${alert.type.displayName}
Severity: ${alert.severity.displayName}
Location: ${alert.locationName ?? 'Unknown'}
${alert.instructions != null ? '\nInstructions: ${alert.instructions}' : ''}

Sent via SAFENAV Cavite
''';

    await SharePlus.instance.share(
      ShareParams(
        text: text,
        subject: alert.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Alert Details')),
        body: const Center(
          child: InlineLoading(message: 'Loading alert details...'),
        ),
      );
    }

    if (_error != null || _alert == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Alert Details')),
        body: Center(
          child: ErrorState(
            message: _error ?? 'Alert not found',
            onRetry: _loadAlert,
          ),
        ),
      );
    }

    final alert = _alert!;
    final colorScheme = Theme.of(context).colorScheme;
    final severityColor = _getSeverityColor(alert.severity);
    final currentUser = ref.watch(currentUserProvider);
    final canResolve = currentUser != null && currentUser.canAccessAdmin;
    final hasCoordinates = alert.latitude != null && alert.longitude != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareAlert(context, alert),
            tooltip: 'Share alert',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Severity badge and type
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: severityColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: severityColor),
                    ),
                    child: Text(
                      alert.severity.displayName,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                        color: severityColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      alert.type.displayName,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(alert.status)
                          .withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getStatusColor(alert.status)
                            .withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      alert.status.displayName,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                        color: _getStatusColor(alert.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Title
              Text(
                alert.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 16),

              // Meta info
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _MetaRow(
                      icon: Icons.access_time,
                      label: 'Created',
                      value: _formatFullTimestamp(alert.createdAt),
                    ),
                    if (alert.updatedAt != alert.createdAt) ...[
                      const CardDivider(),
                      _MetaRow(
                        icon: Icons.update,
                        label: 'Updated',
                        value: _formatFullTimestamp(alert.updatedAt),
                      ),
                    ],
                    if (alert.expiresAt != null) ...[
                      const CardDivider(),
                      _MetaRow(
                        icon: Icons.schedule,
                        label: 'Expires',
                        value: _formatFullTimestamp(alert.expiresAt!),
                      ),
                    ],
                    const CardDivider(),
                    _MetaRow(
                      icon: Icons.location_on,
                      label: 'Location',
                      value: alert.locationName ?? 'Unknown',
                    ),
                    if (alert.buildingId != null) ...[
                      const CardDivider(),
                      _MetaRow(
                        icon: Icons.apartment,
                        label: 'Building',
                        value: alert.buildingId!,
                      ),
                    ],
                    if (alert.floor != null) ...[
                      const CardDivider(),
                      _MetaRow(
                        icon: Icons.layers,
                        label: 'Floor',
                        value: alert.floor.toString(),
                      ),
                    ],
                    if (alert.isTest) ...[
                      const CardDivider(),
                      _MetaRow(
                        icon: Icons.science,
                        label: 'Test/Drill',
                        value: 'Yes',
                        valueStyle: TextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    if (alert.latitude != null && alert.longitude != null) ...[
                      const CardDivider(),
                      _MetaRow(
                        icon: Icons.gps_fixed,
                        label: 'Coordinates',
                        value:
                            '${alert.latitude!.toStringAsFixed(6)}, ${alert.longitude!.toStringAsFixed(6)}',
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Instructions
              if (alert.instructions != null) ...[
                SectionHeader(
                  title: 'Instructions',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          alert.instructions!,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Message
              SectionHeader(
                title: 'Message',
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Text(
                  alert.message,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ),

              const SizedBox(height: 24),

              // Acknowledged by
              if (alert.acknowledgedBy.isNotEmpty) ...[
                SectionHeader(
                  title: 'Acknowledged By (${alert.acknowledgedBy.length})',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: alert.acknowledgedBy
                        .map(
                          (userId) => Chip(
                            label: Text(userId),
                            backgroundColor: colorScheme.primaryContainer,
                            labelStyle: TextStyle(color: colorScheme.primary),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Resolved info
              if (alert.resolvedBy != null) ...[
                SectionHeader(
                  title: 'Resolution',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MetaRow(
                        icon: Icons.verified,
                        label: 'Resolved by',
                        value: alert.resolvedBy!,
                      ),
                      if (alert.resolutionNotes != null) ...[
                        const CardDivider(),
                        _MetaRow(
                          icon: Icons.note,
                          label: 'Notes',
                          value: alert.resolutionNotes!,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Related alerts
              if (alert.relatedAlertIds.isNotEmpty) ...[
                SectionHeader(
                  title: 'Related Alerts (${alert.relatedAlertIds.length})',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                _RelatedAlertsSection(alertIds: alert.relatedAlertIds),
                const SizedBox(height: 24),
              ],

              // Action buttons
              if (alert.status == AlertStatus.active) ...[
                Row(
                  children: [
                    Expanded(
                      child: AppFilledButton(
                        onPressed: () => _acknowledgeAlert(alert),
                        label: 'Acknowledge',
                        icon: Icons.check_circle,
                        iconPosition: IconPosition.leading,
                        size: ButtonSize.large,
                        fullWidth: false,
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        semanticLabel: 'Acknowledge this alert',
                      ),
                    ),
                    if (canResolve) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppFilledButton(
                          onPressed: () => _showResolveDialog(context, alert),
                          label: 'Resolve',
                          icon: Icons.verified,
                          iconPosition: IconPosition.leading,
                          size: ButtonSize.large,
                          fullWidth: false,
                          semanticLabel: 'Resolve this alert',
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 12),
              ],

              // Map and Share buttons
              Row(
                children: [
                  if (hasCoordinates) ...[
                    Expanded(
                      child: AppOutlinedButton(
                        onPressed: () => _openMap(context, alert),
                        label: 'Show on Map',
                        icon: Icons.map,
                        iconPosition: IconPosition.leading,
                        size: ButtonSize.large,
                        fullWidth: false,
                        semanticLabel: 'Show alert location on map',
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: () => _shareAlert(context, alert),
                      label: 'Share',
                      icon: Icons.share,
                      iconPosition: IconPosition.leading,
                      size: ButtonSize.large,
                      fullWidth: false,
                      semanticLabel: 'Share this alert',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// Related alerts section widget
// ============================================================================

class _RelatedAlertsSection extends ConsumerWidget {
  const _RelatedAlertsSection({required this.alertIds});

  final List<String> alertIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(alertsRepositoryProvider);

    return FutureBuilder<List<Alert>>(
      future: _fetchRelatedAlerts(repository),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 100,
            child: Center(
              child: InlineLoading(message: 'Loading related alerts...'),
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final alerts = snapshot.data!;
        return Column(
          children: alerts
              .map((alert) => _RelatedAlertTile(alert: alert))
              .toList(),
        );
      },
    );
  }

  Future<List<Alert>> _fetchRelatedAlerts(AlertsRepository repository) async {
    final alerts = <Alert>[];
    for (final id in alertIds.take(5)) {
      // Limit to 5 related alerts
      final result = await repository.getAlert(id);
      if (result.isSuccess) {
        alerts.add(result.value);
      }
    }
    return alerts;
  }
}

class _RelatedAlertTile extends StatelessWidget {
  const _RelatedAlertTile({required this.alert});

  final Alert alert;

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.emergency:
        return Colors.red;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.warning:
        return Colors.amber;
      case AlertSeverity.info:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final severityColor = _getSeverityColor(alert.severity);

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      onTap: () => context.push(AppRoutes.alertDetailRoute(alert.id)),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: severityColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  alert.message,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Create Alert Screen for admin/security users
// ============================================================================

class CreateAlertScreen extends ConsumerStatefulWidget {
  const CreateAlertScreen({super.key});

  @override
  ConsumerState<CreateAlertScreen> createState() => _CreateAlertScreenState();
}

class _CreateAlertScreenState extends ConsumerState<CreateAlertScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _locationController = TextEditingController();

  AlertType _selectedType = AlertType.other;
  AlertSeverity _selectedSeverity = AlertSeverity.warning;
  final List<String> _targetRoles = [];
  final List<String> _targetBuildingIds = [];
  DateTime? _expiresAt;
  bool _isTest = false;
  bool _isSubmitting = false;

  static const List<String> _allRoles = [
    'student',
    'faculty',
    'security',
    'admin',
  ];
  static const List<String> _allBuildings = [
    'building_a',
    'building_b',
    'building_c',
    'main_campus',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    _instructionsController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Alert'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                SectionHeader(
                  title: 'Alert Details',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Title *',
                          hintText: 'Enter alert title',
                          prefixIcon: Icon(Icons.title),
                        ),
                        validator: (value) =>
                            value?.isEmpty ?? true ? 'Title is required' : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          labelText: 'Message *',
                          hintText: 'Enter alert message',
                          prefixIcon: Icon(Icons.message),
                        ),
                        maxLines: 3,
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Message is required'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _locationController,
                        decoration: const InputDecoration(
                          labelText: 'Location Name',
                          hintText:
                              'e.g., Main Campus, Building A',
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Type and Severity
                SectionHeader(
                  title: 'Classification',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      DropdownButtonFormField<AlertType>(
                        initialValue: _selectedType,
                        decoration: const InputDecoration(
                          labelText: 'Alert Type *',
                          prefixIcon: Icon(Icons.category),
                        ),
                        items: AlertType.values.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(type.displayName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedType = value;
                              _selectedSeverity = value.defaultSeverity;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<AlertSeverity>(
                        initialValue: _selectedSeverity,
                        decoration: const InputDecoration(
                          labelText: 'Severity *',
                          prefixIcon: Icon(Icons.priority_high),
                        ),
                        items: AlertSeverity.values.map((severity) {
                          return DropdownMenuItem(
                            value: severity,
                            child: Text(severity.displayName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedSeverity = value);
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _isTest,
                            onChanged: (value) =>
                                setState(() => _isTest = value ?? false),
                          ),
                          const Text('Test/Drill Alert'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Target Audience
                SectionHeader(
                  title: 'Target Audience',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roles',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _allRoles.map((role) {
                          final isSelected = _targetRoles.contains(role);
                          return AppFilterChip(
                            label: role.toUpperCase(),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _targetRoles.add(role);
                                } else {
                                  _targetRoles.remove(role);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Buildings (optional)',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _allBuildings.map((building) {
                          final isSelected = _targetBuildingIds.contains(
                            building,
                          );
                          return AppFilterChip(
                            label: building.replaceAll('_', ' ').toUpperCase(),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  _targetBuildingIds.add(building);
                                } else {
                                  _targetBuildingIds.remove(building);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Instructions
                SectionHeader(
                  title: 'Instructions (Optional)',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: _instructionsController,
                    decoration: const InputDecoration(
                      labelText: 'User Instructions',
                      hintText:
                          'e.g., Follow evacuation route to assembly point',
                      prefixIcon: Icon(Icons.info_outline),
                    ),
                    maxLines: 3,
                  ),
                ),

                const SizedBox(height: 24),

                // Expiration
                SectionHeader(
                  title: 'Expiration (Optional)',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _expiresAt == null
                              ? 'No expiration set'
                              : 'Expires: ${_expiresAt!.day}/${_expiresAt!.month}/${_expiresAt!.year} ${_expiresAt!.hour.toString().padLeft(2, '0')}:${_expiresAt!.minute.toString().padLeft(2, '0')}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      AppTextButton(
                        onPressed: _pickExpiration,
                        label: _expiresAt == null ? 'Set Expiration' : 'Change',
                        icon: Icons.calendar_today,
                        iconPosition: IconPosition.leading,
                        fullWidth: false,
                        semanticLabel: _expiresAt == null
                            ? 'Set expiration date and time'
                            : 'Change expiration date and time',
                      ),
                      if (_expiresAt != null) ...[
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () => setState(() => _expiresAt = null),
                          icon: const Icon(Icons.clear),
                          tooltip: 'Clear expiration',
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Submit button
                AppFilledButton(
                  onPressed: _isSubmitting ? null : _submitAlert,
                  label: _isSubmitting ? 'Creating...' : 'Create Alert',
                  icon: _isSubmitting ? null : Icons.send,
                  iconPosition: IconPosition.leading,
                  isLoading: _isSubmitting,
                  size: ButtonSize.large,
                  fullWidth: false,
                  semanticLabel: 'Create and submit alert',
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickExpiration() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _expiresAt ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null && mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          _expiresAt ?? DateTime.now().add(const Duration(hours: 1)),
        ),
      );
      if (time != null && mounted) {
        setState(() {
          _expiresAt = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _submitAlert() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final currentUser = ref.read(currentUserProvider);
    if (currentUser == null) {
      _showError('User not authenticated');
      return;
    }

    final alert = Alert(
      id: 'alert_${DateTime.now().millisecondsSinceEpoch}',
      title: _titleController.text.trim(),
      message: _messageController.text.trim(),
      type: _selectedType,
      severity: _selectedSeverity,
      status: AlertStatus.active,
      locationName: _locationController.text.trim().isEmpty
          ? null
          : _locationController.text.trim(),
      createdBy: currentUser.id,
      createdByRole: currentUser.role.name,
      instructions: _instructionsController.text.trim().isEmpty
          ? null
          : _instructionsController.text.trim(),
      targetRoles: _targetRoles,
      targetBuildingIds: _targetBuildingIds,
      expiresAt: _expiresAt,
      isTest: _isTest,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final repository = ref.read(alertsRepositoryProvider);
    final result = await repository.createAlert(alert);

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (result.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Alert created successfully'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      } else {
        _showError('Failed to create alert: ${result.failure.message}');
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
