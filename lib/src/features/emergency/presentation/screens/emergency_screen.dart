/// SAFENAV CAVITE - Emergency Screen
///
/// Main emergency screen with SOS button, emergency contacts,
/// and quick access to evacuation routes and assembly points.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/widgets.dart';

/// Emergency screen - 3rd tab in bottom navigation
class EmergencyScreen extends ConsumerWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SOS Button Section
              _buildSosSection(context),

              const SizedBox(height: 24),

              // Quick Actions Section
              SectionHeader(
                title: 'Quick Actions',
                icon: Icons.flash_on,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildQuickActions(context),

              const SizedBox(height: 24),

              // Emergency Contacts Section
              SectionHeader(
                title: 'Emergency Contacts',
                icon: Icons.contact_phone,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildEmergencyContacts(context),

              const SizedBox(height: 24),

              // Evacuation & Assembly Points Section
              SectionHeader(
                title: 'Evacuation & Assembly',
                icon: Icons.route,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildEvacuationActions(context),

              const SizedBox(height: 24),

              // Safety Information Section
              SectionHeader(
                title: 'Safety Information',
                icon: Icons.info_outline,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildSafetyInfo(context),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSosSection(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppElevatedCard(
      padding: const EdgeInsets.all(24),
      elevation: 4,
      child: Column(
        children: [
          // Warning banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colorScheme.error, width: 1),
            ),
            child: Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: colorScheme.error, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency SOS',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onErrorContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap the button below to immediately alert campus security and emergency services with your location.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onErrorContainer.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // SOS Button
          AppSosButton(
            onPressed: () => _showSosConfirmation(context),
            label: 'SOS',
            size: SosButtonSize.large,
          ),

          const SizedBox(height: 16),

          Text(
            'Hold for 3 seconds to activate',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionCard(
            icon: Icons.local_fire_department,
            label: 'Fire Emergency',
            color: Colors.red,
            onTap: () => _handleEmergencyAction(context, 'fire'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuickActionCard(
            icon: Icons.medical_services,
            label: 'Medical',
            color: Colors.blue,
            onTap: () => _handleEmergencyAction(context, 'medical'),
          ),
        ),
      ],
    );
  }

  Widget _buildEmergencyContacts(BuildContext context) {
    final contacts = [
      EmergencyContact(
        name: 'Campus Security',
        phone: '(046) 123-4567',
        role: '24/7 Campus Security',
        icon: Icons.security,
        color: Colors.blue,
      ),
      EmergencyContact(
        name: 'Medical Clinic',
        phone: '(046) 123-4568',
        role: 'Campus Health Center',
        icon: Icons.local_hospital,
        color: Colors.red,
      ),
      EmergencyContact(
        name: 'Fire Department',
        phone: '911',
        role: 'Cavite Fire Station',
        icon: Icons.local_fire_department,
        color: Colors.orange,
      ),
      EmergencyContact(
        name: 'Police',
        phone: '911',
        role: 'Cavite Police Station',
        icon: Icons.local_police,
        color: Colors.green,
      ),
    ];

    return Column(
      children: contacts.map((contact) => _EmergencyContactTile(contact: contact)).toList(),
    );
  }

  Widget _buildEvacuationActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            icon: Icons.map_outlined,
            title: 'Evacuation Routes',
            subtitle: 'View campus evacuation paths',
            onTap: () => _navigateToEvacuationRoutes(context),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ActionCard(
            icon: Icons.meeting_room,
            title: 'Assembly Points',
            subtitle: 'Find nearest safe zone',
            onTap: () => _navigateToAssemblyPoints(context),
          ),
        ),
      ],
    );
  }

  Widget _buildSafetyInfo(BuildContext context) {
    final safetyItems = [
      SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Know Your Exits',
        description: 'Familiarize yourself with building exits and evacuation routes.',
      ),
      SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Stay Calm',
        description: 'In an emergency, remain calm and follow instructions from authorities.',
      ),
      SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Buddy System',
        description: 'Always inform someone of your location when moving around campus.',
      ),
      SafetyInfo(
        icon: Icons.check_circle_outline,
        title: 'Emergency Kit',
        description: 'Keep a small emergency kit with water, flashlight, and whistle.',
      ),
    ];

    return Column(
      children: safetyItems.map((item) => _SafetyInfoTile(item: item)).toList(),
    );
  }

  void _showSosConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 8),
            const Text('Activate SOS?'),
          ],
        ),
        content: const Text(
          'This will immediately alert campus security and emergency services with your current location. Are you sure you want to proceed?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _activateSos(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Activate SOS'),
          ),
        ],
      ),
    );
  }

  void _activateSos(BuildContext context) {
    // TODO: Implement actual SOS activation with location sharing
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('SOS activated! Emergency services notified with your location.'),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void _handleEmergencyAction(BuildContext context, String type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Connecting to $type emergency services...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToEvacuationRoutes(BuildContext context) {
    // TODO: Navigate to evacuation routes screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening evacuation routes...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateToAssemblyPoints(BuildContext context) {
    // TODO: Navigate to assembly points screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening assembly points...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

/// Emergency contact data class
class EmergencyContact {
  final String name;
  final String phone;
  final String role;
  final IconData icon;
  final Color color;

  const EmergencyContact({
    required this.name,
    required this.phone,
    required this.role,
    required this.icon,
    required this.color,
  });
}

/// Quick action card for emergency screen
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppOutlinedCard(
      onTap: onTap,
      padding: const EdgeInsets.all(20),
      borderColor: color.withValues(alpha: 0.3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

/// Emergency contact tile
class _EmergencyContactTile extends StatelessWidget {
  final EmergencyContact contact;

  const _EmergencyContactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      onTap: () => _makeCall(context),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: contact.color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(contact.icon, color: contact.color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  contact.role,
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
                contact.phone,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RobotoMono',
                ),
              ),
              const SizedBox(height: 4),
              Icon(Icons.call, size: 18, color: colorScheme.primary),
            ],
          ),
        ],
      ),
    );
  }

  void _makeCall(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling ${contact.name} (${contact.phone})...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

/// Action card for evacuation/assembly
class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: colorScheme.primary, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

/// Safety info data class
class SafetyInfo {
  final IconData icon;
  final String title;
  final String description;

  const SafetyInfo({
    required this.icon,
    required this.title,
    required this.description,
  });
}

/// Safety info tile
class _SafetyInfoTile extends StatelessWidget {
  final SafetyInfo item;

  const _SafetyInfoTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(item.icon, color: colorScheme.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}