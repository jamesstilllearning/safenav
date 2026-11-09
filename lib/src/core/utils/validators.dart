/// SAFENAV CAVITE - Validators
///
/// Reusable validation functions for forms and user input.
library;

import '../constants/app_constants.dart';
import 'extensions.dart';

/// Validation result containing success or error message
class ValidationResult {
  const ValidationResult._(this.isValid, this.errorMessage);

  final bool isValid;
  final String? errorMessage;

  factory ValidationResult.valid() => const ValidationResult._(true, null);
  factory ValidationResult.invalid(String message) => ValidationResult._(false, message);

  bool get isInvalid => !isValid;
}

/// Email validator
ValidationResult validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('Email is required');
  }
  if (!value.trim().isValidEmail) {
    return ValidationResult.invalid('Enter a valid email address');
  }
  return ValidationResult.valid();
}

/// Password validator
ValidationResult validatePassword(String? value, {int minLength = 8}) {
  if (value == null || value.isEmpty) {
    return ValidationResult.invalid('Password is required');
  }
  if (value.length < minLength) {
    return ValidationResult.invalid('Password must be at least $minLength characters');
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return ValidationResult.invalid('Password must contain at least one uppercase letter');
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return ValidationResult.invalid('Password must contain at least one lowercase letter');
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return ValidationResult.invalid('Password must contain at least one number');
  }
  return ValidationResult.valid();
}

/// Confirm password validator
ValidationResult validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return ValidationResult.invalid('Please confirm your password');
  }
  if (value != password) {
    return ValidationResult.invalid('Passwords do not match');
  }
  return ValidationResult.valid();
}

/// Required field validator
ValidationResult validateRequired(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('$fieldName is required');
  }
  return ValidationResult.valid();
}

/// Phone number validator (Philippines format)
ValidationResult validatePhone(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('Phone number is required');
  }
  if (!value.trim().isValidPhone) {
    return ValidationResult.invalid('Enter a valid Philippine phone number (e.g., 09123456789)');
  }
  return ValidationResult.valid();
}

/// Name validator
ValidationResult validateName(String? value, {String fieldName = 'Name'}) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('$fieldName is required');
  }
  if (value.trim().length < 2) {
    return ValidationResult.invalid('$fieldName must be at least 2 characters');
  }
  if (!RegExp(r'^[a-zA-Z\s\-\.]+$').hasMatch(value.trim())) {
    return ValidationResult.invalid('$fieldName can only contain letters, spaces, hyphens, and periods');
  }
  return ValidationResult.valid();
}

/// Student ID validator (EARIST format)
ValidationResult validateStudentId(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('Student ID is required');
  }
  // EARIST student ID format: typically 8-10 digits
  if (!RegExp(r'^\d{8,10}$').hasMatch(value.trim())) {
    return ValidationResult.invalid('Enter a valid EARIST student ID (8-10 digits)');
  }
  return ValidationResult.valid();
}

/// Coordinate validator
ValidationResult validateCoordinate(String? value, {required bool isLatitude}) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('${isLatitude ? 'Latitude' : 'Longitude'} is required');
  }
  final parsed = double.tryParse(value.trim());
  if (parsed == null) {
    return ValidationResult.invalid('Enter a valid number');
  }
  if (isLatitude) {
    if (parsed < -90 || parsed > 90) {
      return ValidationResult.invalid('Latitude must be between -90 and 90');
    }
  } else {
    if (parsed < -180 || parsed > 180) {
      return ValidationResult.invalid('Longitude must be between -180 and 180');
    }
  }
  return ValidationResult.valid();
}

/// Building code validator
ValidationResult validateBuildingCode(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('Building code is required');
  }
  if (!RegExp(r'^[A-Z]{2,4}-\d+$').hasMatch(value.trim().toUpperCase())) {
    return ValidationResult.invalid('Building code format: BLDG-1, BLDG-A1, etc.');
  }
  return ValidationResult.valid();
}

/// Room number validator
ValidationResult validateRoomNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('Room number is required');
  }
  if (!RegExp(r'^[A-Z0-9\-\s]+$').hasMatch(value.trim().toUpperCase())) {
    return ValidationResult.invalid('Room number can only contain letters, numbers, hyphens, and spaces');
  }
  return ValidationResult.valid();
}

/// Emergency type validator
ValidationResult validateEmergencyType(String? value) {
  if (value == null || value.trim().isEmpty) {
    return ValidationResult.invalid('Emergency type is required');
  }
  if (!AppConstants.emergencyTypes.contains(value.trim().toLowerCase())) {
    return ValidationResult.invalid('Invalid emergency type');
  }
  return ValidationResult.valid();
}

/// Combines multiple validators - returns first error or valid
ValidationResult combineValidators(List<ValidationResult Function()> validators) {
  for (final validator in validators) {
    final result = validator();
    if (result.isInvalid) return result;
  }
  return ValidationResult.valid();
}

