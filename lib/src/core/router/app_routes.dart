/// SAFENAV CAVITE - App Routes
///
/// Centralized route names and path definitions for GoRouter.
library;

/// Route names for type-safe navigation
class AppRoutes {
  AppRoutes._();

  // ===========================================================================
  // Auth Routes
  // ===========================================================================

  /// Splash screen route
  static const String splash = '/';

  /// Login screen route
  static const String login = '/login';

  /// Register screen route
  static const String register = '/register';

  /// Forgot password route
  static const String forgotPassword = '/forgot-password';

  /// Email verification route
  static const String verifyEmail = '/verify-email';

  // ===========================================================================
  // Main App Routes (require authentication)
  // ===========================================================================

  /// Main navigation shell route
  static const String home = '/home';

  /// Campus map route
  static const String map = '/map';

  /// Navigation/routing route
  static const String navigation = '/navigation';

  /// Emergency/SOS route
  static const String emergency = '/emergency';

  /// Evacuation route
  static const String evacuation = '/evacuation';

  /// Alerts/notifications route
  static const String alerts = '/alerts';

  /// Profile route
  static const String profile = '/profile';

  /// Settings route
  static const String settings = '/settings';

  // ===========================================================================
  // Admin Routes (require admin role)
  // ===========================================================================

  /// Admin dashboard route
  static const String adminDashboard = '/admin';

  /// Admin user management route
  static const String adminUsers = '/admin/users';

  /// Admin locations management route
  static const String adminLocations = '/admin/locations';

  /// Admin evacuation graph route
  static const String adminEvacuationGraph = '/admin/evacuation-graph';

  /// Admin alerts management route
  static const String adminAlerts = '/admin/alerts';

  /// Admin analytics route
  static const String adminAnalytics = '/admin/analytics';

  /// Admin settings route
  static const String adminSettings = '/admin/settings';

  // ===========================================================================
  // Detail Routes (with parameters)
  // ===========================================================================

  /// Location detail route
  static const String locationDetail = '/location/:locationId';

  /// Building detail route
  static const String buildingDetail = '/building/:buildingId';

  /// Digital Twin 3D view route
  static const String digitalTwin = '/digital-twin/:buildingId';

  /// Alert detail route
  static const String alertDetail = '/alert/:alertId';

  /// Navigation detail route
  static const String navigationDetail = '/navigation/:routeId';

  /// Evacuation route detail
  static const String evacuationDetail = '/evacuation/:routeId';

  // ===========================================================================
  // Helper Methods
  // ===========================================================================

  /// Gets the location detail route with ID
  static String locationDetailRoute(String locationId) =>
      '/location/$locationId';

  /// Gets the building detail route with ID
  static String buildingDetailRoute(String buildingId) =>
      '/building/$buildingId';

  /// Gets the digital twin route with building ID
  static String digitalTwinRoute(String buildingId) =>
      '/digital-twin/$buildingId';

  /// Gets the alert detail route with ID
  static String alertDetailRoute(String alertId) =>
      '/alert/$alertId';

  /// Gets the navigation detail route with ID
  static String navigationDetailRoute(String routeId) =>
      '/navigation/$routeId';

  /// Gets the evacuation detail route with ID
  static String evacuationDetailRoute(String routeId) =>
      '/evacuation/$routeId';

  /// Checks if a route requires authentication
  static bool requiresAuth(String route) {
    final publicRoutes = [splash, login, register, forgotPassword, verifyEmail];
    return !publicRoutes.contains(route);
  }

  /// Checks if a route requires admin role
  static bool requiresAdmin(String route) {
    return route.startsWith('/admin');
  }

  /// Gets all public routes
  static List<String> get publicRoutes => [
    splash,
    login,
    register,
    forgotPassword,
    verifyEmail,
  ];
}

/// Route path parameters
class RouteParams {
  RouteParams._();

  static const String locationId = 'locationId';
  static const String buildingId = 'buildingId';
  static const String alertId = 'alertId';
  static const String routeId = 'routeId';
}