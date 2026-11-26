/// SAFENAV CAVITE - App Router
///
/// GoRouter configuration with route definitions.
/// Authentication has been replaced with a BEGIN entry screen.
library;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import '../../features/onboarding/onboarding.dart';
import '../../features/map/presentation/screens/map_screen.dart';
import '../../features/navigation/presentation/screens/navigation_screen.dart';
import '../../features/emergency/presentation/screens/emergency_screen.dart';
import '../../features/emergency/presentation/screens/evacuation_route_screen.dart';
import '../../features/alerts/presentation/screens/alerts_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/digital_twin/presentation/screens/digital_twin_screen.dart';
import '../../shared/widgets/widgets.dart';
import '../services/connectivity_service.dart';

/// Router configuration provider
final routerProvider = Provider<GoRouter>((ref) {
  debugPrint('[ROUTER] routerProvider: Creating GoRouter...');
  final router = _createRouter();
  debugPrint('[ROUTER] routerProvider: GoRouter created');
  return router;
});

/// Creates the GoRouter instance with all routes and guards
GoRouter _createRouter() {
  debugPrint(
    '[ROUTER] _createRouter: Building GoRouter with initialLocation=${AppRoutes.begin}',
  );
  return GoRouter(
    initialLocation: AppRoutes.begin,
    debugLogDiagnostics: true,
    routes: _buildRoutes(),
    errorBuilder: (context, state) => _ErrorScreen(error: state.error),
  );
}

/// Builds all application routes
List<RouteBase> _buildRoutes() {
  return [
    // Splash route - redirects to begin
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const _SplashScreen(),
    ),

    // Begin (entry) route - replaces login/registration
    GoRoute(
      path: AppRoutes.begin,
      name: 'begin',
      builder: (context, state) => const BeginScreen(),
    ),

    // Main app shell with bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          _MainShell(navigationShell: navigationShell),
      branches: [
        // Home/Map branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              name: 'home',
              builder: (context, state) => const MapScreen(),
              routes: [
                GoRoute(
                  path: 'location/:locationId',
                  name: 'location-detail',
                  builder: (context, state) => _LocationDetailScreen(
                    locationId: state.pathParameters['locationId']!,
                  ),
                ),
                GoRoute(
                  path: 'building/:buildingId',
                  name: 'building-detail',
                  builder: (context, state) => _BuildingDetailScreen(
                    buildingId: state.pathParameters['buildingId']!,
                  ),
                ),
                GoRoute(
                  path: 'digital-twin/:buildingId',
                  name: 'digital-twin',
                  builder: (context, state) => DigitalTwinScreen(
                    buildingId: state.pathParameters['buildingId']!,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Navigation branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.navigation,
              name: 'navigation',
              builder: (context, state) => const NavigationScreen(),
              routes: [
                GoRoute(
                  path: ':routeId',
                  name: 'navigation-detail',
                  builder: (context, state) => _NavigationDetailScreen(
                    routeId: state.pathParameters['routeId']!,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Emergency branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.emergency,
              name: 'emergency',
              builder: (context, state) => const EmergencyScreen(),
              routes: [
                GoRoute(
                  path: 'evacuation',
                  name: 'evacuation',
                  builder: (context, state) => const EvacuationRouteScreen(),
                ),
                GoRoute(
                  path: 'evacuation/:routeId',
                  name: 'evacuation-detail',
                  builder: (context, state) => _EvacuationDetailScreen(
                    routeId: state.pathParameters['routeId']!,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Alerts branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.alerts,
              name: 'alerts',
              builder: (context, state) => const AlertsScreen(),
              routes: [
                GoRoute(
                  path: ':alertId',
                  name: 'alert-detail',
                  builder: (context, state) => AlertDetailScreen(
                    alertId: state.pathParameters['alertId']!,
                  ),
                ),
                GoRoute(
                  path: 'create',
                  name: 'create-alert',
                  builder: (context, state) => const CreateAlertScreen(),
                ),
              ],
            ),
          ],
        ),

        // Profile/Settings branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              name: 'profile',
              builder: (context, state) => const ProfileScreen(),
              routes: [
                GoRoute(
                  path: 'edit',
                  name: 'edit-profile',
                  builder: (context, state) => const EditProfileScreen(),
                ),
                GoRoute(
                  path: 'id-card',
                  name: 'digital-id-card',
                  builder: (context, state) => const DigitalIDCardScreen(),
                ),
                GoRoute(
                  path: 'security',
                  name: 'security-settings',
                  builder: (context, state) => const SecuritySettingsScreen(),
                ),
                GoRoute(
                  path: 'emergency-contacts',
                  name: 'emergency-contacts',
                  builder: (context, state) => const EmergencyContactsScreen(),
                ),
                GoRoute(
                  path: 'medical-info',
                  name: 'medical-info',
                  builder: (context, state) => const MedicalInfoScreen(),
                ),
                GoRoute(
                  path: 'location-sharing',
                  name: 'location-sharing',
                  builder: (context, state) => const LocationSharingScreen(),
                ),
                GoRoute(
                  path: 'safety-checkins',
                  name: 'safety-checkins',
                  builder: (context, state) => const SafetyCheckinsScreen(),
                ),
                GoRoute(
                  path: 'activity/history',
                  name: 'activity-history',
                  builder: (context, state) => ActivityHistoryScreen(
                    initialTab: state.uri.queryParameters['tab'] != null
                        ? int.parse(state.uri.queryParameters['tab']!)
                        : 0,
                  ),
                ),
                GoRoute(
                  path: 'preferences/language',
                  name: 'language-preferences',
                  builder: (context, state) =>
                      const LanguagePreferencesScreen(),
                ),
                GoRoute(
                  path: 'preferences/theme',
                  name: 'theme-preferences',
                  builder: (context, state) => const ThemePreferencesScreen(),
                ),
                GoRoute(
                  path: 'preferences/notifications',
                  name: 'notification-preferences',
                  builder: (context, state) =>
                      const NotificationPreferencesScreen(),
                ),
                GoRoute(
                  path: 'preferences/map',
                  name: 'map-preferences',
                  builder: (context, state) => const MapPreferencesScreen(),
                ),
                GoRoute(
                  path: 'preferences/accessibility',
                  name: 'accessibility-preferences',
                  builder: (context, state) =>
                      const AccessibilityPreferencesScreen(),
                ),
              ],
            ),
            GoRoute(
              path: AppRoutes.settings,
              name: 'settings',
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: AppRoutes.help,
              name: 'help',
              builder: (context, state) => const HelpScreen(),
            ),
          ],
        ),
      ],
    ),

    // Admin routes (separate shell)
    GoRoute(
      path: AppRoutes.adminDashboard,
      name: 'admin-dashboard',
      builder: (context, state) => const _AdminDashboardScreen(),
      routes: [
        GoRoute(
          path: 'users',
          name: 'admin-users',
          builder: (context, state) => const _AdminUsersScreen(),
        ),
        GoRoute(
          path: 'locations',
          name: 'admin-locations',
          builder: (context, state) => const _AdminLocationsScreen(),
        ),
        GoRoute(
          path: 'evacuation-graph',
          name: 'admin-evacuation-graph',
          builder: (context, state) => const _AdminEvacuationGraphScreen(),
        ),
        GoRoute(
          path: 'alerts',
          name: 'admin-alerts',
          builder: (context, state) => const _AdminAlertsScreen(),
        ),
        GoRoute(
          path: 'analytics',
          name: 'admin-analytics',
          builder: (context, state) => const _AdminAnalyticsScreen(),
        ),
        GoRoute(
          path: 'settings',
          name: 'admin-settings',
          builder: (context, state) => const _AdminSettingsScreen(),
        ),
      ],
    ),
  ];
}

// ===========================================================================
// Placeholder Screen Widgets (to be replaced in later phases)
// ===========================================================================

/// Splash screen that briefly shows branding and navigates to the begin screen.
class _SplashScreen extends ConsumerWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Navigate to the begin screen once the splash is shown
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.go(AppRoutes.begin);
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.map, size: 80, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'SAFENAV CAVITE',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Campus Navigation & Emergency Evacuation'),
            const SizedBox(height: 32),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

/// Main app shell with bottom navigation and connectivity banner
class _MainShell extends ConsumerWidget {
  const _MainShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentIndex = navigationShell.currentIndex;
    final connectivityStatus = ref.watch(currentConnectivityStatusProvider);
    final unreadAlertsCount = ref.watch(unreadAlertsCountStreamProvider);

    return Scaffold(
      body: Column(
        children: [
          // Connectivity status banner
          _ConnectivityBanner(status: connectivityStatus),
          // Main content
          Expanded(child: navigationShell),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
          border: Border(
            top: BorderSide(color: colorScheme.outlineVariant, width: 0.5),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _NavItem(
                  icon: Icons.map_outlined,
                  activeIcon: Icons.map,
                  label: 'Map',
                  isSelected: currentIndex == 0,
                  onTap: () => navigationShell.goBranch(0),
                ),
                _NavItem(
                  icon: Icons.navigation_outlined,
                  activeIcon: Icons.navigation,
                  label: 'Navigate',
                  isSelected: currentIndex == 1,
                  onTap: () => navigationShell.goBranch(1),
                ),
                _NavItem(
                  icon: Icons.emergency_outlined,
                  activeIcon: Icons.emergency,
                  label: 'Emergency',
                  isSelected: currentIndex == 2,
                  onTap: () => navigationShell.goBranch(2),
                  isEmergency: true,
                ),
                _NavItem(
                  icon: Icons.notifications_outlined,
                  activeIcon: Icons.notifications,
                  label: 'Alerts',
                  isSelected: currentIndex == 3,
                  onTap: () => navigationShell.goBranch(3),
                  badgeCount: unreadAlertsCount.when(
                    data: (count) => count > 0 ? count : null,
                    loading: () => null,
                    error: (_, __) => null,
                  ),
                ),
                _NavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: 'Profile',
                  isSelected: currentIndex == 4,
                  onTap: () => navigationShell.goBranch(4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Connectivity status banner shown when offline
class _ConnectivityBanner extends ConsumerWidget {
  const _ConnectivityBanner({required this.status});

  final ConnectivityStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (status.hasInternet) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;
    final isOffline = status.isOffline;

    return Semantics(
      label: isOffline
          ? 'No internet connection. Some features may be limited.'
          : 'Limited connectivity: ${status.displayName}',
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        color: isOffline
            ? colorScheme.errorContainer
            : colorScheme.tertiaryContainer,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(
              isOffline ? Icons.wifi_off : Icons.wifi_tethering,
              size: 18,
              color: isOffline
                  ? colorScheme.onErrorContainer
                  : colorScheme.onTertiaryContainer,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isOffline
                    ? 'You\'re offline. Some features may be limited.'
                    : 'Limited connectivity: ${status.displayName}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isOffline
                      ? colorScheme.onErrorContainer
                      : colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (isOffline)
              AppTextButton(
                onPressed: () {
                  // Trigger a connectivity check
                  ref
                      .read(currentConnectivityStatusProvider.notifier)
                      .refresh();
                },
                label: 'Retry',
                icon: Icons.refresh,
                iconPosition: IconPosition.leading,
                size: ButtonSize.small,
                foregroundColor: colorScheme.onErrorContainer,
                semanticLabel: 'Retry connection',
              ),
          ],
        ),
      ),
    );
  }
}

/// Custom navigation item for bottom navigation bar
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isEmergency = false,
    this.badgeCount,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isEmergency;
  final int? badgeCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final itemColor = isEmergency && isSelected
        ? colorScheme.error
        : isSelected
        ? colorScheme.primary
        : colorScheme.onSurfaceVariant;

    final backgroundColor = isEmergency && isSelected
        ? colorScheme.errorContainer
        : isSelected
        ? colorScheme.primaryContainer
        : Colors.transparent;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Icon(
                    isSelected ? activeIcon : icon,
                    key: ValueKey(isSelected),
                    color: itemColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: itemColor,
                  ),
                  child: Text(label),
                ),
              ],
            ),
            if (badgeCount != null && badgeCount! > 0)
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: colorScheme.error,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      badgeCount! > 99 ? '99+' : badgeCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _LocationDetailScreen extends StatelessWidget {
  const _LocationDetailScreen({required this.locationId});

  final String locationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location: $locationId')),
      body: Center(child: Text('Location Detail: $locationId - TODO')),
    );
  }
}

class _BuildingDetailScreen extends StatelessWidget {
  const _BuildingDetailScreen({required this.buildingId});

  final String buildingId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Building: $buildingId')),
      body: Center(child: Text('Building Detail: $buildingId - TODO')),
    );
  }
}

class _NavigationDetailScreen extends StatelessWidget {
  const _NavigationDetailScreen({required this.routeId});

  final String routeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route: $routeId')),
      body: Center(child: Text('Navigation Detail: $routeId - TODO')),
    );
  }
}

class _EvacuationDetailScreen extends StatelessWidget {
  const _EvacuationDetailScreen({required this.routeId});

  final String routeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Evacuation Route: $routeId')),
      body: Center(child: Text('Evacuation Detail: $routeId - TODO')),
    );
  }
}

class _AdminDashboardScreen extends StatelessWidget {
  const _AdminDashboardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: const Center(child: Text('Admin Dashboard - TODO')),
    );
  }
}

class _AdminUsersScreen extends StatelessWidget {
  const _AdminUsersScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Management')),
      body: const Center(child: Text('Admin Users - TODO')),
    );
  }
}

class _AdminLocationsScreen extends StatelessWidget {
  const _AdminLocationsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Management')),
      body: const Center(child: Text('Admin Locations - TODO')),
    );
  }
}

class _AdminEvacuationGraphScreen extends StatelessWidget {
  const _AdminEvacuationGraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Evacuation Graph')),
      body: const Center(child: Text('Admin Evacuation Graph - TODO')),
    );
  }
}

class _AdminAlertsScreen extends StatelessWidget {
  const _AdminAlertsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alert Management')),
      body: const Center(child: Text('Admin Alerts - TODO')),
    );
  }
}

class _AdminAnalyticsScreen extends StatelessWidget {
  const _AdminAnalyticsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: const Center(child: Text('Admin Analytics - TODO')),
    );
  }
}

class _AdminSettingsScreen extends StatelessWidget {
  const _AdminSettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Settings')),
      body: const Center(child: Text('Admin Settings - TODO')),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({required this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            const Text('Something went wrong'),
            if (error != null) ...[
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 16),
            AppFilledButton(
              onPressed: () => context.go(AppRoutes.home),
              label: 'Go Home',
              semanticLabel: 'Go to home screen',
            ),
          ],
        ),
      ),
    );
  }
}

