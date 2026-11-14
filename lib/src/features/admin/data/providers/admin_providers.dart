/// SAFENAV CAVITE - Admin Providers
///
/// Riverpod providers for admin dashboard state management.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/models/user.dart';
import '../../../../shared/models/alert.dart';
import '../../../../shared/models/evacuation_graph.dart';

/// Admin dashboard tab enumeration
enum AdminTab {
  analytics,
  alerts,
  evacuation,
  users,
  settings;

  String get displayName {
    switch (this) {
      case AdminTab.analytics:
        return 'Analytics';
      case AdminTab.alerts:
        return 'Alerts';
      case AdminTab.evacuation:
        return 'Evacuation';
      case AdminTab.users:
        return 'Users';
      case AdminTab.settings:
        return 'Settings';
    }
  }

  IconData get icon {
    switch (this) {
      case AdminTab.analytics:
        return Icons.analytics_outlined;
      case AdminTab.alerts:
        return Icons.warning_outlined;
      case AdminTab.evacuation:
        return Icons.route_outlined;
      case AdminTab.users:
        return Icons.people_outlined;
      case AdminTab.settings:
        return Icons.settings_outlined;
    }
  }
}

/// Admin dashboard state
@immutable
class AdminDashboardState {
  final AdminTab currentTab;
  final bool isLoading;
  final String? error;

  const AdminDashboardState({
    this.currentTab = AdminTab.analytics,
    this.isLoading = false,
    this.error,
  });

  AdminDashboardState copyWith({
    AdminTab? currentTab,
    bool? isLoading,
    String? error,
  }) {
    return AdminDashboardState(
      currentTab: currentTab ?? this.currentTab,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// Admin dashboard notifier
class AdminDashboardNotifier extends StateNotifier<AdminDashboardState> {
  AdminDashboardNotifier() : super(const AdminDashboardState());

  void setTab(AdminTab tab) {
    state = state.copyWith(currentTab: tab);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }
}

/// Admin dashboard notifier provider
final adminDashboardProvider = StateNotifierProvider<AdminDashboardNotifier, AdminDashboardState>(
  (ref) => AdminDashboardNotifier(),
);

/// Analytics data provider (mock data for now)
final adminAnalyticsProvider = FutureProvider<AdminAnalytics>((ref) async {
  // Simulate network delay
  await Future.delayed(const Duration(milliseconds: 500));

  return AdminAnalytics(
    totalUsers: 1250,
    activeUsers: 890,
    totalAlerts: 45,
    activeAlerts: 3,
    resolvedAlertsToday: 12,
    totalBuildings: 28,
    totalPathways: 156,
    evacuationGraphs: 5,
    averageResponseTimeMinutes: 4.2,
    userRoleDistribution: {
      UserRole.student: 950,
      UserRole.faculty: 180,
      UserRole.security: 15,
      UserRole.admin: 5,
    },
    alertsBySeverity: {
      AlertSeverity.info: 15,
      AlertSeverity.warning: 20,
      AlertSeverity.critical: 7,
      AlertSeverity.emergency: 3,
    },
    alertsByType: {
      AlertType.fire: 2,
      AlertType.security: 8,
      AlertType.medical: 5,
      AlertType.weather: 12,
      AlertType.infrastructure: 10,
      AlertType.test: 8,
    },
    recentActivity: [
      AdminActivity(
        id: '1',
        type: ActivityType.alertCreated,
        description: 'Fire Emergency alert created for Engineering Building',
        userId: 'admin_001',
        userName: 'Admin User',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
      AdminActivity(
        id: '2',
        type: ActivityType.userRegistered,
        description: 'New student registered: Juan Dela Cruz',
        userId: 'student_123',
        userName: 'Juan Dela Cruz',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      AdminActivity(
        id: '3',
        type: ActivityType.evacuationGraphUpdated,
        description: 'Evacuation graph updated for Main Campus',
        userId: 'security_001',
        userName: 'Security Officer',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      AdminActivity(
        id: '4',
        type: ActivityType.alertResolved,
        description: 'Weather alert resolved - Heavy Rainfall Warning',
        userId: 'admin_001',
        userName: 'Admin User',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      ),
    ],
  );
});

/// Analytics data model
@immutable
class AdminAnalytics {
  final int totalUsers;
  final int activeUsers;
  final int totalAlerts;
  final int activeAlerts;
  final int resolvedAlertsToday;
  final int totalBuildings;
  final int totalPathways;
  final int evacuationGraphs;
  final double averageResponseTimeMinutes;
  final Map<UserRole, int> userRoleDistribution;
  final Map<AlertSeverity, int> alertsBySeverity;
  final Map<AlertType, int> alertsByType;
  final List<AdminActivity> recentActivity;

  const AdminAnalytics({
    required this.totalUsers,
    required this.activeUsers,
    required this.totalAlerts,
    required this.activeAlerts,
    required this.resolvedAlertsToday,
    required this.totalBuildings,
    required this.totalPathways,
    required this.evacuationGraphs,
    required this.averageResponseTimeMinutes,
    required this.userRoleDistribution,
    required this.alertsBySeverity,
    required this.alertsByType,
    required this.recentActivity,
  });
}

/// Admin activity log entry
@immutable
class AdminActivity {
  final String id;
  final ActivityType type;
  final String description;
  final String userId;
  final String userName;
  final DateTime timestamp;

  const AdminActivity({
    required this.id,
    required this.type,
    required this.description,
    required this.userId,
    required this.userName,
    required this.timestamp,
  });
}

/// Activity type enumeration
enum ActivityType {
  alertCreated,
  alertResolved,
  alertAcknowledged,
  userRegistered,
  userRoleChanged,
  userDeactivated,
  evacuationGraphUpdated,
  evacuationNodeAdded,
  evacuationEdgeAdded,
  systemSettingsChanged;

  String get displayName {
    switch (this) {
      case ActivityType.alertCreated:
        return 'Alert Created';
      case ActivityType.alertResolved:
        return 'Alert Resolved';
      case ActivityType.alertAcknowledged:
        return 'Alert Acknowledged';
      case ActivityType.userRegistered:
        return 'User Registered';
      case ActivityType.userRoleChanged:
        return 'Role Changed';
      case ActivityType.userDeactivated:
        return 'User Deactivated';
      case ActivityType.evacuationGraphUpdated:
        return 'Evacuation Graph Updated';
      case ActivityType.evacuationNodeAdded:
        return 'Node Added';
      case ActivityType.evacuationEdgeAdded:
        return 'Edge Added';
      case ActivityType.systemSettingsChanged:
        return 'Settings Changed';
    }
  }

  IconData get icon {
    switch (this) {
      case ActivityType.alertCreated:
      case ActivityType.alertResolved:
      case ActivityType.alertAcknowledged:
        return Icons.warning;
      case ActivityType.userRegistered:
      case ActivityType.userRoleChanged:
      case ActivityType.userDeactivated:
        return Icons.person;
      case ActivityType.evacuationGraphUpdated:
      case ActivityType.evacuationNodeAdded:
      case ActivityType.evacuationEdgeAdded:
        return Icons.route;
      case ActivityType.systemSettingsChanged:
        return Icons.settings;
    }
  }

  Color get color {
    switch (this) {
      case ActivityType.alertCreated:
      case ActivityType.alertResolved:
      case ActivityType.alertAcknowledged:
        return Colors.red;
      case ActivityType.userRegistered:
      case ActivityType.userRoleChanged:
      case ActivityType.userDeactivated:
        return Colors.blue;
      case ActivityType.evacuationGraphUpdated:
      case ActivityType.evacuationNodeAdded:
      case ActivityType.evacuationEdgeAdded:
        return Colors.green;
      case ActivityType.systemSettingsChanged:
        return Colors.orange;
    }
  }
}

/// Alerts management provider
final adminAlertsProvider = FutureProvider<List<Alert>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  // Return mock alerts - in real app, fetch from backend
  return _generateMockAlerts();
});

/// Users management provider
final adminUsersProvider = FutureProvider<List<User>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return _generateMockUsers();
});

/// Evacuation graphs provider
final adminEvacuationGraphsProvider = FutureProvider<List<EvacuationGraph>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return _generateMockEvacuationGraphs();
});

/// System settings notifier
class AdminSettingsNotifier extends StateNotifier<AdminSettings> {
  AdminSettingsNotifier() : super(AdminSettings.defaultSettings());

  void updateSettings(AdminSettings settings) {
    state = settings;
  }
}

/// System settings provider
final adminSettingsProvider = StateNotifierProvider<AdminSettingsNotifier, AdminSettings>((ref) {
  return AdminSettingsNotifier();
});

/// Mock alerts generator
List<Alert> _generateMockAlerts() {
  final now = DateTime.now();
  return [
    Alert(
      id: 'ALERT-001',
      title: 'Fire Emergency - Engineering Building',
      message: 'Fire reported on 2nd floor, Room 204. Evacuate immediately.',
      type: AlertType.fire,
      severity: AlertSeverity.emergency,
      status: AlertStatus.active,
      locationName: 'Engineering Building',
      buildingId: 'ENG-001',
      floor: 2,
      affectedArea: 'Room 204, 2nd Floor',
      createdBy: 'security_001',
      createdByRole: 'security',
      instructions: 'Use nearest emergency exit. Do not use elevators. Proceed to Assembly Point A.',
      evacuationRouteId: 'EVAC-ENG-A',
      assemblyPointId: 'AP-A',
      targetRoles: ['student', 'faculty', 'security'],
      targetBuildingIds: ['ENG-001'],
      createdAt: now.subtract(const Duration(minutes: 45)),
      updatedAt: now.subtract(const Duration(minutes: 45)),
    ),
    Alert(
      id: 'ALERT-002',
      title: 'Heavy Rainfall Warning',
      message: 'Heavy rainfall expected until 6 PM. Possible flooding in low-lying areas.',
      type: AlertType.weather,
      severity: AlertSeverity.warning,
      status: AlertStatus.active,
      locationName: 'Campus Wide',
      createdBy: 'system',
      createdByRole: 'system',
      isSystemGenerated: true,
      instructions: 'Avoid flooded pathways. Use elevated routes. Monitor for updates.',
      targetRoles: ['student', 'faculty', 'security', 'admin'],
      expiresAt: now.add(const Duration(hours: 6)),
      createdAt: now.subtract(const Duration(hours: 2)),
      updatedAt: now.subtract(const Duration(hours: 2)),
    ),
    Alert(
      id: 'ALERT-003',
      title: 'Security Incident - Parking Lot B',
      message: 'Suspicious activity reported. Security investigating.',
      type: AlertType.security,
      severity: AlertSeverity.critical,
      status: AlertStatus.acknowledged,
      locationName: 'Parking Lot B',
      createdBy: 'security_002',
      createdByRole: 'security',
      instructions: 'Avoid Parking Lot B area. Follow security personnel directions.',
      targetRoles: ['security', 'admin'],
      acknowledgedBy: ['admin_001'],
      createdAt: now.subtract(const Duration(hours: 4)),
      updatedAt: now.subtract(const Duration(hours: 3)),
    ),
    Alert(
      id: 'ALERT-004',
      title: 'Medical Emergency - Library',
      message: 'Student experiencing medical emergency. First responders en route.',
      type: AlertType.medical,
      severity: AlertSeverity.critical,
      status: AlertStatus.resolved,
      locationName: 'Main Library',
      buildingId: 'LIB-001',
      floor: 1,
      affectedArea: 'Reading Area, 1st Floor',
      createdBy: 'faculty_045',
      createdByRole: 'faculty',
      instructions: 'Clear the area. First aid station at Library entrance.',
      assemblyPointId: 'AP-C',
      resolvedBy: 'security_001',
      resolutionNotes: 'Student transported to medical clinic. Condition stable.',
      createdAt: now.subtract(const Duration(hours: 8)),
      updatedAt: now.subtract(const Duration(hours: 7)),
    ),
    Alert(
      id: 'ALERT-005',
      title: 'Power Outage - Admin Building',
      message: 'Partial power outage affecting Admin Building. Generator activated.',
      type: AlertType.infrastructure,
      severity: AlertSeverity.warning,
      status: AlertStatus.active,
      locationName: 'Administration Building',
      buildingId: 'ADM-001',
      createdBy: 'system',
      createdByRole: 'system',
      isSystemGenerated: true,
      instructions: 'Emergency lighting active. Elevators may be affected.',
      targetRoles: ['student', 'faculty', 'security', 'admin'],
      targetBuildingIds: ['ADM-001'],
      createdAt: now.subtract(const Duration(hours: 12)),
      updatedAt: now.subtract(const Duration(hours: 12)),
    ),
  ];
}

/// Mock users generator
List<User> _generateMockUsers() {
  final now = DateTime.now();
  return [
    User(
      id: 'admin_001',
      email: 'admin@earist.edu.ph',
      firstName: 'Maria',
      lastName: 'Santos',
      role: UserRole.admin,
      employeeId: 'EMP-001',
      department: 'Administration',
      phoneNumber: '+63 912 345 6789',
      isActive: true,
      emailVerified: true,
      lastLoginAt: now.subtract(const Duration(hours: 2)),
      createdAt: now.subtract(const Duration(days: 365)),
      updatedAt: now.subtract(const Duration(hours: 2)),
    ),
    User(
      id: 'security_001',
      email: 'security.chief@earist.edu.ph',
      firstName: 'Roberto',
      lastName: 'Cruz',
      role: UserRole.security,
      employeeId: 'SEC-001',
      department: 'Campus Security',
      phoneNumber: '+63 917 888 1234',
      isActive: true,
      emailVerified: true,
      lastLoginAt: now.subtract(const Duration(minutes: 30)),
      createdAt: now.subtract(const Duration(days: 730)),
      updatedAt: now.subtract(const Duration(minutes: 30)),
    ),
    User(
      id: 'security_002',
      email: 'security.officer@earist.edu.ph',
      firstName: 'Juan',
      lastName: 'Reyes',
      role: UserRole.security,
      employeeId: 'SEC-002',
      department: 'Campus Security',
      phoneNumber: '+63 918 555 9876',
      isActive: true,
      emailVerified: true,
      lastLoginAt: now.subtract(const Duration(hours: 1)),
      createdAt: now.subtract(const Duration(days: 365)),
      updatedAt: now.subtract(const Duration(hours: 1)),
    ),
    User(
      id: 'faculty_045',
      email: 'prof.garcia@earist.edu.ph',
      firstName: 'Ana',
      lastName: 'Garcia',
      middleInitial: 'M',
      role: UserRole.faculty,
      employeeId: 'FAC-045',
      department: 'Computer Engineering',
      phoneNumber: '+63 919 777 3456',
      isActive: true,
      emailVerified: true,
      lastLoginAt: now.subtract(const Duration(days: 1)),
      createdAt: now.subtract(const Duration(days: 1095)),
      updatedAt: now.subtract(const Duration(days: 1)),
    ),
    User(
      id: 'student_123',
      email: 'juan.delacruz@earist.edu.ph',
      firstName: 'Juan',
      lastName: 'Dela Cruz',
      middleInitial: 'A',
      role: UserRole.student,
      studentId: '2023-12345',
      department: 'BS Computer Engineering',
      phoneNumber: '+63 920 123 4567',
      isActive: true,
      emailVerified: true,
      lastLoginAt: now.subtract(const Duration(hours: 3)),
      createdAt: now.subtract(const Duration(days: 180)),
      updatedAt: now.subtract(const Duration(hours: 3)),
    ),
    User(
      id: 'student_124',
      email: 'maria.rodriguez@earist.edu.ph',
      firstName: 'Maria',
      lastName: 'Rodriguez',
      role: UserRole.student,
      studentId: '2023-12346',
      department: 'BS Architecture',
      isActive: true,
      emailVerified: false,
      lastLoginAt: null,
      createdAt: now.subtract(const Duration(days: 30)),
      updatedAt: now.subtract(const Duration(days: 30)),
    ),
    User(
      id: 'faculty_046',
      email: 'prof.reyes@earist.edu.ph',
      firstName: 'Carlos',
      lastName: 'Reyes',
      role: UserRole.faculty,
      employeeId: 'FAC-046',
      department: 'Civil Engineering',
      isActive: false,
      emailVerified: true,
      lastLoginAt: now.subtract(const Duration(days: 60)),
      createdAt: now.subtract(const Duration(days: 1460)),
      updatedAt: now.subtract(const Duration(days: 60)),
    ),
  ];
}

/// Mock evacuation graphs generator
List<EvacuationGraph> _generateMockEvacuationGraphs() {
  final now = DateTime.now();
  return [
    EvacuationGraph(
      id: 'EVAC-MAIN',
      name: 'Main Campus',
      buildingId: null,
      version: 3,
      nodes: [
        EvacuationNode(
          id: 'N-MAIN-GATE',
          label: 'Main Gate',
          type: EvacuationNodeType.entrance,
          latitude: 14.3003421,
          longitude: 121.0090085,
          isExit: true,
          isAssemblyPoint: true,
          capacity: 500,
        ),
        EvacuationNode(
          id: 'N-ENG-BLDG',
          label: 'Engineering Building Exit',
          type: EvacuationNodeType.entrance,
          latitude: 14.3005000,
          longitude: 121.0092000,
          buildingId: 'ENG-001',
          isExit: true,
          isAssemblyPoint: false,
        ),
        EvacuationNode(
          id: 'N-ADM-BLDG',
          label: 'Admin Building Exit',
          type: EvacuationNodeType.entrance,
          latitude: 14.3002000,
          longitude: 121.0088000,
          buildingId: 'ADM-001',
          isExit: true,
          isAssemblyPoint: false,
        ),
        EvacuationNode(
          id: 'N-LIB-BLDG',
          label: 'Library Exit',
          type: EvacuationNodeType.entrance,
          latitude: 14.3006000,
          longitude: 121.0091000,
          buildingId: 'LIB-001',
          isExit: true,
          isAssemblyPoint: false,
        ),
        EvacuationNode(
          id: 'N-AP-A',
          label: 'Assembly Point A (Front Field)',
          type: EvacuationNodeType.assemblyPoint,
          latitude: 14.3001000,
          longitude: 121.0085000,
          isAssemblyPoint: true,
          capacity: 1000,
        ),
        EvacuationNode(
          id: 'N-AP-B',
          label: 'Assembly Point B (Back Field)',
          type: EvacuationNodeType.assemblyPoint,
          latitude: 14.3008000,
          longitude: 121.0095000,
          isAssemblyPoint: true,
          capacity: 800,
        ),
      ],
      edges: [
        EvacuationEdge(
          id: 'E-ENG-APA',
          fromNodeId: 'N-ENG-BLDG',
          toNodeId: 'N-AP-A',
          distance: 150.0,
          estimatedTimeSeconds: 180,
          isEmergencyRoute: true,
          description: 'Direct path to Assembly Point A via main walkway',
        ),
        EvacuationEdge(
          id: 'E-ADM-APA',
          fromNodeId: 'N-ADM-BLDG',
          toNodeId: 'N-AP-A',
          distance: 80.0,
          estimatedTimeSeconds: 100,
          isEmergencyRoute: true,
          description: 'Short path to Assembly Point A',
        ),
        EvacuationEdge(
          id: 'E-LIB-APB',
          fromNodeId: 'N-LIB-BLDG',
          toNodeId: 'N-AP-B',
          distance: 120.0,
          estimatedTimeSeconds: 150,
          isEmergencyRoute: true,
          description: 'Path to Assembly Point B via rear walkway',
        ),
        EvacuationEdge(
          id: 'E-ENG-MAIN',
          fromNodeId: 'N-ENG-BLDG',
          toNodeId: 'N-MAIN-GATE',
          distance: 200.0,
          estimatedTimeSeconds: 240,
          isEmergencyRoute: true,
          description: 'Emergency exit to Main Gate',
        ),
      ],
      defaultAssemblyPointIds: ['N-AP-A', 'N-AP-B'],
      defaultShelterIds: [],
      bounds: [14.3001000, 121.0085000, 14.3008000, 121.0095000],
      createdAt: now.subtract(const Duration(days: 30)),
      updatedAt: now.subtract(const Duration(days: 5)),
    ),
    EvacuationGraph(
      id: 'EVAC-ENG',
      name: 'Engineering Building',
      buildingId: 'ENG-001',
      version: 2,
      nodes: [
        EvacuationNode(
          id: 'N-ENG-1F-EXIT',
          label: '1st Floor Exit',
          type: EvacuationNodeType.entrance,
          latitude: 14.3005000,
          longitude: 121.0092000,
          buildingId: 'ENG-001',
          floor: 1,
          isExit: true,
        ),
        EvacuationNode(
          id: 'N-ENG-2F-EXIT',
          label: '2nd Floor Exit',
          type: EvacuationNodeType.entrance,
          latitude: 14.3005000,
          longitude: 121.0092000,
          buildingId: 'ENG-001',
          floor: 2,
          isExit: true,
        ),
        EvacuationNode(
          id: 'N-ENG-STAIR',
          label: 'Central Stairwell',
          type: EvacuationNodeType.stairwell,
          latitude: 14.3005100,
          longitude: 121.0092100,
          buildingId: 'ENG-001',
        ),
        EvacuationNode(
          id: 'N-ENG-AP',
          label: 'Assembly Point A',
          type: EvacuationNodeType.assemblyPoint,
          latitude: 14.3001000,
          longitude: 121.0085000,
          isAssemblyPoint: true,
          capacity: 1000,
        ),
      ],
      edges: [
        EvacuationEdge(
          id: 'E-ENG-2F-STAIR',
          fromNodeId: 'N-ENG-2F-EXIT',
          toNodeId: 'N-ENG-STAIR',
          distance: 15.0,
          estimatedTimeSeconds: 30,
          isEmergencyRoute: true,
          floor: 2,
        ),
        EvacuationEdge(
          id: 'E-ENG-STAIR-1F',
          fromNodeId: 'N-ENG-STAIR',
          toNodeId: 'N-ENG-1F-EXIT',
          distance: 15.0,
          estimatedTimeSeconds: 30,
          isEmergencyRoute: true,
          floor: 1,
        ),
        EvacuationEdge(
          id: 'E-ENG-1F-AP',
          fromNodeId: 'N-ENG-1F-EXIT',
          toNodeId: 'N-ENG-AP',
          distance: 150.0,
          estimatedTimeSeconds: 180,
          isEmergencyRoute: true,
        ),
      ],
      defaultAssemblyPointIds: ['N-ENG-AP'],
      defaultShelterIds: [],
      bounds: [14.3001000, 121.0085000, 14.3005100, 121.0092100],
      createdAt: now.subtract(const Duration(days: 15)),
      updatedAt: now.subtract(const Duration(days: 3)),
    ),
  ];
}

/// System settings model
@immutable
class AdminSettings {
  final bool pushNotificationsEnabled;
  final bool emailNotificationsEnabled;
  final bool smsNotificationsEnabled;
  final bool autoExpireAlerts;
  final int alertExpiryHours;
  final bool requireAlertAcknowledgment;
  final bool allowTestAlerts;
  final bool mapOfflineModeEnabled;
  final int mapCacheMaxSizeMB;
  final bool autoUpdateEvacuationGraphs;
  final int emergencyContactRefreshDays;
  final bool maintenanceMode;
  final String maintenanceMessage;

  const AdminSettings({
    required this.pushNotificationsEnabled,
    required this.emailNotificationsEnabled,
    required this.smsNotificationsEnabled,
    required this.autoExpireAlerts,
    required this.alertExpiryHours,
    required this.requireAlertAcknowledgment,
    required this.allowTestAlerts,
    required this.mapOfflineModeEnabled,
    required this.mapCacheMaxSizeMB,
    required this.autoUpdateEvacuationGraphs,
    required this.emergencyContactRefreshDays,
    required this.maintenanceMode,
    required this.maintenanceMessage,
  });

  factory AdminSettings.defaultSettings() {
    return const AdminSettings(
      pushNotificationsEnabled: true,
      emailNotificationsEnabled: true,
      smsNotificationsEnabled: false,
      autoExpireAlerts: true,
      alertExpiryHours: 24,
      requireAlertAcknowledgment: true,
      allowTestAlerts: false,
      mapOfflineModeEnabled: true,
      mapCacheMaxSizeMB: 500,
      autoUpdateEvacuationGraphs: true,
      emergencyContactRefreshDays: 90,
      maintenanceMode: false,
      maintenanceMessage: 'System maintenance in progress. Some features may be unavailable.',
    );
  }

  AdminSettings copyWith({
    bool? pushNotificationsEnabled,
    bool? emailNotificationsEnabled,
    bool? smsNotificationsEnabled,
    bool? autoExpireAlerts,
    int? alertExpiryHours,
    bool? requireAlertAcknowledgment,
    bool? allowTestAlerts,
    bool? mapOfflineModeEnabled,
    int? mapCacheMaxSizeMB,
    bool? autoUpdateEvacuationGraphs,
    int? emergencyContactRefreshDays,
    bool? maintenanceMode,
    String? maintenanceMessage,
  }) {
    return AdminSettings(
      pushNotificationsEnabled: pushNotificationsEnabled ?? this.pushNotificationsEnabled,
      emailNotificationsEnabled: emailNotificationsEnabled ?? this.emailNotificationsEnabled,
      smsNotificationsEnabled: smsNotificationsEnabled ?? this.smsNotificationsEnabled,
      autoExpireAlerts: autoExpireAlerts ?? this.autoExpireAlerts,
      alertExpiryHours: alertExpiryHours ?? this.alertExpiryHours,
      requireAlertAcknowledgment: requireAlertAcknowledgment ?? this.requireAlertAcknowledgment,
      allowTestAlerts: allowTestAlerts ?? this.allowTestAlerts,
      mapOfflineModeEnabled: mapOfflineModeEnabled ?? this.mapOfflineModeEnabled,
      mapCacheMaxSizeMB: mapCacheMaxSizeMB ?? this.mapCacheMaxSizeMB,
      autoUpdateEvacuationGraphs: autoUpdateEvacuationGraphs ?? this.autoUpdateEvacuationGraphs,
      emergencyContactRefreshDays: emergencyContactRefreshDays ?? this.emergencyContactRefreshDays,
      maintenanceMode: maintenanceMode ?? this.maintenanceMode,
      maintenanceMessage: maintenanceMessage ?? this.maintenanceMessage,
    );
  }
}