/// SAFENAV CAVITE - Alerts Screen
///
/// Alerts and notifications screen with filtering, search,
/// and detailed alert views.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../../shared/models/alert.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Mock alerts data - in production this would come from a provider
    final alerts = _getMockAlerts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
        centerTitle: true,
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
            if (_selectedSeverity != null || _selectedType != null || _searchQuery.isNotEmpty)
              _buildActiveFilters(context),

            // Alerts list
            Expanded(
              child: _buildAlertsList(context, alerts),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToCreateAlert(context),
        icon: const Icon(Icons.add_alert),
        label: const Text('New Alert'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildFilterTabs(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(text: 'All'),
        Tab(text: 'Unread'),
        Tab(text: 'Critical'),
      ],
      labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w400,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
    );
  }

  Widget _buildActiveFilters(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final filters = <Widget>[];

    if (_selectedSeverity != null) {
      filters.add(_FilterChip(
        label: _selectedSeverity!.displayName,
        color: _getSeverityColor(_selectedSeverity!),
        onDeleted: () => setState(() => _selectedSeverity = null),
      ));
    }

    if (_selectedType != null) {
      filters.add(_FilterChip(
        label: _selectedType!.displayName,
        color: colorScheme.primary,
        onDeleted: () => setState(() => _selectedType = null),
      ));
    }

    if (_searchQuery.isNotEmpty) {
      filters.add(_FilterChip(
        label: 'Search: "$_searchQuery"',
        color: colorScheme.tertiary,
        onDeleted: () => setState(() => _searchQuery = ''),
      ));
    }

    if (filters.isNotEmpty) {
      filters.add(
        TextButton.icon(
          onPressed: () => setState(() {
            _selectedSeverity = null;
            _selectedType = null;
            _searchQuery = '';
          }),
          icon: const Icon(Icons.clear_all, size: 16),
          label: const Text('Clear all'),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: filters,
      ),
    );
  }

  Widget _buildAlertsList(BuildContext context, List<Alert> alerts) {
    final filteredAlerts = _filterAlerts(alerts);

    if (filteredAlerts.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: filteredAlerts.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final alert = filteredAlerts[index];
        return _AlertTile(
          alert: alert,
          onTap: () => _navigateToAlertDetail(context, alert),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: EmptyState(
          icon: Icons.notifications_none,
          title: 'No Alerts',
          message: _selectedSeverity != null || _selectedType != null || _searchQuery.isNotEmpty
              ? 'No alerts match your current filters.'
              : 'You\'re all caught up! No active alerts at this time.',
          action: (_selectedSeverity != null || _selectedType != null || _searchQuery.isNotEmpty)
              ? () => setState(() {
                    _selectedSeverity = null;
                    _selectedType = null;
                    _searchQuery = '';
                  })
              : null,
          actionLabel: (_selectedSeverity != null || _selectedType != null || _searchQuery.isNotEmpty)
              ? 'Clear Filters'
              : null,
        ),
      ),
    );
  }

  List<Alert> _filterAlerts(List<Alert> alerts) {
    return alerts.where((alert) {
      if (_selectedSeverity != null && alert.severity != _selectedSeverity) {
        return false;
      }
      if (_selectedType != null && alert.type != _selectedType) {
        return false;
      }
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        if (!alert.title.toLowerCase().contains(query) &&
            !alert.message.toLowerCase().contains(query)) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  List<Alert> _getMockAlerts() {
    final now = DateTime.now();
    return [
      Alert(
        id: 'alert_1',
        title: 'Campus Emergency Drill',
        message: 'Scheduled fire drill at 10:00 AM today. Please follow evacuation procedures.',
        type: AlertType.fire,
        severity: AlertSeverity.emergency,
        status: AlertStatus.active,
        locationName: 'Main Campus',
        createdAt: now.subtract(const Duration(hours: 2)),
        updatedAt: now.subtract(const Duration(hours: 2)),
        instructions: 'Follow the nearest evacuation route to the assembly point.',
        evacuationRouteId: 'drill-2024',
        isTest: true,
        targetRoles: ['student', 'faculty', 'staff'],
      ),
      Alert(
        id: 'alert_2',
        title: 'Building Maintenance',
        message: 'Building A will be closed for maintenance on Saturday. Alternative routes available.',
        type: AlertType.infrastructure,
        severity: AlertSeverity.warning,
        status: AlertStatus.active,
        locationName: 'Building A',
        createdAt: now.subtract(const Duration(hours: 5)),
        updatedAt: now.subtract(const Duration(hours: 5)),
        targetBuildingIds: ['building_a'],
      ),
      Alert(
        id: 'alert_3',
        title: 'Weather Advisory',
        message: 'Heavy rain expected this afternoon. Carry umbrellas and avoid flooded areas.',
        type: AlertType.weather,
        severity: AlertSeverity.info,
        status: AlertStatus.acknowledged,
        locationName: 'All Campus',
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(days: 1)),
        acknowledgedBy: ['current_user'],
      ),
      Alert(
        id: 'alert_4',
        title: 'Security Alert',
        message: 'Suspicious activity reported near Gate 3. Security personnel dispatched.',
        type: AlertType.suspiciousActivity,
        severity: AlertSeverity.critical,
        status: AlertStatus.active,
        locationName: 'Gate 3',
        createdAt: now.subtract(const Duration(days: 1, hours: 3)),
        updatedAt: now.subtract(const Duration(days: 1, hours: 3)),
        targetRoles: ['security', 'staff'],
      ),
      Alert(
        id: 'alert_5',
        title: 'System Maintenance',
        message: 'WiFi will be intermittent from 11 PM - 2 AM for scheduled upgrades.',
        type: AlertType.infrastructure,
        severity: AlertSeverity.info,
        status: AlertStatus.expired,
        locationName: 'IT Services',
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(days: 2)),
        expiresAt: now.subtract(const Duration(days: 1)),
      ),
      Alert(
        id: 'alert_6',
        title: 'Event Announcement',
        message: 'University Foundation Day celebration this Friday. Special campus access rules apply.',
        type: AlertType.other,
        severity: AlertSeverity.info,
        status: AlertStatus.active,
        locationName: 'Student Center',
        createdAt: now.subtract(const Duration(days: 3)),
        updatedAt: now.subtract(const Duration(days: 3)),
        tags: ['event', 'announcement'],
      ),
      Alert(
        id: 'alert_7',
        title: 'Power Outage',
        message: 'Temporary power outage in Building C. Emergency lighting activated.',
        type: AlertType.infrastructure,
        severity: AlertSeverity.critical,
        status: AlertStatus.active,
        locationName: 'Building C',
        createdAt: now.subtract(const Duration(days: 4)),
        updatedAt: now.subtract(const Duration(days: 4)),
        targetBuildingIds: ['building_c'],
        instructions: 'Use emergency exits. Do not use elevators.',
      ),
      Alert(
        id: 'alert_8',
        title: 'New Safety Protocol',
        message: 'Updated COVID-19 safety guidelines effective Monday. Please review.',
        type: AlertType.other,
        severity: AlertSeverity.info,
        status: AlertStatus.acknowledged,
        locationName: 'Health Services',
        createdAt: now.subtract(const Duration(days: 5)),
        updatedAt: now.subtract(const Duration(days: 5)),
        acknowledgedBy: ['current_user'],
      ),
    ];
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
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              setState(() => _searchQuery = controller.text);
              Navigator.pop(context);
            },
            child: const Text('Search'),
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
                  return FilterChip(
                    label: Text(severity.displayName),
                    selected: isSelected,
                    selectedColor: _getSeverityColor(severity).withValues(alpha: 0.2),
                    checkmarkColor: _getSeverityColor(severity),
                    onSelected: (selected) {
                      setStateDialog(() => tempSeverity = selected ? severity : null);
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
                  return FilterChip(
                    label: Text(type.displayName),
                    selected: isSelected,
                    selectedColor: colorScheme.primaryContainer,
                    checkmarkColor: colorScheme.primary,
                    onSelected: (selected) {
                      setStateDialog(() => tempType = selected ? type : null);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _selectedSeverity = null;
                _selectedType = null;
              });
              Navigator.pop(context);
            },
            child: const Text('Clear All'),
          ),
          FilledButton(
            onPressed: () {
              setState(() {
                _selectedSeverity = tempSeverity;
                _selectedType = tempType;
              });
              Navigator.pop(context);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  void _navigateToAlertDetail(BuildContext context, Alert alert) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlertDetailScreen(alert: alert),
      ),
    );
  }

  void _navigateToCreateAlert(BuildContext context) {
    // TODO: Navigate to create alert screen (admin only)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Create alert - Admin only feature'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

/// Alert tile widget
class _AlertTile extends StatelessWidget {
  const _AlertTile({
    required this.alert,
    required this.onTap,
  });

  final Alert alert;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final severityColor = _getSeverityColor(alert.severity);
    final isUnread = alert.status == AlertStatus.active;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Severity indicator
          Container(
            width: 4,
            height: 48,
            decoration: BoxDecoration(
              color: severityColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Type badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        alert.type.displayName,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Status badge
                    if (alert.status != AlertStatus.active)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: _getStatusColor(alert.status).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _getStatusColor(alert.status).withValues(alpha: 0.5),
                          ),
                        ),
                        child: Text(
                          alert.status.displayName,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: _getStatusColor(alert.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    const Spacer(),
                    // Unread indicator
                    if (isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: severityColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  alert.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isUnread ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  alert.message,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatTimestamp(alert.createdAt),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (alert.locationName != null) ...[
                      const SizedBox(width: 16),
                      Icon(
                        Icons.location_on,
                        size: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          alert.locationName!,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
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
}

/// Alert detail screen
class AlertDetailScreen extends StatelessWidget {
  const AlertDetailScreen({super.key, required this.alert});

  final Alert alert;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final severityColor = _getSeverityColor(alert.severity);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Details'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
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
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: severityColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: severityColor),
                    ),
                    child: Text(
                      alert.severity.displayName,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: severityColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      alert.type.displayName,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getStatusColor(alert.status).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getStatusColor(alert.status).withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      alert.status.displayName,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.5,
                          ),
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
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                  ),
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
                    children: alert.acknowledgedBy.map((userId) => Chip(
                      label: Text(userId),
                      backgroundColor: colorScheme.primaryContainer,
                      labelStyle: TextStyle(color: colorScheme.primary),
                    )).toList(),
                  ),
                ),
                const SizedBox(height: 24),
              ],

              const SizedBox(height: 32),
            ],
          ),
        ),
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
}

/// Meta row for alert details
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
    return Row(
      children: [
        Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: valueStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

/// Filter chip for active filters
class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.color,
    required this.onDeleted,
  });

  final String label;
  final Color color;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onDeleted,
            child: Icon(
              Icons.close,
              size: 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}