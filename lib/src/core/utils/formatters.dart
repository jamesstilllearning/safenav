/// SAFENAV CAVITE - Formatters
///
/// Reusable formatting functions for display, localization, and data presentation.
library;

import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

/// Formats a distance in meters to human-readable string
String formatDistance(double meters, {String locale = AppConstants.languageEnglish}) {
  if (meters < 1) return '0 m';
  if (meters < 1000) {
    return '${meters.round()} m';
  }
  final km = meters / 1000;
  if (km < 10) {
    return '${km.toStringAsFixed(1)} km';
  }
  return '${km.round()} km';
}

/// Formats a duration in seconds to human-readable string
String formatDuration(int seconds, {String locale = AppConstants.languageEnglish}) {
  if (seconds < 60) return '${seconds}s';
  final minutes = seconds ~/ 60;
  if (minutes < 60) return '${minutes}min';
  final hours = minutes ~/ 60;
  final remainingMinutes = minutes % 60;
  if (remainingMinutes == 0) return '${hours}h';
  return '${hours}h ${remainingMinutes}min';
}

/// Formats a coordinate to string with specified precision
String formatCoordinate(double coordinate, {int decimals = 6}) {
  return coordinate.toStringAsFixed(decimals);
}

/// Formats a DateTime to time string (e.g., "2:30 PM")
String formatTime(DateTime dateTime, {String locale = AppConstants.languageEnglish}) {
  return DateFormat.jm(locale).format(dateTime);
}

/// Formats a DateTime to date string (e.g., "Jan 15, 2024")
String formatDate(DateTime dateTime, {String locale = AppConstants.languageEnglish}) {
  return DateFormat.yMMMd(locale).format(dateTime);
}

/// Formats a DateTime to date and time string (e.g., "Jan 15, 2024 at 2:30 PM")
String formatDateTime(DateTime dateTime, {String locale = AppConstants.languageEnglish}) {
  return DateFormat.yMMMd(locale).add_jm().format(dateTime);
}

/// Formats a DateTime to relative time string (e.g., "5m ago", "2h ago", "3d ago")
String formatRelativeTime(DateTime dateTime, {String locale = AppConstants.languageEnglish}) {
  final now = DateTime.now();
  final difference = now.difference(dateTime).abs();

  if (difference.inSeconds < 60) {
    return 'Just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d ago';
  } else {
    return formatDate(dateTime, locale: locale);
  }
}

/// Formats a DateTime for emergency timestamp (e.g., "2024-01-15 14:30:25")
String formatEmergencyTimestamp(DateTime dateTime, {String locale = AppConstants.languageEnglish}) {
  return DateFormat('yyyy-MM-dd HH:mm:ss', locale).format(dateTime);
}

/// Formats a user's full name for display
String formatDisplayName(String firstName, String? lastName, {String? middleInitial}) {
  final parts = <String>[firstName.trim()];
  if (middleInitial != null && middleInitial.isNotEmpty) {
    parts.add('${middleInitial.trim()}.');
  }
  if (lastName != null && lastName.isNotEmpty) {
    parts.add(lastName.trim());
  }
  return parts.join(' ');
}

/// Formats a phone number for display (Philippines format)
String formatPhoneNumber(String phone) {
  final digits = phone.replaceAll(RegExp(r'\D'), '');
  if (digits.length == 11 && digits.startsWith('09')) {
    return '+63 ${digits.substring(1, 4)} ${digits.substring(4, 7)} ${digits.substring(7)}';
  }
  if (digits.length == 12 && digits.startsWith('639')) {
    return '+63 ${digits.substring(2, 5)} ${digits.substring(5, 8)} ${digits.substring(8)}';
  }
  return phone; // Return as-is if format not recognized
}

/// Formats an emergency type for display
String formatEmergencyType(String type) {
  switch (type.toLowerCase()) {
    case 'fire':
      return 'Fire Emergency';
    case 'earthquake':
      return 'Earthquake';
    case 'flood':
      return 'Flood';
    case 'security':
      return 'Security Incident';
    case 'medical':
      return 'Medical Emergency';
    default:
      return type.capitalize;
  }
}

/// Formats a user role for display
String formatUserRole(String role) {
  switch (role.toLowerCase()) {
    case 'student':
      return 'Student';
    case 'faculty':
      return 'Faculty';
    case 'admin':
      return 'Administrator';
    case 'security':
      return 'Security Personnel';
    default:
      return role.capitalize;
  }
}

/// Formats a location category for display
String formatLocationCategory(String category) {
  switch (category.toLowerCase()) {
    case 'building':
      return 'Building';
    case 'office':
      return 'Office';
    case 'facility':
      return 'Facility';
    case 'evacuation_zone':
      return 'Evacuation Zone';
    case 'guard_post':
      return 'Guard Post';
    case 'clinic':
      return 'Clinic';
    case 'library':
      return 'Library';
    case 'canteen':
      return 'Canteen';
    case 'entrance':
      return 'Entrance';
    case 'stairwell':
      return 'Stairwell';
    case 'elevator':
      return 'Elevator';
    default:
      return category.split('_').map((w) => w.capitalize).join(' ');
  }
}

/// Formats file size in bytes to human-readable string
String formatFileSize(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
  if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
}

/// Formats a number with thousand separators
String formatNumber(num number, {int? decimals, String locale = AppConstants.languageEnglish}) {
  final format = NumberFormat.decimalPattern(locale);
  if (decimals != null) {
    return NumberFormat('#,##0.${'0' * decimals}', locale).format(number);
  }
  return format.format(number);
}

/// Formats a percentage
String formatPercentage(double value, {int decimals = 1, String locale = AppConstants.languageEnglish}) {
  return NumberFormat.percentPattern(locale).format(value / 100);
}

/// Capitalizes first letter of string
extension StringCapitalization on String {
  String get capitalize => isEmpty ? this : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}