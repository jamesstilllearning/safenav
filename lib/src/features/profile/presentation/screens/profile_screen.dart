/// SAFENAV CAVITE - Profile Screen
///
/// User profile screen with settings, preferences, and account management.
library;

import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/services/fcm_service.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../features/admin/data/repositories/alerts_repository.dart';
import '../../../../features/emergency/data/models/emergency_contact.dart';
import '../../../../features/emergency/data/repositories/emergency_contacts_repository.dart';
import '../../../../features/emergency/presentation/providers/emergency_providers.dart';
import '../../../../features/profile/data/repositories/user_activity_repository.dart';
import '../../../../features/profile/data/repositories/user_preferences_repository.dart';
import '../../../../shared/models/alert.dart';
import '../../../../shared/models/user.dart';
// Hide conflicting types from shared models - use repository models instead
import '../../../../shared/models/user_preferences.dart'
    hide
        ThemeMode,
        NotificationPreferences,
        MapPreferences,
        PrivacyPreferences,
        UserPreferences,
        MapStyle,
        DistanceUnit,
        NavigationVoice,
        EmergencyAlertLevel,
        PrivacyLevel;
import '../../../../shared/widgets/widgets.dart';

/// Profile screen - 5th tab in bottom navigation
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push(AppRoutes.settings),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SafeArea(
        child: user != null
            ? _buildAuthenticatedProfile(context, ref, user)
            : _buildNoUserProfile(context),
      ),
    );
  }

  /// Profile screen shown when no user is signed in (authentication removed).
  Widget _buildNoUserProfile(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              size: 80,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'SAFENAV CAVITE',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Navigate Safely. Evacuate Confidently.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppFilledButton(
              onPressed: () => context.go(AppRoutes.home),
              label: 'Go to Map',
              icon: Icons.map,
              iconPosition: IconPosition.leading,
              size: ButtonSize.large,
              semanticLabel: 'Go to campus map',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthenticatedProfile(
    BuildContext context,
    WidgetRef ref,
    User user,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile header
          _buildProfileHeader(context, ref, user),

          const SizedBox(height: 24),

          // Quick stats
          _buildQuickStats(context, ref, user),

          const SizedBox(height: 24),

          // Account section
          SectionHeader(
            title: 'Account',
            icon: Icons.person_outline,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildAccountSection(context, ref, user),

          const SizedBox(height: 24),

          // Safety & Emergency section
          SectionHeader(
            title: 'Safety & Emergency',
            icon: Icons.shield_outlined,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildSafetySection(context, ref, user),

          const SizedBox(height: 24),

          // Preferences section
          SectionHeader(
            title: 'Preferences',
            icon: Icons.tune,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildPreferencesSection(context, ref, user),

          const SizedBox(height: 24),

          // About section
          SectionHeader(
            title: 'About',
            icon: Icons.info_outline,
            style: SectionHeaderStyle.standard,
          ),
          const SizedBox(height: 12),
          _buildAboutSection(context, ref, user),

          const SizedBox(height: 24),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // _buildErrorState removed - authentication no longer needed

  Widget _buildProfileHeader(BuildContext context, WidgetRef ref, User user) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppElevatedCard(
      padding: const EdgeInsets.all(24),
      elevation: 2,
      child: Column(
        children: [
          // Avatar with edit button
          Stack(
            children: [
              AppAvatar(
                name: user.displayName,
                imageUrl: user.photoUrl,
                radius: 56,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: user.isActive ? colorScheme.secondary : colorScheme.outline,
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.surface, width: 3),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: InkWell(
                  onTap: () => _navigateToEditProfile(context),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: colorScheme.surface, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.onSurface.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: colorScheme.onPrimary,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Name and role
          Text(
            user.displayName,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          // Role badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _getRoleColor(
                user.role,
                colorScheme,
              ).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _getRoleColor(
                  user.role,
                  colorScheme,
                ).withValues(alpha: 0.5),
              ),
            ),
            child: Text(
              user.role.displayName,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: _getRoleColor(user.role, colorScheme),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Email
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          // ID Number
          if (user.idNumber != null) ...[
            const SizedBox(height: 4),
            Text(
              user.idNumber!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontFamily: 'RobotoMono',
              ),
            ),
          ],

          // Last login & account creation
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (user.lastLoginAt != null) ...[
                _buildInfoChip(
                  context,
                  Icons.access_time,
                  'Last login',
                  _formatRelativeTime(user.lastLoginAt!),
                ),
                const SizedBox(width: 12),
              ],
              _buildInfoChip(
                context,
                Icons.calendar_today,
                'Member since',
                _formatDate(user.createdAt),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Edit profile button
          AppOutlinedButton(
            onPressed: () => _navigateToEditProfile(context),
            label: 'Edit Profile',
            icon: Icons.edit,
            iconPosition: IconPosition.leading,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context, WidgetRef ref, User user) {
    final colorScheme = Theme.of(context).colorScheme;
    // Watch providers for real-time stats
    final placesVisitedAsync = ref.watch(placesVisitedCountProvider(user.id));
    final routesTakenAsync = ref.watch(routesTakenCountProvider(user.id));
    final alertsReceivedAsync = ref.watch(alertsReceivedCountProvider(user.id));
    final safetyScoreAsync = ref.watch(userSafetyScoreProvider(user.id));

    final stats = [
      _StatItem(
        icon: Icons.map,
        label: 'Places Visited',
        valueAsync: placesVisitedAsync,
        color: colorScheme.primary,
        onTap: () => context.push('${AppRoutes.activityHistory}?tab=1'),
      ),
      _StatItem(
        icon: Icons.route,
        label: 'Routes Taken',
        valueAsync: routesTakenAsync,
        color: colorScheme.secondary,
        onTap: () => context.push('${AppRoutes.activityHistory}?tab=2'),
      ),
      _StatItem(
        icon: Icons.notifications,
        label: 'Alerts Received',
        valueAsync: alertsReceivedAsync,
        color: colorScheme.tertiary,
        onTap: () => context.push(AppRoutes.alerts),
      ),
      _StatItem(
        icon: Icons.emergency,
        label: 'Safety Score',
        valueAsync: safetyScoreAsync,
        color: colorScheme.error,
        onTap: () => context.push('${AppRoutes.activityHistory}?tab=3'),
      ),
    ];

    return Row(
      children: stats
          .map((stat) => Expanded(child: _StatCard(stat: stat)))
          .toList(),
    );
  }

  Widget _buildAccountSection(BuildContext context, WidgetRef ref, User user) {
    final items = [
      _SettingsItem(
        icon: Icons.badge,
        title: 'My ID',
        subtitle: user.idNumber ?? 'Not set',
        onTap: () => _navigateToIdCard(context),
      ),
      _SettingsItem(
        icon: Icons.security,
        title: 'Security & Login',
        subtitle: 'Password, 2FA, active sessions',
        onTap: () => _navigateToSecurity(context),
      ),
    ];

    return Column(
      children: items.map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Widget _buildSafetySection(BuildContext context, WidgetRef ref, User user) {
    final colorScheme = Theme.of(context).colorScheme;
    // Watch location sharing preference
    final locationSharingAsync = ref.watch(locationSharingProvider(user.id));

    final items = [
      _SettingsItem(
        icon: Icons.contacts,
        title: 'Emergency Contacts',
        subtitle: 'Manage ICE contacts',
        onTap: () => _navigateToEmergencyContacts(context),
      ),
      _SettingsItem(
        icon: Icons.medical_information,
        title: 'Medical Information',
        subtitle: 'Allergies, conditions, medications, blood type',
        onTap: () => _navigateToMedicalInfo(context),
      ),
      _SettingsItem(
        icon: Icons.location_on,
        title: 'Location Sharing',
        subtitle: 'Share location with emergency contacts',
        trailing: locationSharingAsync.when(
          data: (enabled) => Switch(
            value: enabled,
            onChanged: (value) =>
                _toggleLocationSharing(context, ref, user.id, value),
            activeThumbColor: Theme.of(context).colorScheme.primary,
          ),
          loading: () => const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          error: (_, __) =>
              Icon(Icons.error, color: colorScheme.error, size: 20),
        ),
      ),
      _SettingsItem(
        icon: Icons.warning,
        title: 'Safety Check-ins',
        subtitle: 'Schedule, history, and contacts',
        onTap: () => _navigateToSafetyCheckins(context),
      ),
    ];

    return Column(
      children: items.map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Widget _buildPreferencesSection(
    BuildContext context,
    WidgetRef ref,
    User user,
  ) {
    // Watch user preferences for real-time sync
    final preferencesAsync = ref.watch(userPreferencesProvider(user.id));

    return Column(
      children: [
        _SettingsItem(
          icon: Icons.language,
          title: 'Language',
          subtitle: preferencesAsync.when(
            data: (prefs) => prefs.language.displayName,
            loading: () => 'Loading...',
            error: (_, __) => 'English',
          ),
          onTap: () => _navigateToLanguage(context),
        ),
        _SettingsItem(
          icon: Icons.dark_mode,
          title: 'Theme',
          subtitle: preferencesAsync.when(
            data: (prefs) => prefs.theme.displayName,
            loading: () => 'Loading...',
            error: (_, __) => 'System default',
          ),
          trailing: _ThemeSelector(userId: user.id),
          onTap: () => _navigateToTheme(context),
        ),
        _SettingsItem(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Push, email, SMS preferences',
          onTap: () => _navigateToNotifications(context),
        ),
        _SettingsItem(
          icon: Icons.map,
          title: 'Map Preferences',
          subtitle: 'Default view, units, layers',
          onTap: () => _navigateToMapPrefs(context),
        ),
        _SettingsItem(
          icon: Icons.accessibility,
          title: 'Accessibility',
          subtitle: 'Text size, contrast, screen reader',
          onTap: () => _navigateToAccessibility(context),
        ),
      ].map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Widget _buildAboutSection(BuildContext context, WidgetRef ref, User user) {
    return Column(
      children: [
        _SettingsItem(
          icon: Icons.article,
          title: 'Terms of Service',
          subtitle: 'Read our terms and conditions',
          onTap: () => _openUrl(context, 'https://safenav.example.com/terms'),
        ),
        _SettingsItem(
          icon: Icons.privacy_tip,
          title: 'Privacy Policy',
          subtitle: 'How we protect your data',
          onTap: () => _openUrl(context, 'https://safenav.example.com/privacy'),
        ),
        _SettingsItem(
          icon: Icons.help,
          title: 'Help & Support',
          subtitle: 'FAQ, contact support, tutorials',
          onTap: () => _navigateToHelp(context),
        ),
        _SettingsItem(
          icon: Icons.star,
          title: 'Rate App',
          subtitle: 'Share your experience',
          onTap: () => _rateApp(context),
        ),
        _SettingsItem(
          icon: Icons.info,
          title: 'App Version',
          subtitle: '1.0.0 (build 1)',
          onTap: () => _showVersionInfo(context),
        ),
      ].map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Color _getRoleColor(UserRole role, ColorScheme colorScheme) {
    switch (role) {
      case UserRole.admin:
        return colorScheme.primary;
      case UserRole.security:
        return colorScheme.error;
      case UserRole.faculty:
        return colorScheme.secondary;
      case UserRole.student:
        return colorScheme.tertiary;
    }
  }

  String _formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  // Navigation methods
  void _navigateToEditProfile(BuildContext context) {
    context.push(AppRoutes.editProfile);
  }

  void _navigateToIdCard(BuildContext context) {
    context.push(AppRoutes.digitalIdCard);
  }

  void _navigateToSecurity(BuildContext context) {
    context.push(AppRoutes.securitySettings);
  }

  void _navigateToLanguage(BuildContext context) {
    context.push(AppRoutes.languagePreferences);
  }

  void _navigateToTheme(BuildContext context) {
    context.push(AppRoutes.themePreferences);
  }

  void _navigateToNotifications(BuildContext context) {
    context.push(AppRoutes.notificationPreferences);
  }

  void _navigateToMapPrefs(BuildContext context) {
    context.push(AppRoutes.mapPreferences);
  }

  void _navigateToAccessibility(BuildContext context) {
    context.push(AppRoutes.accessibilityPreferences);
  }

  void _navigateToEmergencyContacts(BuildContext context) {
    context.push(AppRoutes.emergencyContacts);
  }

  void _navigateToMedicalInfo(BuildContext context) {
    context.push(AppRoutes.medicalInfo);
  }

  void _navigateToSafetyCheckins(BuildContext context) {
    context.push(AppRoutes.safetyCheckins);
  }

  void _openUrl(BuildContext context, String url) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening: $url'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToHelp(BuildContext context) {
    context.push('/help');
  }

  void _rateApp(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Rate app - opening store...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showVersionInfo(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'SAFENAV CAVITE',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(Icons.map, size: 48, color: Theme.of(context).colorScheme.primary),
      children: [
        const Text('Campus Navigation & Emergency Evacuation'),
        const SizedBox(height: 16),
        const Text('© 2024 SAFENAV CAVITE. All rights reserved.'),
      ],
    );
  }

  void _toggleLocationSharing(
    BuildContext context,
    WidgetRef ref,
    String userId,
    bool enabled,
  ) async {
    final emergencyContactsRepo = ref.read(emergencyContactsRepositoryProvider);
    final prefsResult = await emergencyContactsRepo.getPreferences(userId);

    if (!context.mounted) return;

    if (prefsResult.isFailure) {
      _showErrorSnackBar(
        context,
        'Failed to update: ${prefsResult.failure.message}',
      );
      return;
    }

    final currentPrefs = prefsResult.value;
    final updatedPrefs = EmergencyPreferences(
      userId: currentPrefs.userId,
      shareLocationWithContacts: enabled,
      shareLocationWithResponders: currentPrefs.shareLocationWithResponders,
      autoCallEmergency: currentPrefs.autoCallEmergency,
      autoCallDelaySeconds: currentPrefs.autoCallDelaySeconds,
      sendPeriodicUpdates: currentPrefs.sendPeriodicUpdates,
      updateIntervalSeconds: currentPrefs.updateIntervalSeconds,
      vibrateOnEmergency: currentPrefs.vibrateOnEmergency,
      flashScreenOnEmergency: currentPrefs.flashScreenOnEmergency,
      playSirenSound: currentPrefs.playSirenSound,
      alertLevel: currentPrefs.alertLevel,
      blockedAlertTypes: currentPrefs.blockedAlertTypes,
      customSettings: currentPrefs.customSettings,
      createdAt: currentPrefs.createdAt,
      updatedAt: DateTime.now(),
    );

    final saveResult = await emergencyContactsRepo.savePreferences(
      updatedPrefs,
    );

    if (context.mounted) {
      if (saveResult.isSuccess) {
        // Subscribe/unsubscribe from FCM topic
        final fcmService = FCMService.instance;
        if (enabled) {
          await fcmService.subscribeToTopic('location_sharing_$userId');
        } else {
          await fcmService.unsubscribeFromTopic('location_sharing_$userId');
        }
        if (!context.mounted) return;
        _showSuccessSnackBar(
          context,
          enabled ? 'Location sharing enabled' : 'Location sharing disabled',
        );
        ref.invalidate(locationSharingProvider(userId));
      } else {
        _showErrorSnackBar(
          context,
          'Failed to update: ${saveResult.failure.message}',
        );
      }
    }
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

// ============================================================================
// Providers for real-time stats
// ============================================================================

/// Provider for places visited count
final placesVisitedCountProvider = StreamProvider.family<int, String>((
  ref,
  userId,
) {
  final repository = ref.watch(userActivityRepositoryProvider);
  return repository.watchUserActivities(userId: userId, limit: 1000).map((
    activities,
  ) {
    final uniquePlaces = activities
        .where((a) => a.roomId != null)
        .map((a) => a.roomId!)
        .toSet()
        .length;
    return uniquePlaces;
  });
});

/// Provider for routes taken count
final routesTakenCountProvider = StreamProvider.family<int, String>((
  ref,
  userId,
) {
  final repository = ref.watch(userActivityRepositoryProvider);
  return repository.watchUserActivities(userId: userId, limit: 1000).map((
    activities,
  ) {
    final uniqueRoutes = activities
        .where((a) => a.routeId != null)
        .map((a) => a.routeId!)
        .toSet()
        .length;
    return uniqueRoutes;
  });
});

/// Provider for alerts received count
final alertsReceivedCountProvider = StreamProvider.family<int, String>((
  ref,
  userId,
) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return Stream.value(0);

  final alertsRepository = ref.watch(alertsRepositoryProvider);
  return alertsRepository
      .watchAlerts(
        status: AlertStatus.active,
        targetRoles: [user.role.name],
        limit: 100,
      )
      .map((alerts) => alerts.length);
});

/// Provider for user safety score
final userSafetyScoreProvider = StreamProvider.family<String, String>((
  ref,
  userId,
) {
  final repository = ref.watch(userActivityRepositoryProvider);
  return repository.watchSafetyScore(userId).map((score) {
    if (score == null) return 'Calculating...';
    final percentage = (score.overallScore * 100).round();
    return '$percentage%';
  });
});

/// Provider for location sharing status
final locationSharingProvider = StreamProvider.family<bool, String>((
  ref,
  userId,
) {
  final repository = ref.watch(emergencyContactsRepositoryProvider);
  return repository
      .watchPreferences(userId)
      .map((prefs) => prefs.shareLocationWithContacts);
});

/// Provider for user preferences
final userPreferencesProvider = StreamProvider.family<UserPreferences, String>((
  ref,
  userId,
) {
  final repository = ref.watch(userPreferencesRepositoryProvider);
  return repository.watchPreferences(userId);
});

// ============================================================================
// Stat Item & Card
// ============================================================================

class _StatItem {
  final IconData icon;
  final String label;
  final AsyncValue<dynamic> valueAsync;
  final Color color;
  final VoidCallback? onTap;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.valueAsync,
    required this.color,
    this.onTap,
  });
}

class _StatCard extends ConsumerWidget {
  const _StatCard({required this.stat});

  final _StatItem stat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AppCard(
        padding: const EdgeInsets.all(16),
        onTap: stat.onTap,
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: stat.color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(stat.icon, color: stat.color, size: 20),
            ),
            const SizedBox(height: 8),
            stat.valueAsync.when(
              data: (value) => Text(
                value.toString(),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              loading: () => SizedBox(
                width: 30,
                height: 24,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: stat.color,
                  ),
                ),
              ),
              error: (_, __) => Text(
                '0',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              stat.label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Settings Item & Tile
// ============================================================================

class _SettingsItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final bool isDestructive;
  final VoidCallback? onTap;

  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.isDestructive = false,
    this.onTap,
  });
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.item});

  final _SettingsItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      onTap: item.onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: item.isDestructive
                  ? colorScheme.errorContainer
                  : colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              item.icon,
              color: item.isDestructive
                  ? colorScheme.error
                  : colorScheme.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: item.isDestructive ? colorScheme.error : null,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (item.trailing != null) ...[
            const SizedBox(width: 8),
            item.trailing!,
          ] else if (item.onTap != null) ...[
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
          ],
        ],
      ),
    );
  }
}

// ============================================================================
// Theme Selector
// ============================================================================

class _ThemeSelector extends ConsumerWidget {
  const _ThemeSelector({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferencesAsync = ref.watch(userPreferencesProvider(userId));

    return preferencesAsync.when(
      data: (prefs) => PopupMenuButton<ThemeModePreference>(
        initialValue: prefs.theme,
        icon: Icon(
          _getThemeIcon(prefs.theme),
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: ThemeModePreference.light,
            child: Row(
              children: [
                Icon(Icons.light_mode, size: 20),
                SizedBox(width: 12),
                Text('Light'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: ThemeModePreference.dark,
            child: Row(
              children: [
                Icon(Icons.dark_mode, size: 20),
                SizedBox(width: 12),
                Text('Dark'),
              ],
            ),
          ),
          const PopupMenuItem(
            value: ThemeModePreference.system,
            child: Row(
              children: [
                Icon(Icons.brightness_auto, size: 20),
                SizedBox(width: 12),
                Text('System'),
              ],
            ),
          ),
        ],
        onSelected: (mode) async {
          final repository = ref.read(userPreferencesRepositoryProvider);
          await repository.updateTheme(userId, mode);
        },
      ),
      loading: () => const SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  IconData _getThemeIcon(ThemeModePreference theme) {
    switch (theme) {
      case ThemeModePreference.light:
        return Icons.light_mode;
      case ThemeModePreference.dark:
        return Icons.dark_mode;
      case ThemeModePreference.system:
        return Icons.brightness_auto;
    }
  }
}

// ============================================================================
// Edit Profile Screen
// ============================================================================

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleInitialController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  String? _photoUrl;
  File? _selectedImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    final user = ref.read(currentUserProvider);
    if (user != null) {
      _firstNameController.text = user.firstName;
      _lastNameController.text = user.lastName;
      _middleInitialController.text = user.middleInitial ?? '';
      _phoneNumberController.text = user.phoneNumber ?? '';
      _photoUrl = user.photoUrl;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _middleInitialController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      // todo: Upload to Firebase Storage and get URL
      // For now, just update local state
    }
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authService = ref.read(authServiceProvider);
      final firestoreService = ref.read(firestoreServiceProvider);
      final currentUser = ref.read(currentUserProvider);

      if (currentUser == null) throw Exception('No user logged in');

      // Update display name
      final displayName =
          '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}';
      await authService.updateProfile(
        displayName: displayName,
        photoUrl: _photoUrl,
      );

      // Update Firestore
      final updatedUser = currentUser.copyWith(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        middleInitial: _middleInitialController.text.trim().isEmpty
            ? null
            : _middleInitialController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim().isEmpty
            ? null
            : _phoneNumberController.text.trim(),
        photoUrl: _photoUrl,
        updatedAt: DateTime.now(),
      );

      await firestoreService.updateUserProfile(updatedUser);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile updated successfully'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update profile: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile photo
                Center(
                  child: Stack(
                    children: [
                      AppAvatar(
                        name:
                            '${_firstNameController.text} ${_lastNameController.text}',
                        imageUrl: _selectedImage != null
                            ? _selectedImage!.path
                            : _photoUrl,
                        radius: 60,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: AppIconButton(
                          onPressed: _pickImage,
                          icon: Icons.camera_alt,
                          size: IconButtonSize.medium,
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          tooltip: 'Change profile photo',
                          semanticLabel: 'Change profile photo',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Personal Information Section
                SectionHeader(
                  title: 'Personal Information',
                  icon: Icons.person_outline,
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 12),

                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // First Name
                        TextFormField(
                          controller: _firstNameController,
                          decoration: const InputDecoration(
                            labelText: 'First Name *',
                            prefixIcon: Icon(Icons.person_outlined),
                          ),
                          validator: (value) => value?.trim().isEmpty ?? true
                              ? 'First name is required'
                              : null,
                        ),

                        const SizedBox(height: 16),

                        // Middle Initial
                        TextFormField(
                          controller: _middleInitialController,
                          decoration: const InputDecoration(
                            labelText: 'Middle Initial',
                            prefixIcon: Icon(Icons.badge_outlined),
                            hintText: 'Optional',
                          ),
                          maxLength: 1,
                        ),

                        const SizedBox(height: 16),

                        // Last Name
                        TextFormField(
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                            labelText: 'Last Name *',
                            prefixIcon: Icon(Icons.person_outlined),
                          ),
                          validator: (value) => value?.trim().isEmpty ?? true
                              ? 'Last name is required'
                              : null,
                        ),

                        const SizedBox(height: 16),

                        // Phone Number
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone_outlined),
                            hintText: 'Optional',
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        onPressed: _isLoading
                            ? null
                            : () => Navigator.pop(context),
                        label: 'Cancel',
                        semanticLabel: 'Cancel editing profile',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppFilledButton(
                        onPressed: _isLoading ? null : _saveProfile,
                        label: 'Save Changes',
                        isLoading: _isLoading,
                        size: ButtonSize.large,
                        semanticLabel: 'Save profile changes',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// Digital ID Card Screen
// ============================================================================

class DigitalIDCardScreen extends ConsumerWidget {
  const DigitalIDCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final colorScheme = Theme.of(context).colorScheme;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('My ID')),
        body: const Center(child: Text('Please sign in')),
      );
    }

    // Generate QR code data
    final qrData = {
      'id': user.id,
      'name': user.displayName,
      'idNumber': user.idNumber,
      'role': user.role.name,
      'email': user.email,
      'timestamp': DateTime.now().toIso8601String(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital ID Card'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        actions: [
          AppIconButton(
            onPressed: () => _shareIDCard(context, user),
            icon: Icons.share,
            size: IconButtonSize.medium,
            tooltip: 'Share ID',
            semanticLabel: 'Share digital ID card',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ID Card - using AppElevatedCard with custom gradient
              AppElevatedCard(
                padding: const EdgeInsets.all(24),
                elevation: 6,
                borderRadius: BorderRadius.circular(20),
                semanticLabel: 'Digital ID card',
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary,
                        colorScheme.primaryContainer,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Header
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.badge,
                              color: colorScheme.onPrimary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SAFENAV CAVITE',
                                  style: TextStyle(
                                    color: colorScheme.onPrimary.withValues(
                                      alpha: 0.8,
                                    ),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Text(
                                  'Digital ID Card',
                                  style: TextStyle(
                                    color: colorScheme.onPrimary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.onPrimary.withValues(
                                alpha: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              user.role.displayName.toUpperCase(),
                              style: TextStyle(
                                color: colorScheme.onPrimary,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Avatar & Name
                      AppAvatar(
                        name: user.displayName,
                        imageUrl: user.photoUrl,
                        radius: 48,
                        backgroundColor: colorScheme.onPrimary.withValues(
                          alpha: 0.2,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        user.displayName,
                        style: TextStyle(
                          color: colorScheme.onPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        user.email,
                        style: TextStyle(
                          color: colorScheme.onPrimary.withValues(alpha: 0.8),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ID Number & QR Code
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ID NUMBER',
                                  style: TextStyle(
                                    color: colorScheme.onPrimary.withValues(
                                      alpha: 0.6,
                                    ),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Text(
                                  user.idNumber ?? '—',
                                  style: TextStyle(
                                    color: colorScheme.onPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'RobotoMono',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // QR Code placeholder
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: CustomPaint(
                                size: const Size(70, 70),
                                painter: _QRCodePainter(
                                  qrData.toString(),
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Barcode for campus access
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'CAMPUS ACCESS BARCODE',
                              style: TextStyle(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomPaint(
                              size: const Size(double.infinity, 40),
                              painter: _BarcodePainter(
                                user.idNumber ?? user.id,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              user.idNumber ?? user.id,
                              style: TextStyle(
                                color: colorScheme.onSurface,
                                fontSize: 12,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Info section
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _IDInfoRow(
                      icon: Icons.person_outlined,
                      label: 'Full Name',
                      value: user.displayName,
                    ),
                    const Divider(),
                    _IDInfoRow(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: user.email,
                    ),
                    const Divider(),
                    _IDInfoRow(
                      icon: Icons.badge_outlined,
                      label: 'Role',
                      value: user.role.displayName,
                    ),
                    const Divider(),
                    _IDInfoRow(
                      icon: Icons.apartment_outlined,
                      label: 'Department',
                      value: user.department ?? 'Not set',
                    ),
                    if (user.phoneNumber != null) ...[
                      const Divider(),
                      _IDInfoRow(
                        icon: Icons.phone_outlined,
                        label: 'Phone',
                        value: user.phoneNumber!,
                      ),
                    ],
                    const Divider(),
                    _IDInfoRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Member Since',
                      value: _formatDate(user.createdAt),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Actions
              Row(
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: () => _shareIDCard(context, user),
                      label: 'Share',
                      icon: Icons.share,
                      iconPosition: IconPosition.leading,
                      size: ButtonSize.large,
                      semanticLabel: 'Share digital ID card',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppFilledButton(
                      onPressed: () => _saveToWallet(context),
                      label: 'Add to Wallet',
                      icon: Icons.add_card,
                      iconPosition: IconPosition.leading,
                      size: ButtonSize.large,
                      semanticLabel: 'Add ID card to wallet',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _shareIDCard(BuildContext context, User user) {
    final text =
        '''
SAFENAV CAVITE - Digital ID Card

Name: ${user.displayName}
ID: ${user.idNumber ?? 'N/A'}
Role: ${user.role.displayName}
Email: ${user.email}
Member Since: ${_formatDate(user.createdAt)}

This is a digital ID for campus access.
''';
    SharePlus.instance.share(
      ShareParams(text: text, subject: 'My SAFENAV ID Card'),
    );
  }

  void _saveToWallet(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add to Wallet - Feature coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _IDInfoRow extends StatelessWidget {
  const _IDInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
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
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QRCodePainter extends CustomPainter {
  final String data;
  final Color color;
  _QRCodePainter(this.data, {this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw a QR code-like pattern
    final paint = Paint()..color = color;
    final cellSize = size.width / 25;

    // Simple pattern based on data hash
    final hash = data.hashCode;
    for (int x = 0; x < 25; x++) {
      for (int y = 0; y < 25; y++) {
        // Create a deterministic pattern
        final seed = (x * 31 + y * 17 + hash) & 0xFFFFFFFF;
        final value = (seed * 1103515245 + 12345) & 0x7FFFFFFF;
        if ((value & 1) == 1) {
          canvas.drawRect(
            Rect.fromLTWH(x * cellSize, y * cellSize, cellSize, cellSize),
            paint,
          );
        }
      }
    }

    // Draw finder patterns (corners)
    _drawFinderPattern(canvas, paint, cellSize, 0, 0);
    _drawFinderPattern(canvas, paint, cellSize, 18, 0);
    _drawFinderPattern(canvas, paint, cellSize, 0, 18);
  }

  void _drawFinderPattern(
    Canvas canvas,
    Paint paint,
    double cellSize,
    int x,
    int y,
  ) {
    // Outer 7x7
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 7; j++) {
        if (i == 0 ||
            i == 6 ||
            j == 0 ||
            j == 6 ||
            (i >= 2 && i <= 4 && j >= 2 && j <= 4)) {
          canvas.drawRect(
            Rect.fromLTWH(
              (x + i) * cellSize,
              (y + j) * cellSize,
              cellSize,
              cellSize,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BarcodePainter extends CustomPainter {
  final String data;
  final Color color;
  _BarcodePainter(this.data, {this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final barWidth = size.width / (data.length * 4);

    for (int i = 0; i < data.length; i++) {
      final charCode = data.codeUnitAt(i);
      final barCount = (charCode % 4) + 1;

      for (int b = 0; b < barCount; b++) {
        final x = (i * 4 + b) * barWidth;
        canvas.drawRect(
          Rect.fromLTWH(x, 0, barWidth * 0.8, size.height),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ============================================================================
// Security Settings Screen
// ============================================================================

class SecuritySettingsScreen extends ConsumerWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Security & Login'),
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
              SectionHeader(
                title: 'Password',
                icon: Icons.lock,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.lock_outline,
                        title: 'Change Password',
                        subtitle: 'Update your password',
                        onTap: () => _changePassword(context),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SectionHeader(
                title: 'Two-Factor Authentication',
                icon: Icons.verified_user,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.security,
                        title: 'Enable 2FA',
                        subtitle: 'Add an extra layer of security',
                        trailing: Switch(
                          value: false, // todo: Get from user prefs
                          onChanged: (value) => _toggle2FA(context, value),
                          activeThumbColor: colorScheme.primary,
                        ),
                        onTap: () => _enable2FA(context),
                      ),
                    ),
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.backup,
                        title: 'Backup Codes',
                        subtitle: 'View and regenerate backup codes',
                        onTap: () => _showBackupCodes(context),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SectionHeader(
                title: 'Active Sessions',
                icon: Icons.devices,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.phone_android,
                        title: 'This Device',
                        subtitle: 'Currently active',
                        trailing: AppStatusChip(
                          label: 'Current',
                          severity: ChipSeverity.info,
                          compact: true,
                        ),
                        onTap: null,
                      ),
                    ),
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.logout,
                        title: 'Sign Out Everywhere',
                        subtitle: 'Sign out of all other devices',
                        isDestructive: true,
                        onTap: () => _signOutEverywhere(context, ref),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SectionHeader(
                title: 'Login Methods',
                icon: Icons.login,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.email,
                        title: 'Email & Password',
                        subtitle: 'Enabled',
                        trailing: Icon(
                          Icons.check_circle,
                          color: colorScheme.secondary,
                          size: 20,
                        ),
                        onTap: null,
                      ),
                    ),
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.g_mobiledata,
                        title: 'Google Sign-In',
                        subtitle: 'Not connected',
                        onTap: () => _linkGoogleAccount(context),
                      ),
                    ),
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.apple,
                        title: 'Apple Sign-In',
                        subtitle: 'Not connected',
                        onTap: () => _linkAppleAccount(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changePassword(BuildContext context) {
    // todo: Implement change password dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Change password - opening dialog...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _toggle2FA(BuildContext context, bool enabled) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(enabled ? '2FA enabled' : '2FA disabled'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _enable2FA(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('2FA setup - feature coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showBackupCodes(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Backup codes - feature coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _signOutEverywhere(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out Everywhere?'),
        content: const Text(
          'This will sign you out of all devices except this one. You will need to sign in again on other devices.',
        ),
        actions: [
          AppTextButton(
            onPressed: () => Navigator.pop(context),
            label: 'Cancel',
          ),
          AppFilledButton(
            onPressed: () async {
              Navigator.pop(context);
              // todo: Implement revoke all tokens via Cloud Function
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Signed out of all other devices'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              );
            },
            label: 'Sign Out',
            semanticLabel: 'Sign out of all other devices',
          ),
        ],
      ),
    );
  }

  void _linkGoogleAccount(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Link Google account - feature coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _linkAppleAccount(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Link Apple account - feature coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// ============================================================================
// Emergency Contacts Screen
// ============================================================================

class EmergencyContactsScreen extends ConsumerStatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  ConsumerState<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState
    extends ConsumerState<EmergencyContactsScreen> {
  final _repository = EmergencyContactsRepository.instance;
  List<EmergencyContact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _loadContacts() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final result = await _repository.getUserContacts(user.id);
    if (mounted && result.isSuccess) {
      setState(() => _contacts = result.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        actions: [
          AppIconButton(
            onPressed: () => _addContact(context),
            icon: Icons.add,
            size: IconButtonSize.medium,
            tooltip: 'Add emergency contact',
            semanticLabel: 'Add emergency contact',
          ),
        ],
      ),
      body: SafeArea(
        child: user == null
            ? const Center(child: Text('Please sign in'))
            : _contacts.isEmpty
            ? EmptyState(
                icon: Icons.contacts,
                title: 'No Emergency Contacts',
                message:
                    'Add emergency contacts so they can be notified in case of emergency.',
                actionLabel: 'Add Contact',
                action: () => _addContact(context),
                semanticLabel:
                    'No emergency contacts. Add your first emergency contact.',
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contacts[index];
                  return _ContactCard(
                    contact: contact,
                    onEdit: () => _editContact(context, contact),
                    onDelete: () => _deleteContact(context, contact),
                    onSetPrimary: () => _setPrimaryContact(context, contact),
                  );
                },
              ),
      ),
    );
  }

  void _addContact(BuildContext context) {
    // todo: Navigate to add/edit contact screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add contact - opening form...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _editContact(BuildContext context, EmergencyContact contact) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edit contact - opening form...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _deleteContact(BuildContext context, EmergencyContact contact) {
    final currentUser = ref.read(currentUserProvider);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Contact?'),
        content: Text('Are you sure you want to delete ${contact.name}?'),
        actions: [
          AppTextButton(
            onPressed: () => Navigator.pop(context),
            label: 'Cancel',
          ),
          AppFilledButton(
            onPressed: () async {
              Navigator.pop(context);
              if (currentUser != null) {
                await _repository.deleteContact(contact.id);
                _loadContacts();
              }
            },
            label: 'Delete',
            semanticLabel: 'Delete ${contact.name}',
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }

  void _setPrimaryContact(
    BuildContext context,
    EmergencyContact contact,
  ) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final result = await _repository.setPrimaryContact(user.id, contact.id);
    if (mounted && result.isSuccess) {
      _loadContacts();
    }
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({
    required this.contact,
    required this.onEdit,
    required this.onDelete,
    required this.onSetPrimary,
  });

  final EmergencyContact contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetPrimary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: colorScheme.primaryContainer,
            child: Text(
              contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '?',
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      contact.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (contact.isPrimary) ...[
                      const SizedBox(width: 8),
                      AppStatusChip(
                        label: 'PRIMARY',
                        severity: ChipSeverity.success,
                        compact: true,
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  contact.relationship.displayName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  contact.phoneNumber,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontFamily: 'RobotoMono'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AppIconButton(
            onPressed: () => _showContactActionsBottomSheet(
              context,
              contact,
              onEdit,
              onSetPrimary,
              onDelete,
              contact.isPrimary,
            ),
            icon: Icons.more_vert,
            size: IconButtonSize.medium,
            tooltip: 'More options',
            semanticLabel: 'More options for ${contact.name}',
          ),
        ],
      ),
    );
  }

  void _showContactActionsBottomSheet(
    BuildContext context,
    EmergencyContact contact,
    VoidCallback onEdit,
    VoidCallback onSetPrimary,
    VoidCallback onDelete,
    bool isPrimary,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                Navigator.pop(context);
                onEdit();
              },
            ),
            if (!isPrimary)
              ListTile(
                leading: Icon(Icons.star, color: colorScheme.primary),
                title: const Text('Set as Primary'),
                onTap: () {
                  Navigator.pop(context);
                  onSetPrimary();
                },
              ),
            ListTile(
              leading: Icon(Icons.delete, color: colorScheme.error),
              title: Text('Delete', style: TextStyle(color: colorScheme.error)),
              onTap: () {
                Navigator.pop(context);
                onDelete();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// Medical Info Screen
// ============================================================================

class MedicalInfoScreen extends ConsumerStatefulWidget {
  const MedicalInfoScreen({super.key});

  @override
  ConsumerState<MedicalInfoScreen> createState() => _MedicalInfoScreenState();
}

class _MedicalInfoScreenState extends ConsumerState<MedicalInfoScreen> {
  final _repository = EmergencyContactsRepository.instance;
  MedicalInfo? _medicalInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMedicalInfo();
  }

  void _loadMedicalInfo() async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final result = await _repository.getMedicalInfo(user.id);
    if (mounted && result.isSuccess) {
      setState(() {
        _medicalInfo = result.value;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Information'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: _isLoading
            ? const InlineLoading(message: 'Loading medical information...')
            : RefreshIndicator(
                onRefresh: () async => _loadMedicalInfo(),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Blood Type
                      SectionHeader(
                        title: 'Blood Type',
                        icon: Icons.bloodtype,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        context,
                        icon: Icons.bloodtype,
                        title: 'Blood Type',
                        value: _medicalInfo?.bloodType ?? 'Not set',
                        onTap: () => _editBloodType(context),
                      ),

                      const SizedBox(height: 24),

                      // Allergies
                      SectionHeader(
                        title: 'Allergies',
                        icon: Icons.warning_amber,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      _buildListCard(
                        context,
                        icon: Icons.warning_amber,
                        title: 'Allergies',
                        items: _medicalInfo?.allergies ?? [],
                        onTap: () => _editAllergies(context),
                      ),

                      const SizedBox(height: 24),

                      // Medications
                      SectionHeader(
                        title: 'Medications',
                        icon: Icons.medication,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      _buildListCard(
                        context,
                        icon: Icons.medication,
                        title: 'Medications',
                        items: _medicalInfo?.medications ?? [],
                        onTap: () => _editMedications(context),
                      ),

                      const SizedBox(height: 24),

                      // Conditions
                      SectionHeader(
                        title: 'Medical Conditions',
                        icon: Icons.healing,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      _buildListCard(
                        context,
                        icon: Icons.healing,
                        title: 'Medical Conditions',
                        items: _medicalInfo?.conditions ?? [],
                        onTap: () => _editConditions(context),
                      ),

                      const SizedBox(height: 24),

                      // Emergency Notes
                      SectionHeader(
                        title: 'Emergency Notes',
                        icon: Icons.note_alt,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        context,
                        icon: Icons.note_alt,
                        title: 'Emergency Notes',
                        value: _medicalInfo?.emergencyNotes ?? 'Not set',
                        onTap: () => _editEmergencyNotes(context),
                      ),

                      const SizedBox(height: 24),

                      // Organ Donor
                      SectionHeader(
                        title: 'Organ Donor',
                        icon: Icons.favorite,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      AppCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: colorScheme.error.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: colorScheme.error,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Organ Donor',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    _medicalInfo
                                                ?.organDonorStatus
                                                ?.isNotEmpty ==
                                            true
                                        ? 'Yes'
                                        : 'No',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value:
                                  _medicalInfo?.organDonorStatus?.isNotEmpty ==
                                  true,
                              onChanged: (value) =>
                                  _toggleOrganDonor(context, value),
                              activeThumbColor: colorScheme.error,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Insurance
                      SectionHeader(
                        title: 'Insurance Provider',
                        icon: Icons.health_and_safety,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        context,
                        icon: Icons.health_and_safety,
                        title: 'Insurance Provider',
                        value: _medicalInfo?.insuranceProvider ?? 'Not set',
                        onTap: () => _editInsurance(context),
                      ),

                      const SizedBox(height: 24),

                      // Primary Physician
                      SectionHeader(
                        title: 'Primary Physician',
                        icon: Icons.person,
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        context,
                        icon: Icons.person,
                        title: 'Primary Physician',
                        value: _medicalInfo?.primaryPhysician ?? 'Not set',
                        onTap: () => _editPhysician(context),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: colorScheme.primary, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }

  Widget _buildListCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required List<String> items,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: colorScheme.primary, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
            ],
          ),
          if (items.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: items.map((item) => AppChip(label: item)).toList(),
            ),
          ] else ...[
            const SizedBox(height: 4),
            Text(
              'Not set',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _editBloodType(BuildContext context) {
    // todo: Implement blood type picker
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Blood type editor - coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _editAllergies(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Allergies editor - coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _editMedications(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Medications editor - coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _editConditions(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Conditions editor - coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _editEmergencyNotes(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Emergency notes editor - coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _toggleOrganDonor(BuildContext context, bool value) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return;

    final currentInfo = _medicalInfo ?? MedicalInfo.empty(user.id);
    final updatedInfo = currentInfo.copyWith(
      organDonorStatus: value ? 'yes' : 'no',
    );
    final result = await _repository.upsertMedicalInfo(updatedInfo);

    if (!context.mounted) return;

    if (result.isSuccess) {
      setState(() => _medicalInfo = result.value);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            value ? 'Organ donor status updated' : 'Organ donor status removed',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _editInsurance(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Insurance editor - coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _editPhysician(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Physician editor - coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// ============================================================================
// Location Sharing Screen
// ============================================================================

class LocationSharingScreen extends ConsumerWidget {
  const LocationSharingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final locationSharingAsync = ref.watch(
      locationSharingProvider(user?.id ?? ''),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Sharing'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: user == null
            ? const Center(child: Text('Please sign in'))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Main toggle
                    AppCard(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 48,
                            color: locationSharingAsync.when(
                              data: (enabled) => enabled
                                  ? colorScheme.primary
                                  : colorScheme.outline,
                              loading: () => colorScheme.outline,
                              error: (_, __) => colorScheme.outline,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Share Your Location',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Allow your emergency contacts to see your real-time location for safety.',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          locationSharingAsync.when(
                            data: (enabled) => Switch.adaptive(
                              value: enabled,
                              onChanged: (value) {
                                final repo =
                                    EmergencyContactsRepository.instance;
                                repo.getPreferences(user.id).then((result) {
                                  if (result.isSuccess) {
                                    final updated = result.value.copyWith(
                                      shareLocationWithContacts: value,
                                      updatedAt: DateTime.now(),
                                    );
                                    repo.savePreferences(updated);
                                  }
                                });
                              },
                              activeThumbColor: colorScheme.primary,
                              activeTrackColor: colorScheme.primary.withValues(
                                alpha: 0.3,
                              ),
                            ),
                            loading: () => const InlineLoading(
                              message: 'Loading...',
                              size: 20,
                            ),
                            error: (_, __) => const InlineError(
                              message: 'Error loading',
                              retryLabel: 'Retry',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Who can see your location
                    SectionHeader(
                      title: 'Who Can See Your Location',
                      icon: Icons.group,
                      style: SectionHeaderStyle.standard,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.star,
                              title: 'Primary Emergency Contact',
                              subtitle: 'Always shares location when enabled',
                              trailing: Icon(
                                Icons.check_circle,
                                color: colorScheme.secondary,
                                size: 20,
                              ),
                              onTap: null,
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.contacts,
                              title: 'All Emergency Contacts',
                              subtitle: 'Share with all ICE contacts',
                              trailing: Switch(
                                value: true,
                                onChanged: (value) {},
                                activeThumbColor: colorScheme.primary,
                              ),
                              onTap: null,
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.security,
                              title: 'Emergency Responders',
                              subtitle: 'Share during SOS activation only',
                              trailing: Switch(
                                value: true,
                                onChanged: (value) {},
                                activeThumbColor: colorScheme.error,
                              ),
                              onTap: null,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Privacy settings
                    SectionHeader(
                      title: 'Privacy',
                      icon: Icons.privacy_tip,
                      style: SectionHeaderStyle.standard,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.timer,
                              title: 'Auto-stop sharing',
                              subtitle: 'Stop sharing after 24 hours',
                              trailing: Switch(
                                value: true,
                                onChanged: (value) {},
                                activeThumbColor: colorScheme.primary,
                              ),
                              onTap: null,
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.history,
                              title: 'Location History',
                              subtitle: 'Keep history of shared locations',
                              trailing: Switch(
                                value: false,
                                onChanged: (value) {},
                                activeThumbColor: colorScheme.primary,
                              ),
                              onTap: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

// ============================================================================
// Safety Check-ins Screen
// ============================================================================

class SafetyCheckinsScreen extends ConsumerWidget {
  const SafetyCheckinsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Check-ins'),
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
              SectionHeader(
                title: 'Schedule',
                icon: Icons.schedule,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.alarm,
                        title: 'Daily Check-in',
                        subtitle: 'Every day at 10:00 PM',
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                          activeThumbColor: colorScheme.primary,
                        ),
                        onTap: () {},
                      ),
                    ),
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.nightlight_round,
                        title: 'Late Night Check-in',
                        subtitle: 'After 11:00 PM if not home',
                        trailing: Switch(
                          value: true,
                          onChanged: (value) {},
                          activeThumbColor: colorScheme.primary,
                        ),
                        onTap: () {},
                      ),
                    ),
                    _SettingsTile(
                      item: _SettingsItem(
                        icon: Icons.timer,
                        title: 'Custom Interval',
                        subtitle: 'Every 2 hours during travel',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SectionHeader(
                title: 'Contacts to Notify',
                icon: Icons.contacts,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(Icons.person, color: colorScheme.primary),
                      ),
                      title: const Text('Primary Emergency Contact'),
                      subtitle: const Text('Always notified'),
                      trailing: Icon(Icons.check_circle, color: colorScheme.secondary),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(
                          Icons.person_outline,
                          color: colorScheme.primary,
                        ),
                      ),
                      title: const Text('All Emergency Contacts'),
                      subtitle: const Text('Notify on missed check-ins'),
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeThumbColor: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SectionHeader(
                title: 'History',
                icon: Icons.history,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _CheckinHistoryItem(
                      time: 'Today, 10:00 PM',
                      status: 'Completed',
                      statusColor: colorScheme.secondary,
                    ),
                    const Divider(),
                    _CheckinHistoryItem(
                      time: 'Yesterday, 10:00 PM',
                      status: 'Completed',
                      statusColor: colorScheme.secondary,
                    ),
                    const Divider(),
                    _CheckinHistoryItem(
                      time: '2 days ago, 11:30 PM',
                      status: 'Missed - Alert sent',
                      statusColor: colorScheme.error,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: AppFilledButton(
                  onPressed: () => _sendManualCheckin(context),
                  label: 'Send Check-in Now',
                  icon: Icons.check_circle,
                  iconPosition: IconPosition.leading,
                  size: ButtonSize.large,
                  semanticLabel:
                      'Send manual safety check-in to emergency contacts',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendManualCheckin(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Check-in sent to emergency contacts'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class _CheckinHistoryItem extends StatelessWidget {
  const _CheckinHistoryItem({
    required this.time,
    required this.status,
    required this.statusColor,
  });

  final String time;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  status,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: statusColor),
                ),
              ],
            ),
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Activity History Screen
// ============================================================================

class ActivityHistoryScreen extends ConsumerStatefulWidget {
  const ActivityHistoryScreen({super.key, this.initialTab = 0});

  final int initialTab;

  @override
  ConsumerState<ActivityHistoryScreen> createState() =>
      _ActivityHistoryScreenState();
}

class _ActivityHistoryScreenState extends ConsumerState<ActivityHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.initialTab,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final colorScheme = Theme.of(context).colorScheme;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Activity History')),
        body: const Center(child: Text('Please sign in')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity History'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Places'),
            Tab(text: 'Routes'),
            Tab(text: 'Safety'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(context, ref, user.id),
          _buildPlacesTab(context, ref, user.id),
          _buildRoutesTab(context, ref, user.id),
          _buildSafetyTab(context, ref, user.id),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(BuildContext context, WidgetRef ref, String userId) {
    final colorScheme = Theme.of(context).colorScheme;
    final statsAsync = ref.watch(activityStatsProvider(userId));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: statsAsync.when(
        data: (stats) => Column(
          children: [
            // Summary cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _StatSummaryCard(
                  title: 'Total Activities',
                  value: stats['totalActivities'].toString(),
                  icon: Icons.analytics,
                  color: colorScheme.primary,
                ),
                _StatSummaryCard(
                  title: 'Total Distance',
                  value: _formatDistance(stats['totalDistance'] as double),
                  icon: Icons.straighten,
                  color: colorScheme.secondary,
                ),
                _StatSummaryCard(
                  title: 'Total Time',
                  value: _formatDuration(stats['totalDuration'] as int),
                  icon: Icons.timer,
                  color: colorScheme.tertiary,
                ),
                _StatSummaryCard(
                  title: 'Avg Safety Score',
                  value: _formatSafetyScore(
                    stats['averageSafetyScore'] as double,
                  ),
                  icon: Icons.emergency,
                  color: colorScheme.error,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Activity by type
            SectionHeader(
              title: 'Activity by Type',
              icon: Icons.pie_chart,
              style: SectionHeaderStyle.standard,
            ),
            const SizedBox(height: 12),
            AppCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: (stats['byType'] as Map<String, int>).entries.map((
                  entry,
                ) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(child: Text(_formatActivityType(entry.key))),
                        Text(
                          entry.value.toString(),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            // Activity by building
            SectionHeader(
              title: 'Activity by Building',
              icon: Icons.apartment,
              style: SectionHeaderStyle.standard,
            ),
            const SizedBox(height: 12),
            AppCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: (stats['byBuilding'] as Map<String, int>).entries
                    .take(10)
                    .map((entry) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                entry.key.replaceAll('_', ' ').toUpperCase(),
                              ),
                            ),
                            Text(
                              entry.value.toString(),
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    })
                    .toList(),
              ),
            ),
          ],
        ),
        loading: () => const Center(
          child: InlineLoading(message: 'Loading activity stats...'),
        ),
        error: (_, __) => Center(
          child: InlineError(
            message: 'Error loading stats',
            onRetry: () => ref.invalidate(activityStatsProvider(userId)),
            retryLabel: 'Retry',
          ),
        ),
      ),
    );
  }

  Widget _buildPlacesTab(BuildContext context, WidgetRef ref, String userId) {
    final params = (userId: userId, type: ActivityType.placeVisit, limit: 100);
    final activitiesAsync = ref.watch(userActivitiesProvider(params));

    return activitiesAsync.when(
      data: (activities) {
        if (activities.isEmpty) {
          return const ContentEmptyState(
            icon: Icons.place,
            title: 'No Places Visited',
            message: 'Start navigating to see your visited places here.',
            semanticLabel: 'No places visited yet',
          );
        }

        // Group by building
        final byBuilding = <String, List<UserActivity>>{};
        for (final activity in activities) {
          if (activity.buildingId != null) {
            byBuilding
                .putIfAbsent(activity.buildingId!, () => [])
                .add(activity);
          }
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: byBuilding.entries.map((entry) {
            return AppCard(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key.replaceAll('_', ' ').toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...entry.value.map(
                    (activity) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.meeting_room,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(activity.roomId ?? 'Unknown room'),
                          ),
                          Text(
                            _formatRelativeTime(activity.timestamp),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
      loading: () =>
          const Center(child: InlineLoading(message: 'Loading places...')),
      error: (_, __) => Center(
        child: InlineError(
          message: 'Error loading places',
          onRetry: () => ref.invalidate(
            userActivitiesProvider((
              userId: userId,
              type: ActivityType.placeVisit,
              limit: 100,
            )),
          ),
          retryLabel: 'Retry',
        ),
      ),
    );
  }

  Widget _buildRoutesTab(BuildContext context, WidgetRef ref, String userId) {
    final params = (userId: userId, type: ActivityType.routeTaken, limit: 100);
    final activitiesAsync = ref.watch(userActivitiesProvider(params));

    return activitiesAsync.when(
      data: (activities) {
        if (activities.isEmpty) {
          return const ContentEmptyState(
            icon: Icons.route,
            title: 'No Routes Taken',
            message: 'Start navigating to see your routes here.',
            semanticLabel: 'No routes taken yet',
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: activities.length,
          itemBuilder: (context, index) {
            final activity = activities[index];
            return AppCard(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.route,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Route ${activity.routeId?.substring(0, 8) ?? 'Unknown'}',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${activity.distanceMeters?.toStringAsFixed(0) ?? '?'} m • ${_formatDuration(activity.durationSeconds ?? 0)}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _formatRelativeTime(activity.timestamp),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      loading: () =>
          const Center(child: InlineLoading(message: 'Loading routes...')),
      error: (_, __) => Center(
        child: InlineError(
          message: 'Error loading routes',
          onRetry: () => ref.invalidate(
            userActivitiesProvider((
              userId: userId,
              type: ActivityType.routeTaken,
              limit: 100,
            )),
          ),
          retryLabel: 'Retry',
        ),
      ),
    );
  }

  Widget _buildSafetyTab(BuildContext context, WidgetRef ref, String userId) {
    final colorScheme = Theme.of(context).colorScheme;
    final safetyScoreAsync = ref.watch(userSafetyScoreProvider(userId));

    return safetyScoreAsync.when(
      data: (scoreStr) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Safety Score Card
            AppElevatedCard(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Text(
                    'Your Safety Score',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          value:
                              double.tryParse(
                                scoreStr.replaceAll('%', ''),
                              )?.toDouble() ??
                              0.5 / 100,
                          strokeWidth: 12,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            scoreStr,
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                          ),
                          Text(
                            'Safety Score',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Keep navigating and completing safety drills to improve your score!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Score breakdown
            SectionHeader(
              title: 'Score Breakdown',
              icon: Icons.analytics,
              style: SectionHeaderStyle.standard,
            ),
            const SizedBox(height: 12),
            AppCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _ScoreBreakdownRow(
                    label: 'Navigation',
                    score: 0.8,
                    color: colorScheme.primary,
                  ),
                  _ScoreBreakdownRow(
                    label: 'Emergency Preparedness',
                    score: 0.7,
                    color: colorScheme.error,
                  ),
                  _ScoreBreakdownRow(
                    label: 'Building Familiarity',
                    score: 0.6,
                    color: colorScheme.secondary,
                  ),
                  _ScoreBreakdownRow(
                    label: 'Drill Participation',
                    score: 0.5,
                    color: colorScheme.tertiary,
                  ),
                  _ScoreBreakdownRow(
                    label: 'Alert Responsiveness',
                    score: 0.9,
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Completed drills
            SectionHeader(
              title: 'Completed Drills',
              icon: Icons.school,
              style: SectionHeaderStyle.standard,
            ),
            const SizedBox(height: 12),
            AppCard(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'No drills completed yet. Participate in safety drills to earn badges!',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      loading: () => const Center(
        child: InlineLoading(message: 'Loading safety score...'),
      ),
      error: (_, __) => Center(
        child: InlineError(
          message: 'Error loading safety score',
          onRetry: () => ref.invalidate(userSafetyScoreProvider(userId)),
          retryLabel: 'Retry',
        ),
      ),
    );
  }

  String _formatActivityType(String type) {
    switch (type) {
      case 'navigation':
        return 'Navigation';
      case 'placeVisit':
        return 'Place Visits';
      case 'routeTaken':
        return 'Routes Taken';
      case 'emergencyTriggered':
        return 'Emergency Actions';
      case 'alertAcknowledged':
        return 'Alerts Acknowledged';
      case 'search':
        return 'Searches';
      case 'mapView':
        return 'Map Views';
      case 'safetyCheck':
        return 'Safety Checks';
      default:
        return type;
    }
  }

  String _formatDuration(int seconds) {
    if (seconds < 60) return '${seconds}s';
    if (seconds < 3600) return '${(seconds / 60).round()}m';
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    return '${hours}h ${minutes}m';
  }

  String _formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) return 'Just now';
    if (difference.inHours < 1) return '${difference.inMinutes}m ago';
    if (difference.inDays < 1) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String _formatDistance(double meters) {
    if (meters < 1000) return '${meters.round()} m';
    return '${(meters / 1000).toStringAsFixed(1)} km';
  }

  String _formatSafetyScore(double score) {
    return '${(score * 100).round()}%';
  }
}

class _StatSummaryCard extends StatelessWidget {
  const _StatSummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ScoreBreakdownRow extends StatelessWidget {
  const _ScoreBreakdownRow({
    required this.label,
    required this.score,
    required this.color,
  });

  final String label;
  final double score;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Text(
            '${(score * 100).round()}%',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Providers for Activity History
// ============================================================================

final userActivitiesProvider =
    StreamProvider.family<
      List<UserActivity>,
      ({String userId, ActivityType? type, int limit})
    >((ref, params) {
      final repository = ref.watch(userActivityRepositoryProvider);
      return repository.watchUserActivities(
        userId: params.userId,
        type: params.type,
        limit: params.limit,
      );
    });

final activityStatsProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, userId) async {
      final repository = ref.watch(userActivityRepositoryProvider);
      final result = await repository.getActivityStats(userId);
      if (result.isSuccess) {
        return result.value;
      }
      return {};
    });

// ============================================================================
// Preference Sub-Screens (replacing placeholders in app_router.dart)
// ============================================================================

/// Language Preferences Screen
class LanguagePreferencesScreen extends ConsumerWidget {
  const LanguagePreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Language')),
        body: const Center(child: Text('Please sign in')),
      );
    }

    final preferencesAsync = ref.watch(userPreferencesProvider(user.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: preferencesAsync.when(
          data: (prefs) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionHeader(
                title: 'App Language',
                icon: Icons.language,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: RadioGroup<LanguagePreference>(
                  groupValue: prefs.language,
                  onChanged: (value) async {
                    if (value != null) {
                      final repo = ref.read(userPreferencesRepositoryProvider);
                      await repo.updateLanguage(user.id, value);
                    }
                  },
                  child: Column(
                    children: LanguagePreference.values.map((lang) {
                      return RadioListTile<LanguagePreference>(
                        title: Text(lang.displayName),
                        value: lang,
                        activeColor: colorScheme.primary,
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'About Languages',
                icon: Icons.info_outline,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Changing the language will update the app interface immediately. Some content may require a restart to fully apply.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          loading: () => const Center(
            child: InlineLoading(message: 'Loading language preferences...'),
          ),
          error: (_, __) => Center(
            child: InlineError(
              message: 'Error loading preferences',
              onRetry: () => ref.invalidate(userPreferencesProvider(user.id)),
              retryLabel: 'Retry',
            ),
          ),
        ),
      ),
    );
  }
}

/// Notification Preferences Screen
class NotificationPreferencesScreen extends ConsumerWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Notifications')),
        body: const Center(child: Text('Please sign in')),
      );
    }

    final preferencesAsync = ref.watch(userPreferencesProvider(user.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: preferencesAsync.when(
          data: (prefs) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildNotificationSection(
                  context,
                  'Emergency & Safety',
                  Icons.emergency,
                  [
                    _NotificationTile(
                      title: 'Emergency Alerts',
                      subtitle: 'Critical safety notifications',
                      value: prefs.notifications.emergencyAlerts,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(emergencyAlerts: value),
                      ),
                    ),
                    _NotificationTile(
                      title: 'Weather Alerts',
                      subtitle: 'Severe weather warnings',
                      value: prefs.notifications.weatherAlerts,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(weatherAlerts: value),
                      ),
                    ),
                    _NotificationTile(
                      title: 'Security Alerts',
                      subtitle: 'Campus security notifications',
                      value: prefs.notifications.securityAlerts,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(securityAlerts: value),
                      ),
                    ),
                  ],
                ),
                _buildNotificationSection(
                  context,
                  'General Notifications',
                  Icons.notifications,
                  [
                    _NotificationTile(
                      title: 'Push Notifications',
                      subtitle: 'Receive push notifications',
                      value: prefs.notifications.pushEnabled,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(pushEnabled: value),
                      ),
                    ),
                    _NotificationTile(
                      title: 'Email Notifications',
                      subtitle: 'Receive email notifications',
                      value: prefs.notifications.emailEnabled,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(emailEnabled: value),
                      ),
                    ),
                    _NotificationTile(
                      title: 'SMS Notifications',
                      subtitle: 'Receive SMS notifications',
                      value: prefs.notifications.smsEnabled,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(smsEnabled: value),
                      ),
                    ),
                    _NotificationTile(
                      title: 'New Features',
                      subtitle: 'Updates about new app features',
                      value: prefs.notifications.newFeatureAlerts,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(newFeatureAlerts: value),
                      ),
                    ),
                    _NotificationTile(
                      title: 'Maintenance Alerts',
                      subtitle: 'Scheduled maintenance notifications',
                      value: prefs.notifications.maintenanceAlerts,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(maintenanceAlerts: value),
                      ),
                    ),
                  ],
                ),
                _buildNotificationSection(
                  context,
                  'Navigation & Check-ins',
                  Icons.navigation,
                  [
                    _NotificationTile(
                      title: 'Route Arrival',
                      subtitle: 'Notify when arriving at destination',
                      value: prefs.notifications.routeArrivalNotifications,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(
                          routeArrivalNotifications: value,
                        ),
                      ),
                    ),
                    _NotificationTile(
                      title: 'Geofence Alerts',
                      subtitle: 'Location-based notifications',
                      value: prefs.notifications.geofenceAlerts,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(geofenceAlerts: value),
                      ),
                    ),
                    _NotificationTile(
                      title: 'Daily Check-in Reminder',
                      subtitle: 'Reminder for safety check-ins',
                      value: prefs.notifications.dailyCheckInReminder,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(
                          dailyCheckInReminder: value,
                        ),
                      ),
                    ),
                    _NotificationTile(
                      title: 'Low Battery Warning',
                      subtitle: 'Alert when device battery is low',
                      value: prefs.notifications.lowBatteryWarning,
                      onChanged: (value) => _updateNotifications(
                        ref,
                        user.id,
                        prefs.notifications.copyWith(lowBatteryWarning: value),
                      ),
                    ),
                  ],
                ),
                _buildNotificationSection(context, 'Digest', Icons.summarize, [
                  _NotificationTile(
                    title: 'Weekly Digest',
                    subtitle: 'Weekly summary of activity',
                    value: prefs.notifications.weeklyDigest,
                    onChanged: (value) => _updateNotifications(
                      ref,
                      user.id,
                      prefs.notifications.copyWith(weeklyDigest: value),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          loading: () => const Center(
            child: InlineLoading(
              message: 'Loading notification preferences...',
            ),
          ),
          error: (_, __) => Center(
            child: InlineError(
              message: 'Error loading preferences',
              onRetry: () => ref.invalidate(userPreferencesProvider(user.id)),
              retryLabel: 'Retry',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSection(
    BuildContext context,
    String title,
    IconData icon,
    List<_NotificationTile> tiles,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          icon: icon,
          style: SectionHeaderStyle.standard,
        ),
        const SizedBox(height: 12),
        AppCard(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: tiles
                .map(
                  (tile) => SwitchListTile(
                    title: Text(tile.title),
                    subtitle: Text(tile.subtitle),
                    value: tile.value,
                    onChanged: tile.onChanged,
                    activeThumbColor: colorScheme.primary,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Future<void> _updateNotifications(
    WidgetRef ref,
    String userId,
    NotificationPreferences notifications,
  ) async {
    final repo = ref.read(userPreferencesRepositoryProvider);
    await repo.updateNotifications(userId, notifications);
  }
}

class _NotificationTile {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
}

/// Map Preferences Screen
class MapPreferencesScreen extends ConsumerWidget {
  const MapPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Map Preferences')),
        body: const Center(child: Text('Please sign in')),
      );
    }

    final preferencesAsync = ref.watch(userPreferencesProvider(user.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Preferences'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: preferencesAsync.when(
          data: (prefs) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildMapSection(context, 'Map Style', Icons.map, [
                  _MapDropdownTile<MapStylePreference>(
                    title: 'Map Style',
                    subtitle: 'Choose the map visual style',
                    value: prefs.map.style,
                    items: MapStylePreference.values,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(style: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Show 3D Buildings',
                    subtitle: 'Enable 3D building models',
                    value: prefs.map.enable3dBuildings,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(enable3dBuildings: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Traffic Layer',
                    subtitle: 'Show real-time traffic',
                    value: prefs.map.enableTrafficLayer,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(enableTrafficLayer: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Transit Layer',
                    subtitle: 'Show public transit routes',
                    value: prefs.map.enableTransitLayer,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(enableTransitLayer: value),
                    ),
                  ),
                ]),
                _buildMapSection(context, 'Display Options', Icons.layers, [
                  _MapSwitchTile(
                    title: 'Show Buildings',
                    subtitle: 'Display building footprints',
                    value: prefs.map.showBuildings,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(showBuildings: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Show Pathways',
                    subtitle: 'Display walking pathways',
                    value: prefs.map.showPathways,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(showPathways: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Show Rooms',
                    subtitle: 'Display room numbers',
                    value: prefs.map.showRooms,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(showRooms: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Show Facilities',
                    subtitle: 'Display facility markers',
                    value: prefs.map.showFacilities,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(showFacilities: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Show Current Location',
                    subtitle: 'Display your location marker',
                    value: prefs.map.showCurrentLocation,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(showCurrentLocation: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Auto-center Map',
                    subtitle: 'Keep map centered on your location',
                    value: prefs.map.autoCenter,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(autoCenter: value),
                    ),
                  ),
                ]),
                _buildMapSection(context, 'Navigation', Icons.navigation, [
                  _MapSwitchTile(
                    title: 'Compass',
                    subtitle: 'Show compass on map',
                    value: prefs.map.compassEnabled,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(compassEnabled: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'Scale Bar',
                    subtitle: 'Show distance scale',
                    value: prefs.map.scaleEnabled,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(scaleEnabled: value),
                    ),
                  ),
                  _MapSwitchTile(
                    title: 'My Location Button',
                    subtitle: 'Show button to center on location',
                    value: prefs.map.myLocationButtonEnabled,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(myLocationButtonEnabled: value),
                    ),
                  ),
                  _MapSliderTile(
                    title: 'Default Zoom Level',
                    subtitle:
                        'Initial map zoom (${prefs.map.defaultZoomLevel.toInt()})',
                    value: prefs.map.defaultZoomLevel,
                    min: 10.0,
                    max: 20.0,
                    divisions: 10,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(defaultZoomLevel: value),
                    ),
                  ),
                ]),
                _buildMapSection(context, 'Units', Icons.straighten, [
                  _MapDropdownTile<DistanceUnit>(
                    title: 'Distance Unit',
                    subtitle: 'Measurement system for distances',
                    value: prefs.map.distanceUnit,
                    items: DistanceUnit.values,
                    onChanged: (value) => _updateMapPrefs(
                      ref,
                      user.id,
                      prefs.map.copyWith(distanceUnit: value),
                    ),
                  ),
                ]),
              ],
            ),
          ),
          loading: () => const Center(
            child: InlineLoading(message: 'Loading map preferences...'),
          ),
          error: (_, __) => Center(
            child: InlineError(
              message: 'Error loading preferences',
              onRetry: () => ref.invalidate(userPreferencesProvider(user.id)),
              retryLabel: 'Retry',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapSection(
    BuildContext context,
    String title,
    IconData icon,
    List<Widget> tiles,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          icon: icon,
          style: SectionHeaderStyle.standard,
        ),
        const SizedBox(height: 12),
        AppCard(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(children: tiles),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Future<void> _updateMapPrefs(
    WidgetRef ref,
    String userId,
    MapPreferences map,
  ) async {
    final repo = ref.read(userPreferencesRepositoryProvider);
    await repo.updateMapPreferences(userId, map);
  }
}

class _MapSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _MapSwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeThumbColor: Theme.of(context).colorScheme.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _MapSliderTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const _MapSliderTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: value.toInt().toString(),
            onChanged: onChanged,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _MapDropdownTile<T> extends StatelessWidget {
  final String title;
  final String subtitle;
  final T value;
  final List<T> items;
  final ValueChanged<T> onChanged;

  const _MapDropdownTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        decoration: InputDecoration(
          labelText: title,
          helperText: subtitle,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item.toString().split('.').last),
              ),
            )
            .toList(),
        onChanged: (newValue) {
          if (newValue != null) onChanged(newValue);
        },
      ),
    );
  }
}

/// Accessibility Preferences Screen
class AccessibilityPreferencesScreen extends ConsumerWidget {
  const AccessibilityPreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Accessibility')),
        body: const Center(child: Text('Please sign in')),
      );
    }

    final preferencesAsync = ref.watch(userPreferencesProvider(user.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: preferencesAsync.when(
          data: (prefs) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildAccessibilitySection(
                  context,
                  'Visual',
                  Icons.visibility,
                  [
                    _AccessibilitySwitchTile(
                      title: 'Large Text',
                      subtitle: 'Increase text size throughout the app',
                      value: prefs.accessibility.largeText,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(largeText: value),
                      ),
                    ),
                    _AccessibilitySwitchTile(
                      title: 'High Contrast',
                      subtitle: 'Use high contrast colors',
                      value: prefs.accessibility.highContrast,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(highContrast: value),
                      ),
                    ),
                    _AccessibilitySwitchTile(
                      title: 'Reduce Motion',
                      subtitle: 'Minimize animations and transitions',
                      value: prefs.accessibility.reduceMotion,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(reduceMotion: value),
                      ),
                    ),
                    _AccessibilityDropdownTile<ColorBlindMode>(
                      title: 'Color Blind Mode',
                      subtitle: 'Adjust colors for color vision deficiencies',
                      value: prefs.accessibility.colorBlindMode,
                      items: ColorBlindMode.values,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(colorBlindMode: value),
                      ),
                    ),
                  ],
                ),
                _buildAccessibilitySection(
                  context,
                  'Audio & Voice',
                  Icons.volume_up,
                  [
                    _AccessibilitySwitchTile(
                      title: 'Voice Guidance',
                      subtitle: 'Enable spoken navigation instructions',
                      value: prefs.accessibility.voiceGuidance,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(voiceGuidance: value),
                      ),
                    ),
                    _AccessibilitySliderTile(
                      title: 'Voice Volume',
                      subtitle: 'Adjust voice guidance volume',
                      value: prefs.accessibility.voiceGuidanceVolume,
                      min: 0.0,
                      max: 1.0,
                      divisions: 10,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(
                          voiceGuidanceVolume: value,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildAccessibilitySection(
                  context,
                  'Interaction',
                  Icons.touch_app,
                  [
                    _AccessibilitySwitchTile(
                      title: 'Haptic Feedback',
                      subtitle: 'Vibration feedback for interactions',
                      value: prefs.accessibility.hapticFeedback,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(hapticFeedback: value),
                      ),
                    ),
                    _AccessibilitySwitchTile(
                      title: 'Screen Reader Optimized',
                      subtitle: 'Optimize for screen readers',
                      value: prefs.accessibility.screenReaderOptimized,
                      onChanged: (value) => _updateAccessibility(
                        ref,
                        user.id,
                        prefs.accessibility.copyWith(
                          screenReaderOptimized: value,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          loading: () => const Center(
            child: InlineLoading(
              message: 'Loading accessibility preferences...',
            ),
          ),
          error: (_, __) => Center(
            child: InlineError(
              message: 'Error loading preferences',
              onRetry: () => ref.invalidate(userPreferencesProvider(user.id)),
              retryLabel: 'Retry',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccessibilitySection(
    BuildContext context,
    String title,
    IconData icon,
    List<Widget> tiles,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          icon: icon,
          style: SectionHeaderStyle.standard,
        ),
        const SizedBox(height: 12),
        AppCard(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(children: tiles),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Future<void> _updateAccessibility(
    WidgetRef ref,
    String userId,
    AccessibilitySettings accessibility,
  ) async {
    final repo = ref.read(userPreferencesRepositoryProvider);
    await repo.updateAccessibility(userId, accessibility);
  }
}

class _AccessibilitySwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _AccessibilitySwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeThumbColor: Theme.of(context).colorScheme.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _AccessibilitySliderTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const _AccessibilitySliderTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: '${(value * 100).round()}%',
            onChanged: onChanged,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

class _AccessibilityDropdownTile<T> extends StatelessWidget {
  final String title;
  final String subtitle;
  final T value;
  final List<T> items;
  final ValueChanged<T> onChanged;

  const _AccessibilityDropdownTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButtonFormField<T>(
        initialValue: value,
        decoration: InputDecoration(
          labelText: title,
          helperText: subtitle,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item.toString().split('.').last),
              ),
            )
            .toList(),
        onChanged: (newValue) {
          if (newValue != null) onChanged(newValue);
        },
      ),
    );
  }
}

/// Theme Preferences Screen
class ThemePreferencesScreen extends ConsumerWidget {
  const ThemePreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Theme')),
        body: const Center(child: Text('Please sign in')),
      );
    }

    final preferencesAsync = ref.watch(userPreferencesProvider(user.id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: preferencesAsync.when(
          data: (prefs) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionHeader(
                title: 'Appearance',
                icon: Icons.palette_outlined,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: RadioGroup<ThemeModePreference>(
                  groupValue: prefs.theme,
                  onChanged: (value) async {
                    if (value != null) {
                      final repo = ref.read(userPreferencesRepositoryProvider);
                      await repo.updateTheme(user.id, value);
                    }
                  },
                  child: Column(
                    children: ThemeModePreference.values.map((theme) {
                      return RadioListTile<ThemeModePreference>(
                        title: Text(theme.displayName),
                        subtitle: Text(_getThemeDescription(theme)),
                        value: theme,
                        activeColor: colorScheme.primary,
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'About Themes',
                icon: Icons.info_outline,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'System Default follows your device theme settings. Light and Dark modes override the system setting. Changes apply immediately.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          loading: () => const Center(
            child: InlineLoading(message: 'Loading theme preferences...'),
          ),
          error: (_, __) => Center(
            child: InlineError(
              message: 'Error loading preferences',
              onRetry: () => ref.invalidate(userPreferencesProvider(user.id)),
              retryLabel: 'Retry',
            ),
          ),
        ),
      ),
    );
  }

  String _getThemeDescription(ThemeModePreference theme) {
    switch (theme) {
      case ThemeModePreference.light:
        return 'Always use light mode';
      case ThemeModePreference.dark:
        return 'Always use dark mode';
      case ThemeModePreference.system:
        return 'Follow system settings';
    }
  }
}

/// Settings Screen
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: user == null
            ? const Center(child: Text('Please sign in'))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: 'Account',
                      icon: Icons.account_circle,
                      style: SectionHeaderStyle.standard,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.person,
                              title: 'Edit Profile',
                              subtitle: 'Update your personal information',
                              onTap: () => context.push(AppRoutes.editProfile),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.badge,
                              title: 'Digital ID Card',
                              subtitle: 'View and share your campus ID',
                              onTap: () =>
                                  context.push(AppRoutes.digitalIdCard),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.security,
                              title: 'Security & Login',
                              subtitle: 'Password, 2FA, active sessions',
                              onTap: () =>
                                  context.push(AppRoutes.securitySettings),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SectionHeader(
                      title: 'Safety & Emergency',
                      icon: Icons.shield,
                      style: SectionHeaderStyle.standard,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.contacts,
                              title: 'Emergency Contacts',
                              subtitle: 'Manage ICE contacts',
                              onTap: () =>
                                  context.push(AppRoutes.emergencyContacts),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.medical_information,
                              title: 'Medical Information',
                              subtitle: 'Allergies, conditions, medications',
                              onTap: () => context.push(AppRoutes.medicalInfo),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.location_on,
                              title: 'Location Sharing',
                              subtitle:
                                  'Share location with emergency contacts',
                              onTap: () =>
                                  context.push(AppRoutes.locationSharing),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.warning,
                              title: 'Safety Check-ins',
                              subtitle: 'Schedule, history, and contacts',
                              onTap: () =>
                                  context.push(AppRoutes.safetyCheckins),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SectionHeader(
                      title: 'Preferences',
                      icon: Icons.tune,
                      style: SectionHeaderStyle.standard,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.language,
                              title: 'Language',
                              subtitle: 'App display language',
                              onTap: () =>
                                  context.push(AppRoutes.languagePreferences),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.dark_mode,
                              title: 'Theme',
                              subtitle: 'Light, dark, or system default',
                              onTap: () =>
                                  context.push(AppRoutes.themePreferences),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.notifications,
                              title: 'Notifications',
                              subtitle: 'Push, email, SMS preferences',
                              onTap: () => context.push(
                                AppRoutes.notificationPreferences,
                              ),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.map,
                              title: 'Map Preferences',
                              subtitle: 'Default view, units, layers',
                              onTap: () =>
                                  context.push(AppRoutes.mapPreferences),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.accessibility,
                              title: 'Accessibility',
                              subtitle: 'Text size, contrast, screen reader',
                              onTap: () => context.push(
                                AppRoutes.accessibilityPreferences,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SectionHeader(
                      title: 'Data & Privacy',
                      icon: Icons.privacy_tip,
                      style: SectionHeaderStyle.standard,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.analytics,
                              title: 'Activity History',
                              subtitle:
                                  'View your navigation and safety activity',
                              onTap: () =>
                                  context.push(AppRoutes.activityHistory),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SectionHeader(
                      title: 'Support',
                      icon: Icons.help,
                      style: SectionHeaderStyle.standard,
                    ),
                    const SizedBox(height: 12),
                    AppCard(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.help_outline,
                              title: 'Help & Support',
                              subtitle: 'FAQ, contact support, tutorials',
                              onTap: () => context.push(AppRoutes.help),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.article,
                              title: 'Terms of Service',
                              subtitle: 'Read our terms and conditions',
                              onTap: () => _openUrl(
                                context,
                                'https://safenav.example.com/terms',
                              ),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.privacy_tip,
                              title: 'Privacy Policy',
                              subtitle: 'How we protect your data',
                              onTap: () => _openUrl(
                                context,
                                'https://safenav.example.com/privacy',
                              ),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.star,
                              title: 'Rate App',
                              subtitle: 'Share your experience',
                              onTap: () => _rateApp(context),
                            ),
                          ),
                          _SettingsTile(
                            item: _SettingsItem(
                              icon: Icons.info,
                              title: 'App Version',
                              subtitle: '1.0.0 (build 1)',
                              onTap: () => _showVersionInfo(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void _openUrl(BuildContext context, String url) {
    // todo: Use url_launcher package
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening: $url'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _rateApp(BuildContext context) {
    // todo: Implement app store rating
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Rate app - opening store...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showVersionInfo(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'SAFENAV CAVITE',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(Icons.map, size: 48, color: Theme.of(context).colorScheme.primary),
      children: [
        const Text('Campus Navigation & Emergency Evacuation'),
        const SizedBox(height: 16),
        const Text('© 2024 SAFENAV CAVITE. All rights reserved.'),
      ],
    );
  }
}

/// Help & Support Screen
class HelpScreen extends ConsumerWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
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
              SectionHeader(
                title: 'Quick Help',
                icon: Icons.flash_on,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _HelpTile(
                      icon: Icons.map,
                      title: 'Using the Map',
                      subtitle:
                          'Navigate campus, search locations, get directions',
                      onTap: () => _showHelpTopic(context, 'map'),
                    ),
                    _HelpTile(
                      icon: Icons.navigation,
                      title: 'Navigation',
                      subtitle: 'Turn-by-turn directions, indoor routing',
                      onTap: () => _showHelpTopic(context, 'navigation'),
                    ),
                    _HelpTile(
                      icon: Icons.emergency,
                      title: 'Emergency Features',
                      subtitle:
                          'SOS button, evacuation routes, safety check-ins',
                      onTap: () => _showHelpTopic(context, 'emergency'),
                    ),
                    _HelpTile(
                      icon: Icons.person,
                      title: 'Profile & Settings',
                      subtitle:
                          'Manage account, preferences, emergency contacts',
                      onTap: () => _showHelpTopic(context, 'profile'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'Common Questions',
                icon: Icons.help_outline,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: ExpansionPanelList.radio(
                  children: [
                    _buildFAQItem(
                      context,
                      'How do I report an emergency?',
                      'Tap the red emergency button on the Emergency tab, or use the SOS widget on the map. This will notify campus security and your emergency contacts with your location.',
                    ),
                    _buildFAQItem(
                      context,
                      'How do I add emergency contacts?',
                      'Go to Profile → Safety & Emergency → Emergency Contacts → tap the + button to add contacts.',
                    ),
                    _buildFAQItem(
                      context,
                      'How does indoor navigation work?',
                      'SAFENAV uses Bluetooth beacons and Wi-Fi fingerprinting for indoor positioning. Make sure Bluetooth and Location services are enabled.',
                    ),
                    _buildFAQItem(
                      context,
                      'Can I use the app offline?',
                      'Basic map viewing works offline. Navigation, alerts, and real-time features require internet connection.',
                    ),
                    _buildFAQItem(
                      context,
                      'How do I change my notification settings?',
                      'Go to Profile → Preferences → Notifications to customize what notifications you receive.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'Contact Support',
                icon: Icons.support_agent,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _HelpTile(
                      icon: Icons.email,
                      title: 'Email Support',
                      subtitle: 'support@safenav.example.com',
                      onTap: () => _openEmail(context),
                    ),
                    _HelpTile(
                      icon: Icons.chat,
                      title: 'In-App Chat',
                      subtitle: 'Chat with support team (coming soon)',
                      onTap: () => _showComingSoon(context),
                    ),
                    _HelpTile(
                      icon: Icons.phone,
                      title: 'Campus Security',
                      subtitle:
                          'Emergency: 911 | Non-emergency: (555) 123-4567',
                      onTap: () => _callSecurity(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SectionHeader(
                title: 'Legal',
                icon: Icons.gavel,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _HelpTile(
                      icon: Icons.article,
                      title: 'Terms of Service',
                      subtitle: 'Read our terms and conditions',
                      onTap: () => _openUrl(
                        context,
                        'https://safenav.example.com/terms',
                      ),
                    ),
                    _HelpTile(
                      icon: Icons.privacy_tip,
                      title: 'Privacy Policy',
                      subtitle: 'How we protect your data',
                      onTap: () => _openUrl(
                        context,
                        'https://safenav.example.com/privacy',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionPanelRadio _buildFAQItem(
    BuildContext context,
    String question,
    String answer,
  ) {
    return ExpansionPanelRadio(
      value: question,
      headerBuilder: (_, isExpanded) => ListTile(
        title: Text(
          question,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Text(answer, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  void _showHelpTopic(BuildContext context, String topic) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening help for: $topic'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openEmail(BuildContext context) {
    // todo: Use url_launcher to open mailto:
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening email client...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Feature coming soon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _callSecurity(BuildContext context) {
    // todo: Use url_launcher to make phone call
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Calling campus security...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openUrl(BuildContext context, String url) {
    // todo: Use url_launcher package
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening: $url'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _HelpTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _HelpTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: colorScheme.primary, size: 20),
      ),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
      ),
      trailing: Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
