/// SAFENAV CAVITE - Alert Model
///
/// Emergency alert data model for campus-wide notifications.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

/// Alert severity level
enum AlertSeverity {
  /// Informational
  @JsonValue('info')
  info,

  /// Warning - caution advised
  @JsonValue('warning')
  warning,

  /// Critical - immediate action required
  @JsonValue('critical')
  critical,

  /// Emergency - life safety threat
  @JsonValue('emergency')
  emergency;

  /// Display name
  String get displayName {
    switch (this) {
      case AlertSeverity.info:
        return 'Information';
      case AlertSeverity.warning:
        return 'Warning';
      case AlertSeverity.critical:
        return 'Critical';
      case AlertSeverity.emergency:
        return 'Emergency';
    }
  }

  /// Priority for sorting (higher = more urgent)
  int get priority {
    switch (this) {
      case AlertSeverity.info:
        return 1;
      case AlertSeverity.warning:
        return 2;
      case AlertSeverity.critical:
        return 3;
      case AlertSeverity.emergency:
        return 4;
    }
  }

  /// Whether this severity should trigger emergency notification
  bool get isEmergency => this == AlertSeverity.emergency;

  /// Whether this severity requires immediate user attention
  bool get requiresImmediateAttention => priority >= 3;
}

/// Alert type/category
enum AlertType {
  /// Fire emergency
  @JsonValue('fire')
  fire,

  /// Earthquake
  @JsonValue('earthquake')
  earthquake,

  /// Flood/water emergency
  @JsonValue('flood')
  flood,

  /// Security incident
  @JsonValue('security')
  security,

  /// Medical emergency
  @JsonValue('medical')
  medical,

  /// Weather alert
  @JsonValue('weather')
  weather,

  /// Infrastructure issue (power, water, etc.)
  @JsonValue('infrastructure')
  infrastructure,

  /// Suspicious activity
  @JsonValue('suspicious_activity')
  suspiciousActivity,

  /// Building evacuation
  @JsonValue('evacuation')
  evacuation,

  /// Lockdown
  @JsonValue('lockdown')
  lockdown,

  /// All clear / safe
  @JsonValue('all_clear')
  allClear,

  /// Test/drill
  @JsonValue('test')
  test,

  /// Other
  @JsonValue('other')
  other;

  /// Display name
  String get displayName {
    switch (this) {
      case AlertType.fire:
        return 'Fire Emergency';
      case AlertType.earthquake:
        return 'Earthquake';
      case AlertType.flood:
        return 'Flood';
      case AlertType.security:
        return 'Security Incident';
      case AlertType.medical:
        return 'Medical Emergency';
      case AlertType.weather:
        return 'Weather Alert';
      case AlertType.infrastructure:
        return 'Infrastructure Issue';
      case AlertType.suspiciousActivity:
        return 'Suspicious Activity';
      case AlertType.evacuation:
        return 'Evacuation';
      case AlertType.lockdown:
        return 'Lockdown';
      case AlertType.allClear:
        return 'All Clear';
      case AlertType.test:
        return 'Test/Drill';
      case AlertType.other:
        return 'Other';
    }
  }

  /// Default severity for this alert type
  AlertSeverity get defaultSeverity {
    switch (this) {
      case AlertType.fire:
      case AlertType.earthquake:
      case AlertType.security:
      case AlertType.lockdown:
      case AlertType.evacuation:
        return AlertSeverity.emergency;
      case AlertType.flood:
      case AlertType.medical:
      case AlertType.suspiciousActivity:
        return AlertSeverity.critical;
      case AlertType.weather:
      case AlertType.infrastructure:
        return AlertSeverity.warning;
      case AlertType.allClear:
        return AlertSeverity.info;
      case AlertType.test:
        return AlertSeverity.info;
      case AlertType.other:
        return AlertSeverity.warning;
    }
  }
}

/// Alert status
enum AlertStatus {
  /// Active alert
  @JsonValue('active')
  active,

  /// Acknowledged by user
  @JsonValue('acknowledged')
  acknowledged,

  /// Resolved/cleared
  @JsonValue('resolved')
  resolved,

  /// Expired
  @JsonValue('expired')
  expired;

  /// Display name
  String get displayName {
    switch (this) {
      case AlertStatus.active:
        return 'Active';
      case AlertStatus.acknowledged:
        return 'Acknowledged';
      case AlertStatus.resolved:
        return 'Resolved';
      case AlertStatus.expired:
        return 'Expired';
    }
  }

  /// Whether alert is still relevant
  bool get isActive => this == AlertStatus.active || this == AlertStatus.acknowledged;
}

/// Emergency alert model
@freezed
abstract class Alert with _$Alert {
  const factory Alert({
    /// Unique alert ID
    required String id,

    /// Alert title
    required String title,

    /// Alert message/description
    required String message,

    /// Alert type
    required AlertType type,

    /// Alert severity
    required AlertSeverity severity,

    /// Current status
    @Default(AlertStatus.active) AlertStatus status,

    /// Location ID where alert originated
    String? locationId,

    /// Location name
    String? locationName,

    /// Latitude of alert location
    double? latitude,

    /// Longitude of alert location
    double? longitude,

    /// Building affected
    String? buildingId,

    /// Floor affected
    int? floor,

    /// Affected area description
    String? affectedArea,

    /// User ID who created the alert
    String? createdBy,

    /// User role who created the alert
    String? createdByRole,

    /// Whether this is a system-generated alert
    @Default(false) bool isSystemGenerated,

    /// Whether this is a test/drill
    @Default(false) bool isTest,

    /// Instructions for users
    String? instructions,

    /// Evacuation route ID (if applicable)
    String? evacuationRouteId,

    /// Assembly point ID (if applicable)
    String? assemblyPointId,

    /// Shelter ID (if applicable)
    String? shelterId,

    /// Related alert IDs
    @Default([]) List<String> relatedAlertIds,

    /// Attachments (photos, documents)
    @Default([]) List<String> attachmentUrls,

    /// Tags for filtering
    @Default([]) List<String> tags,

    /// Target audience (roles)
    @Default([]) List<String> targetRoles,

    /// Target building IDs
    @Default([]) List<String> targetBuildingIds,

    /// Expires at
    DateTime? expiresAt,

    /// Acknowledged by user IDs
    @Default([]) List<String> acknowledgedBy,

    /// Resolved by user ID
    String? resolvedBy,

    /// Resolution notes
    String? resolutionNotes,

    /// Created at
    required DateTime createdAt,

    /// Updated at
    required DateTime updatedAt,

    /// Metadata
    @Default({}) Map<String, dynamic> metadata,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}

extension AlertExtensions on Alert {
  /// Checks if alert is currently active
  bool get isActive => status.isActive;

  /// Checks if alert has expired
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Checks if user has acknowledged this alert
  bool isAcknowledgedBy(String userId) => acknowledgedBy.contains(userId);

  /// Gets coordinates if available
  (double? lat, double? lng)? get coordinates {
    if (latitude != null && longitude != null) {
      return (latitude, longitude);
    }
    return null;
  }

  /// Creates a copy with acknowledged status
  Alert acknowledge(String userId) {
    final newAcknowledged = [...acknowledgedBy, userId];
    return copyWith(
      status: AlertStatus.acknowledged,
      acknowledgedBy: newAcknowledged,
      updatedAt: DateTime.now(),
    );
  }

  /// Creates a copy with resolved status
  Alert resolve(String userId, {String? notes}) {
    return copyWith(
      status: AlertStatus.resolved,
      resolvedBy: userId,
      resolutionNotes: notes,
      updatedAt: DateTime.now(),
    );
  }

  /// Creates a copy with expired status
  Alert expire() {
    return copyWith(
      status: AlertStatus.expired,
      updatedAt: DateTime.now(),
    );
  }

  /// Gets display severity color hint
  String get severityColor {
    switch (severity) {
      case AlertSeverity.info:
        return 'blue';
      case AlertSeverity.warning:
        return 'orange';
      case AlertSeverity.critical:
        return 'red';
      case AlertSeverity.emergency:
        return 'dark_red';
    }
  }
}