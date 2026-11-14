/// SAFENAV CAVITE - Admin Dashboard Screen
///
/// Main admin dashboard with tabs for Analytics, Alerts, Evacuation,
/// User Management, and System Settings.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../data/providers/admin_providers.dart';
import '../../../../shared/models/user.dart';
import '../../../../shared/models/alert.dart';
import '../../../../shared/models/evacuation_graph.dart';

/// Admin dashboard screen - accessible only to admin/security users
class AdminDashboardScreen extends ConsumerStatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  ConsumerState<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends ConsumerState<AdminDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: AdminTab.values.length, vsync: this);

    // Sync tab controller with provider
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        ref.read(adminDashboardProvider.notifier).setTab(AdminTab.values[_tabController.index]);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dashboardState = ref.watch(adminDashboardProvider);

    // Sync tab controller with provider state
    if (dashboardState.currentTab.index != _tabController.index) {
      _tabController.animateTo(dashboardState.currentTab.index);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
          indicatorColor: colorScheme.primary,
          indicatorWeight: 3,
          tabs: AdminTab.values.map((tab) => Tab(
            icon: Icon(tab.icon, size: 20),
            text: tab.displayName,
          )).toList(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _refreshAllData(),
            tooltip: 'Refresh all data',
          ),
        ],
      ),
      body: dashboardState.isLoading
          ? const LoadingOverlay(message: 'Loading dashboard...')
          : dashboardState.error != null
              ? ErrorState(
                  message: dashboardState.error!,
                  onRetry: _refreshAllData,
                )
              : TabBarView(
                  controller: _tabController,
                  children: const [
                    _AnalyticsTab(),
                    _AlertsTab(),
                    _EvacuationTab(),
                    _UsersTab(),
                    _SettingsTab(),
                  ],
                ),
    );
  }

  void _refreshAllData() {
    ref.read(adminDashboardProvider.notifier).setLoading(true);
    ref.invalidate(adminAnalyticsProvider);
    ref.invalidate(adminAlertsProvider);
    ref.invalidate(adminUsersProvider);
    ref.invalidate(adminEvacuationGraphsProvider);
    ref.invalidate(adminSettingsProvider);

    // Simulate refresh delay
    Future.delayed(const Duration(milliseconds: 500), () {
      ref.read(adminDashboardProvider.notifier).setLoading(false);
    });
  }
}

/// Analytics tab - Overview of key metrics
class _AnalyticsTab extends ConsumerWidget {
  const _AnalyticsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(adminAnalyticsProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(adminAnalyticsProvider),
      child: analyticsAsync.when(
        data: (analytics) => _buildAnalyticsContent(context, analytics),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorState(
          message: 'Failed to load analytics: $error',
          onRetry: () => ref.invalidate(adminAnalyticsProvider),
        ),
      ),
    );
  }

  Widget _buildAnalyticsContent(BuildContext context, AdminAnalytics analytics) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Key metrics cards
          SectionHeader(
            title: 'Key Metrics',
            icon: Icons.analytics_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildMetricsGrid(context, analytics),

          const SizedBox(height: 24),

          // User role distribution
          SectionHeader(
            title: 'User Distribution',
            icon: Icons.people_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildUserDistribution(context, analytics),

          const SizedBox(height: 24),

          // Alerts breakdown
          SectionHeader(
            title: 'Alerts Breakdown',
            icon: Icons.warning_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildAlertsBreakdown(context, analytics),

          const SizedBox(height: 24),

          // Recent activity
          SectionHeader(
            title: 'Recent Activity',
            icon: Icons.history_outlined,
            style: SectionHeaderStyle.standard,
            action: TextButton(
              onPressed: () {
                // TODO: Show full activity log
              },
              child: const Text('View All'),
            ),
          ),
          const SizedBox(height: 12),
          _buildRecentActivity(context, analytics.recentActivity),
        ],
      ),
    );
  }

  Widget _buildMetricsGrid(BuildContext context, AdminAnalytics analytics) {
    final metrics = [
      _MetricData(
        label: 'Total Users',
        value: analytics.totalUsers.toString(),
        icon: Icons.people,
        color: Colors.blue,
        trend: '+5.2%',
        trendPositive: true,
      ),
      _MetricData(
        label: 'Active Users (24h)',
        value: analytics.activeUsers.toString(),
        icon: Icons.person_outline,
        color: Colors.green,
        trend: '+2.1%',
        trendPositive: true,
      ),
      _MetricData(
        label: 'Active Alerts',
        value: analytics.activeAlerts.toString(),
        icon: Icons.warning_amber,
        color: analytics.activeAlerts > 0 ? Colors.red : Colors.green,
        trend: analytics.activeAlerts > 0 ? 'Needs attention' : 'All clear',
        trendPositive: analytics.activeAlerts == 0,
      ),
      _MetricData(
        label: 'Resolved Today',
        value: analytics.resolvedAlertsToday.toString(),
        icon: Icons.check_circle,
        color: Colors.purple,
        trend: '+12%',
        trendPositive: true,
      ),
      _MetricData(
        label: 'Buildings',
        value: analytics.totalBuildings.toString(),
        icon: Icons.apartment,
        color: Colors.orange,
        trend: '—',
        trendPositive: true,
      ),
      _MetricData(
        label: 'Pathways',
        value: analytics.totalPathways.toString(),
        icon: Icons.directions_walk,
        color: Colors.teal,
        trend: '+3 new',
        trendPositive: true,
      ),
      _MetricData(
        label: 'Evacuation Graphs',
        value: analytics.evacuationGraphs.toString(),
        icon: Icons.route,
        color: Colors.indigo,
        trend: 'v3 latest',
        trendPositive: true,
      ),
      _MetricData(
        label: 'Avg Response Time',
        value: '${analytics.averageResponseTimeMinutes.toStringAsFixed(1)} min',
        icon: Icons.timer,
        color: Colors.amber,
        trend: '-0.5 min',
        trendPositive: true,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) => _MetricCard(metric: metrics[index]),
    );
  }

  Widget _buildUserDistribution(BuildContext context, AdminAnalytics analytics) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: analytics.userRoleDistribution.entries.map((entry) {
          final role = entry.key;
          final count = entry.value;
          final percentage = analytics.totalUsers > 0
              ? (count / analytics.totalUsers * 100).toStringAsFixed(1)
              : '0.0';
          final color = _getRoleColor(role);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.displayName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: analytics.totalUsers > 0 ? count / analytics.totalUsers : 0,
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        color: color,
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$count ($percentage%)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAlertsBreakdown(BuildContext context, AdminAnalytics analytics) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'By Severity',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ...analytics.alertsBySeverity.entries.map((entry) {
                  final severity = entry.key;
                  final count = entry.value;
                  final color = _getSeverityColor(severity);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            severity.displayName,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            count.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'By Type',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                ...analytics.alertsByType.entries
                    .where((e) => e.value > 0)
                    .take(5)
                    .map((entry) {
                  final type = entry.key;
                  final count = entry.value;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Icon(
                          _getAlertTypeIcon(type),
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            type.displayName,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          count.toString(),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity(BuildContext context, List<AdminActivity> activities) {
    if (activities.isEmpty) {
      return const ContentEmptyState(
        icon: Icons.history,
        title: 'No recent activity',
      );
    }

    return Column(
      children: activities.map((activity) => _ActivityTile(activity: activity)).toList(),
    );
  }

  Color _getRoleColor(UserRole role) {
    switch (role) {
      case UserRole.student:
        return Colors.blue;
      case UserRole.faculty:
        return Colors.green;
      case UserRole.admin:
        return Colors.purple;
      case UserRole.security:
        return Colors.red;
    }
  }

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.info:
        return Colors.blue;
      case AlertSeverity.warning:
        return Colors.orange;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.emergency:
        return Colors.red.shade800;
    }
  }

  IconData _getAlertTypeIcon(AlertType type) {
    switch (type) {
      case AlertType.fire:
        return Icons.local_fire_department;
      case AlertType.earthquake:
        return Icons.waves;
      case AlertType.flood:
        return Icons.water_drop;
      case AlertType.security:
        return Icons.security;
      case AlertType.medical:
        return Icons.medical_services;
      case AlertType.weather:
        return Icons.cloud;
      case AlertType.infrastructure:
        return Icons.build;
      case AlertType.suspiciousActivity:
        return Icons.visibility;
      case AlertType.evacuation:
        return Icons.directions_run;
      case AlertType.lockdown:
        return Icons.lock;
      case AlertType.allClear:
        return Icons.check_circle;
      case AlertType.test:
        return Icons.science;
      case AlertType.other:
        return Icons.help_outline;
    }
  }
}

/// Metric data for dashboard cards
class _MetricData {
  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final String trend;
  final bool trendPositive;

  const _MetricData({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
    required this.trendPositive,
  });
}

/// Metric card widget
class _MetricCard extends StatelessWidget {
  final _MetricData metric;

  const _MetricCard({required this.metric});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: () {
        // TODO: Show metric details
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: metric.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(metric.icon, color: metric.color, size: 20),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: metric.trendPositive
                      ? Colors.green.withValues(alpha: 0.15)
                      : Colors.red.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  metric.trend,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: metric.trendPositive ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            metric.value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            metric.label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Activity tile widget
class _ActivityTile extends StatelessWidget {
  final AdminActivity activity;

  const _ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: activity.type.color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(activity.type.icon, color: activity.type.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.type.displayName,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: activity.type.color,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  activity.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            _formatTime(activity.timestamp),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

/// Alerts tab - Alert management
class _AlertsTab extends ConsumerWidget {
  const _AlertsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alertsAsync = ref.watch(adminAlertsProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(adminAlertsProvider),
      child: alertsAsync.when(
        data: (alerts) => _buildAlertsList(context, alerts),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorState(
          message: 'Failed to load alerts: $error',
          onRetry: () => ref.invalidate(adminAlertsProvider),
        ),
      ),
    );
  }

  Widget _buildAlertsList(BuildContext context, List<Alert> alerts) {
    if (alerts.isEmpty) {
      return const ContentEmptyState(
        icon: Icons.notifications_none,
        title: 'No alerts',
        message: 'All clear! No active alerts at the moment.',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: alerts.length,
      itemBuilder: (context, index) => _AdminAlertTile(alert: alerts[index]),
    );
  }
}

/// Admin alert tile
class _AdminAlertTile extends ConsumerWidget {
  final Alert alert;

  const _AdminAlertTile({required this.alert});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final severityColor = _getSeverityColor(alert.severity);

    return AppElevatedCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: severityColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(_getAlertTypeIcon(alert.type), color: severityColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            alert.title,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppStatusChip(
                          label: alert.status.displayName,
                          severity: _statusToChipSeverity(alert.status),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${alert.type.displayName} • ${alert.severity.displayName}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _formatDateTime(alert.createdAt),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Message
          Text(
            alert.message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          const SizedBox(height: 8),

          // Meta info
          if (alert.locationName != null || alert.buildingId != null)
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                if (alert.locationName != null)
                  _MetaChip(
                    icon: Icons.location_on,
                    label: alert.locationName!,
                  ),
                if (alert.buildingId != null)
                  _MetaChip(
                    icon: Icons.apartment,
                    label: alert.buildingId!,
                  ),
                if (alert.floor != null)
                  _MetaChip(
                    icon: Icons.layers,
                    label: 'Floor ${alert.floor}',
                  ),
              ],
            ),

          const SizedBox(height: 12),

          // Actions
          Row(
            children: [
              if (alert.status == AlertStatus.active) ...[
                AppOutlinedButton(
                  onPressed: () => _acknowledgeAlert(alert, context),
                  label: 'Acknowledge',
                  icon: Icons.check,
                  iconPosition: IconPosition.leading,
                  size: ButtonSize.small,
                ),
                const SizedBox(width: 8),
              ],
              if (alert.status != AlertStatus.resolved) ...[
                AppOutlinedButton(
                  onPressed: () => _resolveAlert(alert, context),
                  label: 'Resolve',
                  icon: Icons.done_all,
                  iconPosition: IconPosition.leading,
                  size: ButtonSize.small,
                ),
                const SizedBox(width: 8),
              ],
              AppTextButton(
                onPressed: () => _viewAlertDetails(alert, context),
                label: 'Details',
                icon: Icons.info_outline,
                iconPosition: IconPosition.leading,
                size: ButtonSize.small,
              ),
              const Spacer(),
              AppChip(
                label: 'Created by ${alert.createdByRole ?? 'Unknown'}',
                icon: Icons.person_outline,
                backgroundColor: colorScheme.surfaceContainerHighest,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _acknowledgeAlert(Alert alert, BuildContext context) {
    // TODO: Implement acknowledge
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Acknowledged: ${alert.title}')),
    );
  }

  void _resolveAlert(Alert alert, BuildContext context) {
    // TODO: Implement resolve
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Resolved: ${alert.title}')),
    );
  }

  void _viewAlertDetails(Alert alert, BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _AlertDetailSheet(alert: alert),
    );
  }

  Color _getSeverityColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.info:
        return Colors.blue;
      case AlertSeverity.warning:
        return Colors.orange;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.emergency:
        return Colors.red.shade800;
    }
  }

  ChipSeverity _statusToChipSeverity(AlertStatus status) {
    switch (status) {
      case AlertStatus.active:
        return ChipSeverity.emergency;
      case AlertStatus.acknowledged:
        return ChipSeverity.warning;
      case AlertStatus.resolved:
        return ChipSeverity.success;
      case AlertStatus.expired:
        return ChipSeverity.info;
    }
  }

  IconData _getAlertTypeIcon(AlertType type) {
    switch (type) {
      case AlertType.fire:
        return Icons.local_fire_department;
      case AlertType.earthquake:
        return Icons.waves;
      case AlertType.flood:
        return Icons.water_drop;
      case AlertType.security:
        return Icons.security;
      case AlertType.medical:
        return Icons.medical_services;
      case AlertType.weather:
        return Icons.cloud;
      case AlertType.infrastructure:
        return Icons.build;
      case AlertType.suspiciousActivity:
        return Icons.visibility;
      case AlertType.evacuation:
        return Icons.directions_run;
      case AlertType.lockdown:
        return Icons.lock;
      case AlertType.allClear:
        return Icons.check_circle;
      case AlertType.test:
        return Icons.science;
      case AlertType.other:
        return Icons.help_outline;
    }
  }

  String _formatDateTime(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}

/// Meta chip for alert details
class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MetaChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Alert detail bottom sheet
class _AlertDetailSheet extends StatelessWidget {
  final Alert alert;

  const _AlertDetailSheet({required this.alert});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              SectionHeader(
                title: alert.title,
                icon: _getAlertTypeIcon(alert.type),
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 16),

              _buildDetailRow(context, 'Type', alert.type.displayName),
              _buildDetailRow(context, 'Severity', alert.severity.displayName),
              _buildDetailRow(context, 'Status', alert.status.displayName),
              _buildDetailRow(context, 'Created', alert.createdAt.toString()),
              _buildDetailRow(context, 'Updated', alert.updatedAt.toString()),
              if (alert.locationName != null) _buildDetailRow(context, 'Location', alert.locationName!),
              if (alert.buildingId != null) _buildDetailRow(context, 'Building', alert.buildingId!),
              if (alert.floor != null) _buildDetailRow(context, 'Floor', alert.floor.toString()),
              if (alert.affectedArea != null) _buildDetailRow(context, 'Area', alert.affectedArea!),
              if (alert.instructions != null) ...[
                const SizedBox(height: 16),
                SectionHeader(
                  title: 'Instructions',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 8),
                Text(
                  alert.instructions!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
              if (alert.resolutionNotes != null) ...[
                const SizedBox(height: 16),
                SectionHeader(
                  title: 'Resolution Notes',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 8),
                Text(
                  alert.resolutionNotes!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
              const SizedBox(height: 16),
              if (alert.targetRoles.isNotEmpty) ...[
                SectionHeader(
                  title: 'Target Roles',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: alert.targetRoles.map((role) => Chip(label: Text(role))).toList(),
                ),
              ],
              const SizedBox(height: 16),
              if (alert.acknowledgedBy.isNotEmpty) ...[
                SectionHeader(
                  title: 'Acknowledged By (${alert.acknowledgedBy.length})',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: alert.acknowledgedBy.map((id) => Chip(label: Text(id))).toList(),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getAlertTypeIcon(AlertType type) {
    switch (type) {
      case AlertType.fire:
        return Icons.local_fire_department;
      case AlertType.earthquake:
        return Icons.waves;
      case AlertType.flood:
        return Icons.water_drop;
      case AlertType.security:
        return Icons.security;
      case AlertType.medical:
        return Icons.medical_services;
      case AlertType.weather:
        return Icons.cloud;
      case AlertType.infrastructure:
        return Icons.build;
      case AlertType.suspiciousActivity:
        return Icons.visibility;
      case AlertType.evacuation:
        return Icons.directions_run;
      case AlertType.lockdown:
        return Icons.lock;
      case AlertType.allClear:
        return Icons.check_circle;
      case AlertType.test:
        return Icons.science;
      case AlertType.other:
        return Icons.help_outline;
    }
  }
}

/// Evacuation tab
class _EvacuationTab extends ConsumerWidget {
  const _EvacuationTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graphsAsync = ref.watch(adminEvacuationGraphsProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(adminEvacuationGraphsProvider),
      child: graphsAsync.when(
        data: (graphs) => _buildEvacuationContent(context, graphs),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorState(
          message: 'Failed to load evacuation data: $error',
          onRetry: () => ref.invalidate(adminEvacuationGraphsProvider),
        ),
      ),
    );
  }

  Widget _buildEvacuationContent(BuildContext context, List<EvacuationGraph> graphs) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary cards
          SectionHeader(
            title: 'Evacuation Graphs',
            icon: Icons.route_outlined,
            style: SectionHeaderStyle.standard,
            action: AppTextButton(
              onPressed: () {
                // TODO: Create new graph
              },
              label: 'Add Graph',
              icon: Icons.add,
              iconPosition: IconPosition.leading,
            ),
          ),
          const SizedBox(height: 12),
          ...graphs.map((graph) => _EvacuationGraphCard(graph: graph)),

          const SizedBox(height: 24),

          // Quick stats
          SectionHeader(
            title: 'Quick Stats',
            icon: Icons.analytics_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildQuickStats(context, graphs),
        ],
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context, List<EvacuationGraph> graphs) {
    final totalNodes = graphs.fold(0, (sum, g) => sum + g.nodeCount);
    final totalEdges = graphs.fold(0, (sum, g) => sum + g.edgeCount);
    final totalAssemblyPoints = graphs.fold(0, (sum, g) => sum + g.assemblyPoints.length);
    final totalShelters = graphs.fold(0, (sum, g) => sum + g.shelters.length);
    final totalExits = graphs.fold(0, (sum, g) => sum + g.exits.length);

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _StatCard(
          label: 'Total Nodes',
          value: totalNodes.toString(),
          icon: Icons.circle,
          color: Colors.blue,
        ),
        _StatCard(
          label: 'Total Edges',
          value: totalEdges.toString(),
          icon: Icons.linear_scale,
          color: Colors.green,
        ),
        _StatCard(
          label: 'Assembly Points',
          value: totalAssemblyPoints.toString(),
          icon: Icons.meeting_room,
          color: Colors.orange,
        ),
        _StatCard(
          label: 'Shelters',
          value: totalShelters.toString(),
          icon: Icons.home,
          color: Colors.purple,
        ),
        _StatCard(
          label: 'Exits',
          value: totalExits.toString(),
          icon: Icons.exit_to_app,
          color: Colors.red,
        ),
        _StatCard(
          label: 'Graphs',
          value: graphs.length.toString(),
          icon: Icons.map,
          color: Colors.indigo,
        ),
      ],
    );
  }
}

/// Evacuation graph card
class _EvacuationGraphCard extends StatelessWidget {
  final EvacuationGraph graph;

  const _EvacuationGraphCard({required this.graph});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      onTap: () {
        // TODO: Show graph details
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.map_outlined, color: colorScheme.primary, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      graph.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (graph.buildingId != null)
                      Text(
                        'Building: ${graph.buildingId}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'v${graph.version}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Updated ${_formatDate(graph.updatedAt)}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colorScheme.outline,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              _MiniStat(
                label: 'Nodes',
                value: graph.nodeCount.toString(),
                icon: Icons.circle,
              ),
              const SizedBox(width: 16),
              _MiniStat(
                label: 'Edges',
                value: graph.edgeCount.toString(),
                icon: Icons.linear_scale,
              ),
              const SizedBox(width: 16),
              _MiniStat(
                label: 'Assembly',
                value: graph.assemblyPoints.length.toString(),
                icon: Icons.meeting_room,
              ),
              const SizedBox(width: 16),
              _MiniStat(
                label: 'Exits',
                value: graph.exits.length.toString(),
                icon: Icons.exit_to_app,
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              AppOutlinedButton(
                onPressed: () {
                  // TODO: Edit graph
                },
                label: 'Edit',
                icon: Icons.edit_outlined,
                iconPosition: IconPosition.leading,
                size: ButtonSize.small,
              ),
              const SizedBox(width: 8),
              AppOutlinedButton(
                onPressed: () {
                  // TODO: View on map
                },
                label: 'View Map',
                icon: Icons.map_outlined,
                iconPosition: IconPosition.leading,
                size: ButtonSize.small,
              ),
              const SizedBox(width: 8),
              AppTextButton(
                onPressed: () {
                  // TODO: Duplicate
                },
                label: 'Duplicate',
                icon: Icons.content_copy,
                iconPosition: IconPosition.leading,
                size: ButtonSize.small,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays < 1) return 'Today';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${date.day}/${date.month}/${date.year}';
  }
}

/// Mini stat for evacuation card
class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _MiniStat({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stat card for quick stats
class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 16),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Users tab
class _UsersTab extends ConsumerWidget {
  const _UsersTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(adminUsersProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(adminUsersProvider),
      child: usersAsync.when(
        data: (users) => _buildUsersList(context, users),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => ErrorState(
          message: 'Failed to load users: $error',
          onRetry: () => ref.invalidate(adminUsersProvider),
        ),
      ),
    );
  }

  Widget _buildUsersList(BuildContext context, List<User> users) {
    if (users.isEmpty) {
      return const ContentEmptyState(
        icon: Icons.people_outline,
        title: 'No users found',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      itemBuilder: (context, index) => _AdminUserTile(user: users[index]),
    );
  }
}

/// Admin user tile
class _AdminUserTile extends StatelessWidget {
  final User user;

  const _AdminUserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final roleColor = _getRoleColor(user.role);

    return AppCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          AppAvatar(
            name: user.displayName,
            imageUrl: user.photoUrl,
            radius: 24,
            backgroundColor: roleColor.withValues(alpha: 0.15),
            foregroundColor: roleColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.displayName,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (!user.isActive)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Inactive',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  user.email,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    AppStatusChip(
                      label: user.role.displayName,
                      severity: _roleToChipSeverity(user.role),
                    ),
                    const SizedBox(width: 8),
                    if (user.idNumber != null)
                      AppChip(
                        label: user.idNumber!,
                        icon: Icons.badge,
                        backgroundColor: colorScheme.surfaceContainerHighest,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatLastLogin(user.lastLoginAt),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.outline,
                ),
              ),
              const SizedBox(height: 8),
              PopupMenuButton<String>(
                onSelected: (value) => _handleAction(value, context),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit_role',
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined, size: 18),
                        SizedBox(width: 8),
                        Text('Change Role'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: user.isActive ? 'deactivate' : 'activate',
                    child: Row(
                      children: [
                        Icon(user.isActive ? Icons.block : Icons.check_circle,
                            size: 18, color: user.isActive ? Colors.red : Colors.green),
                        const SizedBox(width: 8),
                        Text(user.isActive ? 'Deactivate' : 'Activate'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'view_details',
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, size: 18),
                        SizedBox(width: 8),
                        Text('View Details'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleAction(String action, BuildContext context) {
    switch (action) {
      case 'edit_role':
        // TODO: Show role change dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Change role for ${user.displayName} - TODO')),
        );
        break;
      case 'deactivate':
        // TODO: Deactivate user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Deactivated ${user.displayName} - TODO')),
        );
        break;
      case 'activate':
        // TODO: Activate user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Activated ${user.displayName} - TODO')),
        );
        break;
      case 'view_details':
        // TODO: Show user details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('View details for ${user.displayName} - TODO')),
        );
        break;
    }
  }

  Color _getRoleColor(UserRole role) {
    switch (role) {
      case UserRole.student:
        return Colors.blue;
      case UserRole.faculty:
        return Colors.green;
      case UserRole.admin:
        return Colors.purple;
      case UserRole.security:
        return Colors.red;
    }
  }

  ChipSeverity _roleToChipSeverity(UserRole role) {
    switch (role) {
      case UserRole.student:
        return ChipSeverity.info;
      case UserRole.faculty:
        return ChipSeverity.success;
      case UserRole.admin:
        return ChipSeverity.warning;
      case UserRole.security:
        return ChipSeverity.error;
    }
  }

  String _formatLastLogin(DateTime? lastLogin) {
    if (lastLogin == null) return 'Never';
    final now = DateTime.now();
    final diff = now.difference(lastLogin);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

/// Settings tab
class _SettingsTab extends ConsumerStatefulWidget {
  const _SettingsTab();

  @override
  ConsumerState<_SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends ConsumerState<_SettingsTab> {
  late final TextEditingController _maintenanceMessageController;

  @override
  void initState() {
    super.initState();
    _maintenanceMessageController = TextEditingController();
  }

  @override
  void dispose() {
    _maintenanceMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final settings = ref.watch(adminSettingsProvider);

    // Initialize the controller with the current maintenance message
    if (_maintenanceMessageController.text.isNotEmpty &&
        _maintenanceMessageController.text != settings.maintenanceMessage) {
      // Only update if different to avoid cursor position issues
    } else if (_maintenanceMessageController.text.isEmpty) {
      _maintenanceMessageController.text = settings.maintenanceMessage;
    }

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(adminSettingsProvider),
      child: _buildSettingsContent(context, settings, ref),
    );
  }

  Widget _buildSettingsContent(BuildContext context, AdminSettings settings, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Notifications section
          SectionHeader(
            title: 'Notifications',
            icon: Icons.notifications_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _SettingsSwitchTile(
                  title: 'Push Notifications',
                  subtitle: 'Send push notifications to users',
                  value: settings.pushNotificationsEnabled,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(pushNotificationsEnabled: v), context),
                ),
                const CardDivider(),
                _SettingsSwitchTile(
                  title: 'Email Notifications',
                  subtitle: 'Send email notifications for alerts',
                  value: settings.emailNotificationsEnabled,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(emailNotificationsEnabled: v), context),
                ),
                const CardDivider(),
                _SettingsSwitchTile(
                  title: 'SMS Notifications',
                  subtitle: 'Send SMS for critical/emergency alerts',
                  value: settings.smsNotificationsEnabled,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(smsNotificationsEnabled: v), context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Alert settings section
          SectionHeader(
            title: 'Alert Settings',
            icon: Icons.warning_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _SettingsSwitchTile(
                  title: 'Auto-expire Alerts',
                  subtitle: 'Automatically expire alerts after set duration',
                  value: settings.autoExpireAlerts,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(autoExpireAlerts: v), context),
                ),
                const CardDivider(),
                _SettingsSwitchTile(
                  title: 'Require Acknowledgment',
                  subtitle: 'Users must acknowledge critical/emergency alerts',
                  value: settings.requireAlertAcknowledgment,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(requireAlertAcknowledgment: v), context),
                ),
                const CardDivider(),
                _SettingsSwitchTile(
                  title: 'Allow Test Alerts',
                  subtitle: 'Allow creation of test/drill alerts',
                  value: settings.allowTestAlerts,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(allowTestAlerts: v), context),
                ),
                const CardDivider(),
                _SettingsNumberTile(
                  title: 'Alert Expiry (hours)',
                  subtitle: 'Hours before alerts auto-expire',
                  value: settings.alertExpiryHours,
                  min: 1,
                  max: 168,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(alertExpiryHours: v), context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Map settings section
          SectionHeader(
            title: 'Map Settings',
            icon: Icons.map_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _SettingsSwitchTile(
                  title: 'Offline Mode',
                  subtitle: 'Cache map tiles for offline use',
                  value: settings.mapOfflineModeEnabled,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(mapOfflineModeEnabled: v), context),
                ),
                const CardDivider(),
                _SettingsSwitchTile(
                  title: 'Auto-update Evacuation Graphs',
                  subtitle: 'Automatically check for graph updates',
                  value: settings.autoUpdateEvacuationGraphs,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(autoUpdateEvacuationGraphs: v), context),
                ),
                const CardDivider(),
                _SettingsNumberTile(
                  title: 'Max Cache Size (MB)',
                  subtitle: 'Maximum storage for offline map tiles',
                  value: settings.mapCacheMaxSizeMB,
                  min: 50,
                  max: 2000,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(mapCacheMaxSizeMB: v), context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Emergency contacts section
          SectionHeader(
            title: 'Emergency Contacts',
            icon: Icons.contact_phone_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _SettingsNumberTile(
                  title: 'Contact Refresh (days)',
                  subtitle: 'Days before prompting to update emergency contacts',
                  value: settings.emergencyContactRefreshDays,
                  min: 30,
                  max: 365,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(emergencyContactRefreshDays: v), context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Maintenance mode
          SectionHeader(
            title: 'System',
            icon: Icons.settings_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _SettingsSwitchTile(
                  title: 'Maintenance Mode',
                  subtitle: 'Disable non-essential features during maintenance',
                  value: settings.maintenanceMode,
                  onChanged: (v) => _updateSettings(ref, settings.copyWith(maintenanceMode: v), context),
                  activeColor: Colors.orange,
                ),
                if (settings.maintenanceMode) ...[
                  const SizedBox(height: 16),
                  TextField(
                    controller: _maintenanceMessageController,
                    decoration: InputDecoration(
                      labelText: 'Maintenance Message',
                      hintText: 'Message shown to users during maintenance',
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 2,
                    onChanged: (v) => _updateSettings(ref, settings.copyWith(maintenanceMessage: v), context),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _updateSettings(WidgetRef ref, AdminSettings settings, BuildContext context) {
    // In a real app, this would save to backend
    // For now, just update the provider
    ref.read(adminSettingsProvider.notifier).updateSettings(settings);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Settings updated')),
    );
  }
}

/// Settings switch tile
class _SettingsSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;

  const _SettingsSwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
      value: value,
      onChanged: onChanged,
      activeThumbColor: activeColor,
      contentPadding: EdgeInsets.zero,
    );
  }
}

/// Settings number tile
class _SettingsNumberTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const _SettingsNumberTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
      trailing: SizedBox(
        width: 100,
        child: TextFormField(
          initialValue: value.toString(),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          onFieldSubmitted: (v) {
            final parsed = int.tryParse(v);
            if (parsed != null && parsed >= min && parsed <= max) {
              onChanged(parsed);
            }
          },
        ),
      ),
    );
  }
}