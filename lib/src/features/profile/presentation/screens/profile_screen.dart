/// SAFENAV CAVITE - Profile Screen
///
/// User profile screen with settings, preferences, and account management.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/widgets.dart';
import '../../../../shared/models/user.dart';
import '../../../../features/auth/auth_state.dart';

/// Profile screen - 5th tab in bottom navigation
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final authState = ref.watch(authStatusProvider);
    final user = authState.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _navigateToSettings(context),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile header
              _buildProfileHeader(context, user),

              const SizedBox(height: 24),

              // Quick stats
              _buildQuickStats(context, user),

              const SizedBox(height: 24),

              // Account section
              SectionHeader(
                title: 'Account',
                icon: Icons.person_outline,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildAccountSection(context, user),

              const SizedBox(height: 24),

              // Preferences section
              SectionHeader(
                title: 'Preferences',
                icon: Icons.tune,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildPreferencesSection(context),

              const SizedBox(height: 24),

              // Safety section
              SectionHeader(
                title: 'Safety & Emergency',
                icon: Icons.shield_outlined,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildSafetySection(context),

              const SizedBox(height: 24),

              // About section
              SectionHeader(
                title: 'About',
                icon: Icons.info_outline,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildAboutSection(context),

              const SizedBox(height: 24),

              // Sign out button
              if (authState.isAuthenticated)
                _buildSignOutButton(context, ref),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, User? user) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppElevatedCard(
      padding: const EdgeInsets.all(24),
      elevation: 2,
      child: Column(
        children: [
          // Avatar
          Stack(
            children: [
              AppAvatar(
                name: user?.displayName,
                imageUrl: user?.photoUrl,
                radius: 56,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: user?.isActive == true ? Colors.green : colorScheme.outline,
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.surface, width: 3),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Name and role
          Text(
            user?.displayName ?? 'Guest User',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          // Role badge
          if (user != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _getRoleColor(user.role, colorScheme).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _getRoleColor(user.role, colorScheme).withValues(alpha: 0.5),
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

          // Email and ID
          if (user != null) ...[
            Text(
              user.email,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
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
          ],

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

  Widget _buildQuickStats(BuildContext context, User? user) {
    final stats = [
      _StatItem(
        icon: Icons.map,
        label: 'Places Visited',
        value: '42',
        color: Colors.blue,
      ),
      _StatItem(
        icon: Icons.route,
        label: 'Routes Taken',
        value: '128',
        color: Colors.green,
      ),
      _StatItem(
        icon: Icons.notifications,
        label: 'Alerts Received',
        value: '15',
        color: Colors.orange,
      ),
      _StatItem(
        icon: Icons.emergency,
        label: 'Safety Score',
        value: '98%',
        color: Colors.red,
      ),
    ];

    return Row(
      children: stats.map((stat) => Expanded(child: _StatCard(stat: stat))).toList(),
    );
  }

  Widget _buildAccountSection(BuildContext context, User? user) {
    final items = [
      _SettingsItem(
        icon: Icons.badge,
        title: 'My ID',
        subtitle: user?.idNumber ?? 'Not set',
        onTap: () => _navigateToIdCard(context),
      ),
      _SettingsItem(
        icon: Icons.verified_user,
        title: 'Verification Status',
        subtitle: user?.emailVerified == true ? 'Verified' : 'Pending',
        trailing: user?.emailVerified == true
            ? Icon(Icons.check_circle, color: Colors.green, size: 20)
            : Icon(Icons.pending, color: Colors.orange, size: 20),
        onTap: () => _navigateToVerification(context),
      ),
      _SettingsItem(
        icon: Icons.security,
        title: 'Security & Login',
        subtitle: 'Password, 2FA, sessions',
        onTap: () => _navigateToSecurity(context),
      ),
      _SettingsItem(
        icon: Icons.download,
        title: 'Export My Data',
        subtitle: 'Download your data',
        onTap: () => _exportData(context),
      ),
      _SettingsItem(
        icon: Icons.delete_forever,
        title: 'Delete Account',
        subtitle: 'Permanently delete your account',
        isDestructive: true,
        onTap: () => _confirmDeleteAccount(context),
      ),
    ];

    return Column(
      children: items.map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    final items = [
      _SettingsItem(
        icon: Icons.language,
        title: 'Language',
        subtitle: 'English (US)',
        onTap: () => _navigateToLanguage(context),
      ),
      _SettingsItem(
        icon: Icons.dark_mode,
        title: 'Theme',
        subtitle: 'System default',
        trailing: _ThemeSelector(),
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
    ];

    return Column(
      children: items.map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Widget _buildSafetySection(BuildContext context) {
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
        subtitle: 'Allergies, conditions, medications',
        onTap: () => _navigateToMedicalInfo(context),
      ),
      _SettingsItem(
        icon: Icons.location_on,
        title: 'Location Sharing',
        subtitle: 'Share location with contacts',
        trailing: _LocationSharingToggle(),
        onTap: () => _navigateToLocationSharing(context),
      ),
      _SettingsItem(
        icon: Icons.warning,
        title: 'Safety Check-ins',
        subtitle: 'Automatic check-in reminders',
        onTap: () => _navigateToSafetyCheckins(context),
      ),
    ];

    return Column(
      children: items.map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    final items = [
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
    ];

    return Column(
      children: items.map((item) => _SettingsTile(item: item)).toList(),
    );
  }

  Widget _buildSignOutButton(BuildContext context, WidgetRef ref) {
    return AppFilledButton(
      onPressed: () => _confirmSignOut(context, ref),
      label: 'Sign Out',
      icon: Icons.logout,
      iconPosition: IconPosition.leading,
      backgroundColor: Theme.of(context).colorScheme.error,
      foregroundColor: Theme.of(context).colorScheme.onError,
    );
  }

  Color _getRoleColor(UserRole role, ColorScheme colorScheme) {
    switch (role) {
      case UserRole.admin:
        return Colors.purple;
      case UserRole.security:
        return Colors.red;
      case UserRole.faculty:
        return Colors.blue;
      case UserRole.student:
        return Colors.green;
    }
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/settings');
  }

  void _navigateToEditProfile(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edit profile - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToIdCard(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('ID Card - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToVerification(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Verification - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToSecurity(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Security settings - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _exportData(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Export data - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account?'),
        content: const Text(
          'This action cannot be undone. All your data will be permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account deleted - TODO'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _navigateToLanguage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Language settings - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToTheme(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Theme settings - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToNotifications(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification preferences - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToMapPrefs(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Map preferences - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToAccessibility(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Accessibility settings - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToEmergencyContacts(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Emergency contacts - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToMedicalInfo(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Medical information - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToLocationSharing(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Location sharing - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToSafetyCheckins(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Safety check-ins - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Help & support - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _rateApp(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Rate app - TODO'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showVersionInfo(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'SAFENAV CAVITE',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.map, size: 48, color: Colors.blue),
      children: [
        const Text('Campus Navigation & Emergency Evacuation'),
        const SizedBox(height: 16),
        const Text('© 2024 SAFENAV CAVITE. All rights reserved.'),
      ],
    );
  }

  void _confirmSignOut(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out?'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement actual sign out via auth service
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Signed out successfully'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}

/// Stat item for quick stats
class _StatItem {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
}

/// Stat card
class _StatCard extends StatelessWidget {
  const _StatCard({required this.stat});

  final _StatItem stat;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: AppCard(
        padding: const EdgeInsets.all(16),
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
            Text(
              stat.value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
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

/// Settings item
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

/// Settings tile
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
              color: item.isDestructive ? colorScheme.error : colorScheme.primary,
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
          ] else ...[
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: colorScheme.onSurfaceVariant,
            ),
          ],
        ],
      ),
    );
  }
}

/// Theme selector widget
class _ThemeSelector extends ConsumerWidget {
  const _ThemeSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, this would watch a theme mode provider
    return PopupMenuButton<ThemeMode>(
      initialValue: ThemeMode.system,
      icon: Icon(
        Icons.brightness_auto,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: ThemeMode.light,
          child: Row(
            children: [
              Icon(Icons.light_mode, size: 20),
              SizedBox(width: 12),
              Text('Light'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: ThemeMode.dark,
          child: Row(
            children: [
              Icon(Icons.dark_mode, size: 20),
              SizedBox(width: 12),
              Text('Dark'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: ThemeMode.system,
          child: Row(
            children: [
              Icon(Icons.brightness_auto, size: 20),
              SizedBox(width: 12),
              Text('System'),
            ],
          ),
        ),
      ],
      onSelected: (mode) {
        // TODO: Save theme preference
      },
    );
  }
}

/// Location sharing toggle
class _LocationSharingToggle extends ConsumerWidget {
  const _LocationSharingToggle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, this would watch a location sharing provider
    bool isEnabled = true; // Mock value

    return Switch(
      value: isEnabled,
      onChanged: (value) {
        // TODO: Update location sharing preference
      },
      activeThumbColor: Theme.of(context).colorScheme.primary,
    );
  }
}

/// Settings screen (separate route)
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Theme section
              SectionHeader(
                title: 'Appearance',
                icon: Icons.palette,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildThemeSection(context),

              const SizedBox(height: 24),

              // Notifications section
              SectionHeader(
                title: 'Notifications',
                icon: Icons.notifications,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildNotificationsSection(context),

              const SizedBox(height: 24),

              // Map section
              SectionHeader(
                title: 'Map & Navigation',
                icon: Icons.map,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildMapSection(context),

              const SizedBox(height: 24),

              // Emergency section
              SectionHeader(
                title: 'Emergency Settings',
                icon: Icons.emergency,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildEmergencySection(context),

              const SizedBox(height: 24),

              // Privacy section
              SectionHeader(
                title: 'Privacy & Data',
                icon: Icons.privacy_tip,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildPrivacySection(context),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    return Column(
      children: [
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.brightness_auto,
            title: 'Theme Mode',
            subtitle: 'System default',
            trailing: _ThemeSelector(),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.color_lens,
            title: 'Accent Color',
            subtitle: 'Blue (default)',
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.text_fields,
            title: 'Font Size',
            subtitle: 'Medium',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationsSection(BuildContext context) {
    return Column(
      children: [
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.push_pin,
            title: 'Push Notifications',
            subtitle: 'Receive alerts and updates',
            trailing: _NotificationToggle('push'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.email,
            title: 'Email Notifications',
            subtitle: 'Important announcements via email',
            trailing: _NotificationToggle('email'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.sms,
            title: 'SMS Alerts',
            subtitle: 'Critical emergencies only',
            trailing: _NotificationToggle('sms'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.schedule,
            title: 'Quiet Hours',
            subtitle: '10:00 PM - 7:00 AM',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection(BuildContext context) {
    return Column(
      children: [
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.layers,
            title: 'Map Layers',
            subtitle: 'Buildings, POIs, routes, heatmap',
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.straighten,
            title: 'Distance Units',
            subtitle: 'Metric (meters/kilometers)',
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.compass_calibration,
            title: 'Compass & Orientation',
            subtitle: 'Auto-rotate map with device',
            trailing: _MapToggle('compass'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.gps_fixed,
            title: 'GPS Accuracy',
            subtitle: 'High accuracy (uses more battery)',
            trailing: _MapToggle('gps_high'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.offline_pin,
            title: 'Offline Maps',
            subtitle: 'Download campus map for offline use',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildEmergencySection(BuildContext context) {
    return Column(
      children: [
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.contact_phone,
            title: 'Emergency Contacts (ICE)',
            subtitle: 'Manage in-case-of-emergency contacts',
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.medical_information,
            title: 'Medical ID',
            subtitle: 'Allergies, conditions, medications',
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.location_on,
            title: 'Auto-share Location on SOS',
            subtitle: 'Share location with emergency contacts',
            trailing: _EmergencyToggle('auto_share_location'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.volume_up,
            title: 'Emergency Alert Sounds',
            subtitle: 'Play sound even in silent mode',
            trailing: _EmergencyToggle('alert_sounds'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.vibration,
            title: 'Vibration on Emergency',
            subtitle: 'Vibrate for critical alerts',
            trailing: _EmergencyToggle('vibration'),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildPrivacySection(BuildContext context) {
    return Column(
      children: [
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.location_on,
            title: 'Location Sharing',
            subtitle: 'Share real-time location with contacts',
            trailing: _PrivacyToggle('location_sharing'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.analytics,
            title: 'Analytics & Usage Data',
            subtitle: 'Help improve the app anonymously',
            trailing: _PrivacyToggle('analytics'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.history,
            title: 'Location History',
            subtitle: 'Store visited places for quick access',
            trailing: _PrivacyToggle('location_history'),
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.download,
            title: 'Export My Data',
            subtitle: 'Download all your data',
            onTap: () {},
          ),
        ),
        _SettingsTile(
          item: _SettingsItem(
            icon: Icons.delete_forever,
            title: 'Delete All Data',
            subtitle: 'Permanently delete account and data',
            isDestructive: true,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

/// Toggle widgets for settings
class _NotificationToggle extends ConsumerWidget {
  const _NotificationToggle(this.type);

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock values
    final enabled = type != 'sms';
    return Switch(
      value: enabled,
      onChanged: (value) {
        // TODO: Save notification preference
      },
      activeThumbColor: Theme.of(context).colorScheme.primary,
    );
  }
}

class _MapToggle extends ConsumerWidget {
  const _MapToggle(this.type);

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = type == 'compass';
    return Switch(
      value: enabled,
      onChanged: (value) {
        // TODO: Save map preference
      },
      activeThumbColor: Theme.of(context).colorScheme.primary,
    );
  }
}

class _EmergencyToggle extends ConsumerWidget {
  const _EmergencyToggle(this.type);

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = true;
    return Switch(
      value: enabled,
      onChanged: (value) {
        // TODO: Save emergency preference
      },
      activeThumbColor: Theme.of(context).colorScheme.error,
    );
  }
}

class _PrivacyToggle extends ConsumerWidget {
  const _PrivacyToggle(this.type);

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = type != 'location_history';
    return Switch(
      value: enabled,
      onChanged: (value) {
        // TODO: Save privacy preference
      },
      activeThumbColor: Theme.of(context).colorScheme.primary,
    );
  }
}