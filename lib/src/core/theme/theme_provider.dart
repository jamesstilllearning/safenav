// Copyright 2025 SAFENAV CAVITE
// Theme provider with persistence support for Light, Dark, System, and Emergency modes
// Uses manual StateNotifierProvider (no codegen required)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Supported theme modes in the app
enum AppThemeMode {
  system,
  light,
  dark,
  emergency,
}

/// Extension to convert AppThemeMode to Flutter's ThemeMode
extension AppThemeModeExtension on AppThemeMode {
  ThemeMode get toThemeMode {
    return switch (this) {
      AppThemeMode.system => ThemeMode.system,
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
      AppThemeMode.emergency => ThemeMode.dark, // Emergency uses dark as base
    };
  }

  String get displayName {
    return switch (this) {
      AppThemeMode.system => 'System',
      AppThemeMode.light => 'Light',
      AppThemeMode.dark => 'Dark',
      AppThemeMode.emergency => 'Emergency',
    };
  }
}

/// Parse theme mode from string
AppThemeMode _themeModeFromString(String value) {
  return AppThemeMode.values.firstWhere(
    (e) => e.name == value,
    orElse: () => AppThemeMode.system,
  );
}

/// State for the theme controller
@immutable
class ThemeState {
  final AppThemeMode themeMode;
  final bool isEmergencyActive;

  const ThemeState({
    required this.themeMode,
    required this.isEmergencyActive,
  });

  ThemeState copyWith({
    AppThemeMode? themeMode,
    bool? isEmergencyActive,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isEmergencyActive: isEmergencyActive ?? this.isEmergencyActive,
    );
  }

  ThemeMode get effectiveThemeMode {
    if (isEmergencyActive) {
      return ThemeMode.dark; // Emergency theme is dark-based
    }
    return themeMode.toThemeMode;
  }
}

/// StateNotifier for theme management with persistence
class ThemeController extends StateNotifier<ThemeState> {
  static const String _prefsKey = 'app_theme_mode';
  static const String _emergencyKey = 'app_emergency_active';

  ThemeController() : super(const ThemeState(
    themeMode: AppThemeMode.system,
    isEmergencyActive: false,
  ));

  /// Load theme preference from SharedPreferences
  Future<void> loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeString = prefs.getString(_prefsKey) ?? AppThemeMode.system.name;
      final isEmergencyActive = prefs.getBool(_emergencyKey) ?? false;

      final themeMode = _themeModeFromString(themeModeString);

      state = ThemeState(
        themeMode: themeMode,
        isEmergencyActive: isEmergencyActive,
      );
    } catch (e) {
      debugPrint('Failed to load theme: $e');
      // Keep defaults
    }
  }

  /// Set the theme mode and persist it
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    state = state.copyWith(themeMode: themeMode);

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, themeMode.name);
    } catch (e) {
      debugPrint('Failed to save theme mode: $e');
    }
  }

  /// Toggle emergency mode
  Future<void> setEmergencyMode(bool enabled) async {
    state = state.copyWith(isEmergencyActive: enabled);

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_emergencyKey, enabled);
    } catch (e) {
      debugPrint('Failed to save emergency mode: $e');
    }
  }

  /// Toggle between light and dark (non-system)
  Future<void> toggleLightDark() async {
    AppThemeMode newMode;
    if (state.themeMode == AppThemeMode.light) {
      newMode = AppThemeMode.dark;
    } else if (state.themeMode == AppThemeMode.dark) {
      newMode = AppThemeMode.light;
    } else {
      // If system, default to light
      newMode = AppThemeMode.light;
    }
    await setThemeMode(newMode);
  }
}

/// Provider for the theme controller
final themeControllerProvider = StateNotifierProvider<ThemeController, ThemeState>((ref) {
  return ThemeController();
});

/// Provider for the current theme mode (for UI consumption)
final currentThemeModeProvider = Provider<AppThemeMode>((ref) {
  return ref.watch(themeControllerProvider).themeMode;
});

/// Provider for emergency mode status
final isEmergencyModeProvider = Provider<bool>((ref) {
  return ref.watch(themeControllerProvider).isEmergencyActive;
});

/// Provider for effective ThemeMode (for MaterialApp)
final effectiveThemeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(themeControllerProvider).effectiveThemeMode;
});