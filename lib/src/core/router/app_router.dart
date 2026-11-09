/// SAFENAV CAVITE - App Router
///
/// GoRouter configuration with authentication guards and route definitions.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import '../../features/auth/auth.dart';
import '../../features/map/presentation/screens/map_screen.dart';
import '../../features/navigation/presentation/screens/navigation_screen.dart';
import '../../shared/models/user.dart';
import '../services/auth_service.dart';
import '../constants/dev_config.dart';

/// Router configuration provider
final routerProvider = Provider<GoRouter>((ref) {
  debugPrint('[ROUTER] routerProvider: Creating router, watching authServiceProvider...');
  final authService = ref.watch(authServiceProvider);
  debugPrint('[ROUTER] routerProvider: authServiceProvider watched, creating GoRouter...');
  final router = _createRouter(authService);
  debugPrint('[ROUTER] routerProvider: GoRouter created');
  return router;
});

/// Creates the GoRouter instance with all routes and guards
GoRouter _createRouter(AuthService authService) {
  debugPrint('[ROUTER] _createRouter: Building GoRouter with initialLocation=${AppRoutes.splash}');
  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    // Redirect can be async - we await the mock user injection in dev mode
    redirect: (context, state) async {
      debugPrint('[ROUTER] redirect: Called for location=${state.matchedLocation}');
      return await _authRedirect(context, state, authService);
    },
    routes: _buildRoutes(),
    errorBuilder: (context, state) => _ErrorScreen(error: state.error),
  );
}

/// Authentication redirect logic
/// Returns `Future<String?>` to support async mock user injection in dev mode
Future<String?> _authRedirect(
  BuildContext context,
  GoRouterState state,
  AuthService authService,
) async {
  final isLoggedIn = authService.isLoggedIn;
  final isAdmin = authService.currentUser?.isAdmin == true;
  final location = state.matchedLocation;
  final currentUser = authService.currentUser;

  debugPrint('[ROUTER] _authRedirect: location=$location, isLoggedIn=$isLoggedIn, currentUser=$currentUser, isAdmin=$isAdmin');

  // ===========================================================================
  // DEVELOPMENT AUTHENTICATION BYPASS
  // ===========================================================================
  // This bypass is ONLY active in debug mode when DevConfig.enableAuthBypass is true.
  // It is COMPILED OUT in release builds (kReleaseMode check in DevConfig).
  // It creates a mock user with 'student' role by default for local testing.
  // Admin routes are still protected - admin role must be explicitly set in DevConfig.
  if (DevConfig.isAuthBypassActive) {
    debugPrint('[ROUTER] _authRedirect: DEVELOPMENT BYPASS ACTIVE - Creating mock user');

    // Inject mock user into AuthService for development testing
    await _injectMockUser(authService);

    // Allow public routes (login, register, etc.) - but redirect to home if accessed
    if (AppRoutes.publicRoutes.contains(location)) {
      debugPrint('[ROUTER] _authRedirect: Dev bypass - Public route accessed, redirecting to home');
      return AppRoutes.home;
    }

    // Check admin access - mock user role is determined by DevConfig.mockUserRole
    final mockIsAdmin = _getMockUserIsAdmin();
    if (AppRoutes.requiresAdmin(location) && !mockIsAdmin) {
      debugPrint('[ROUTER] _authRedirect: Dev bypass - Not admin, redirecting to home');
      return AppRoutes.home;
    }

    debugPrint('[ROUTER] _authRedirect: Dev bypass - Allowing access to protected route');
    return null;
  }

  // ===========================================================================
  // PRODUCTION AUTHENTICATION FLOW
  // ===========================================================================
  // Normal authentication flow when bypass is not active

  // Allow public routes
  if (AppRoutes.publicRoutes.contains(location)) {
    // If logged in and trying to access auth pages, redirect to home
    if (isLoggedIn && (location == AppRoutes.login || location == AppRoutes.register)) {
      debugPrint('[ROUTER] _authRedirect: Logged in user accessing auth page, redirecting to home');
      return AppRoutes.home;
    }
    debugPrint('[ROUTER] _authRedirect: Public route, allowing access');
    return null;
  }

  // Require authentication for protected routes
  if (!isLoggedIn) {
    debugPrint('[ROUTER] _authRedirect: Not logged in, redirecting to login');
    return AppRoutes.login;
  }

  // Require admin role for admin routes
  if (AppRoutes.requiresAdmin(location) && !isAdmin) {
    debugPrint('[ROUTER] _authRedirect: Not admin, redirecting to home');
    return AppRoutes.home;
  }

  debugPrint('[ROUTER] _authRedirect: Allowing access to protected route');
  return null;
}

/// Injects a mock user into AuthService for development testing
/// This is called when DevConfig.isAuthBypassActive is true
Future<void> _injectMockUser(AuthService authService) async {
  // Use the development-only method to set a mock user
  // This method is guarded by kReleaseMode and does nothing in release builds
  await authService.setMockUserForDev(
    id: DevConfig.mockUserId,
    email: DevConfig.mockUserEmail,
    firstName: DevConfig.mockUserFirstName,
    lastName: DevConfig.mockUserLastName,
    role: _getMockUserRole(),
    middleInitial: null,
    studentId: DevConfig.mockUserRole == 'student' ? DevConfig.mockStudentId : null,
    employeeId: (DevConfig.mockUserRole == 'faculty' || DevConfig.mockUserRole == 'security')
        ? DevConfig.mockEmployeeId
        : null,
    department: (DevConfig.mockUserRole == 'faculty' || DevConfig.mockUserRole == 'security')
        ? DevConfig.mockDepartment
        : null,
    phoneNumber: DevConfig.mockPhoneNumber,
  );
}

/// Parses the mock user role from DevConfig string
UserRole _getMockUserRole() {
  switch (DevConfig.mockUserRole) {
    case 'faculty':
      return UserRole.faculty;
    case 'security':
      return UserRole.security;
    case 'admin':
      return UserRole.admin;
    case 'student':
    default:
      return UserRole.student;
  }
}

/// Determines if the mock user has admin privileges based on DevConfig
bool _getMockUserIsAdmin() {
  return DevConfig.mockUserRole == 'admin';
}

/// Builds all application routes
List<RouteBase> _buildRoutes() {
  return [
    // Splash route
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const _SplashScreen(),
    ),

    // Auth routes
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      name: 'forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.verifyEmail,
      name: 'verify-email',
      builder: (context, state) => const VerifyEmailScreen(),
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
              builder: (context, state) => const _EmergencyScreen(),
              routes: [
                GoRoute(
                  path: 'evacuation',
                  name: 'evacuation',
                  builder: (context, state) => const _EvacuationScreen(),
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
              builder: (context, state) => const _AlertsScreen(),
              routes: [
                GoRoute(
                  path: ':alertId',
                  name: 'alert-detail',
                  builder: (context, state) => _AlertDetailScreen(
                    alertId: state.pathParameters['alertId']!,
                  ),
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
              builder: (context, state) => const _ProfileScreen(),
            ),
            GoRoute(
              path: AppRoutes.settings,
              name: 'settings',
              builder: (context, state) => const _SettingsScreen(),
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

/// Splash screen that checks authentication state and navigates accordingly
class _SplashScreen extends ConsumerWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch auth status to determine where to navigate
    final authStatus = ref.watch(authStatusProvider);

    // Navigate based on auth status once it's determined
    ref.listen<AuthStatus>(authStatusProvider, (previous, next) {
      if (next.isAuthenticated) {
        // User is authenticated, go to home
        context.go(AppRoutes.home);
      } else if (!next.isInitial && !next.isLoading) {
        // User is not authenticated and not in initial/loading state
        // This covers _Unauthenticated and _Error states
        context.go(AppRoutes.login);
      }
      // For isInitial and isLoading states - stay on splash
    });

    return Scaffold(
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
            const SizedBox(height: 16),
            Text(
              _getLoadingMessage(authStatus),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLoadingMessage(AuthStatus status) {
    if (status.isAuthenticated) {
      return 'Welcome back!';
    } else if (status.isError) {
      return 'Error: ${status.error?.message ?? 'Unknown error'}';
    } else if (status.isLoading) {
      return 'Processing...';
    } else {
      return 'Initializing...';
    }
  }
}

class _MainShell extends StatelessWidget {
  const _MainShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          NavigationDestination(
            icon: Icon(Icons.navigation),
            label: 'Navigate',
          ),
          NavigationDestination(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
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

class _EmergencyScreen extends StatelessWidget {
  const _EmergencyScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Emergency Screen - TODO')),
    );
  }
}

class _EvacuationScreen extends StatelessWidget {
  const _EvacuationScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evacuation Routes'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Evacuation Screen - TODO')),
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

class _AlertsScreen extends StatelessWidget {
  const _AlertsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts')),
      body: const Center(child: Text('Alerts Screen - TODO')),
    );
  }
}

class _AlertDetailScreen extends StatelessWidget {
  const _AlertDetailScreen({required this.alertId});

  final String alertId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert: $alertId')),
      body: Center(child: Text('Alert Detail: $alertId - TODO')),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Screen - TODO')),
    );
  }
}

class _SettingsScreen extends StatelessWidget {
  const _SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Screen - TODO')),
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
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}