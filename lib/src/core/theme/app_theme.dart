// coverage:ignore-file
/// SAFENAV CAVITE - Application Theme
///
/// Design system implementing a professional, accessible, and emergency-aware
/// visual language. Supports both light and dark modes with high-contrast
/// emergency mode for critical situations.
library;

import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:google_fonts/google_fonts.dart';

/// Semantic color palette for SAFENAV CAVITE
///
/// Colors are designed to work in both light/dark modes and provide
/// clear visual hierarchy for normal and emergency states.
abstract class AppColors {
  // Private constructor
  AppColors._();

  // ===========================================================================
  // Brand Colors
  // ===========================================================================
  static const Color primary = Color(0xFF1B5E20); // Dark green - safety, trust
  static const Color primaryLight = Color(0xFF2E7D32);
  static const Color primaryDark = Color(0xFF0D4715);
  static const Color primaryContainer = Color(0xFFC8E6C9);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF002104);

  static const Color secondary = Color(
    0xFF0D47A1,
  ); // Deep blue - authority, tech
  static const Color secondaryLight = Color(0xFF1565C0);
  static const Color secondaryDark = Color(0xFF002171);
  static const Color secondaryContainer = Color(0xFFBBDEFB);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF00001B);

  static const Color tertiary = Color(0xFFE65100); // Amber - warning, attention
  static const Color tertiaryLight = Color(0xFFF57F17);
  static const Color tertiaryDark = Color(0xFFBF360C);
  static const Color tertiaryContainer = Color(0xFFFFE082);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color onTertiaryContainer = Color(0xFF2D1600);

  // ===========================================================================
  // Emergency Colors (High visibility for critical states)
  // ===========================================================================
  static const Color emergency = Color(
    0xFFB71C1C,
  ); // Deep red - danger, evacuate
  static const Color emergencyLight = Color(0xFFC62828);
  static const Color emergencyDark = Color(0xFF8B0000);
  static const Color emergencyContainer = Color(0xFFFFCDD2);
  static const Color onEmergency = Color(0xFFFFFFFF);
  static const Color onEmergencyContainer = Color(0xFF3E0000);

  static const Color emergencyBackground = Color(
    0xFFB71C1C,
  ); // Full-screen emergency mode
  static const Color emergencyText = Color(0xFFFFFFFF);
  static const Color emergencyAccent = Color(
    0xFFFFEB3B,
  ); // Yellow for critical highlights

  // ===========================================================================
  // Status Colors
  // ===========================================================================
  static const Color success = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFF4CAF50);
  static const Color successContainer = Color(0xFFC8E6C9);
  static const Color onSuccess = Color(0xFFFFFFFF);

  static const Color warning = Color(0xFFF57F17);
  static const Color warningLight = Color(0xFFFFB300);
  static const Color warningContainer = Color(0xFFFFF8E1);
  static const Color onWarning = Color(0xFF3E2723);

  static const Color info = Color(0xFF0277BD);
  static const Color infoLight = Color(0xFF03A9F4);
  static const Color infoContainer = Color(0xFFE1F5FE);
  static const Color onInfo = Color(0xFFFFFFFF);

  // ===========================================================================
  // Neutral Colors (Light Mode)
  // ===========================================================================
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF5F5F5);
  static const Color surfaceContainerLight = Color(0xFFE8E8E8);
  static const Color surfaceContainerHighLight = Color(0xFFE0E0E0);
  static const Color surfaceContainerHighestLight = Color(0xFFD6D6D6);

  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color onBackgroundLight = Color(0xFF1C1B1F);
  static const Color onSurfaceLight = Color(0xFF1C1B1F);
  static const Color onSurfaceVariantLight = Color(0xFF49454F);
  static const Color outlineLight = Color(0xFF79747E);
  static const Color outlineVariantLight = Color(0xFFCAC4D0);

  // ===========================================================================
  // Neutral Colors (Dark Mode)
  // ===========================================================================
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color surfaceVariantDark = Color(0xFF2C2C2C);
  static const Color surfaceContainerDark = Color(0xFF333333);
  static const Color surfaceContainerHighDark = Color(0xFF404040);
  static const Color surfaceContainerHighestDark = Color(0xFF4D4D4D);

  static const Color backgroundDark = Color(0xFF121212);
  static const Color onBackgroundDark = Color(0xFFE6E1E5);
  static const Color onSurfaceDark = Color(0xFFE6E1E5);
  static const Color onSurfaceVariantDark = Color(0xFFCAC4D0);
  static const Color outlineDark = Color(0xFF938F99);
  static const Color outlineVariantDark = Color(0xFF49454F);

  // ===========================================================================
  // Emergency Mode Colors (Override)
  // ===========================================================================
  static const Color emergencySurface = Color(0xFF3E0000);
  static const Color emergencySurfaceVariant = Color(0xFF5D1A1A);
  static const Color emergencyOnSurface = Color(0xFFFFFFFF);
  static const Color emergencyOutline = Color(0xFFFFCDD2);

  // ===========================================================================
  // Shadow & Elevation
  // ===========================================================================
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // ===========================================================================
  // Map-specific Colors
  // ===========================================================================
  static const Color mapBuildingDefault = Color(0xFF4CAF50);
  static const Color mapBuildingHighlighted = Color(0xFF2E7D32);
  static const Color mapEvacuationRoute = Color(0xFFB71C1C);
  static const Color mapSafeZone = Color(0xFF0D47A1);
  static const Color mapUserLocation = Color(0xFF1565C0);
  static const Color mapUserLocationPulse = Color(0x801565C0);
}

/// Text styles using Google Fonts (Inter for UI, Roboto Mono for data)
abstract class AppTextStyles {
  AppTextStyles._();

  // Base font families
  static const String fontFamilyUI = 'Inter';
  static const String fontFamilyMono = 'RobotoMono';

  // ===========================================================================
  // Display Styles (Large headlines)
  // ===========================================================================
  static TextStyle displayLarge(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle displayMedium(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle displaySmall(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
    color: Theme.of(context).colorScheme.onSurface,
  );

  // ===========================================================================
  // Headline Styles
  // ===========================================================================
  static TextStyle headlineLarge(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.25,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle headlineMedium(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.29,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle headlineSmall(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.33,
    color: Theme.of(context).colorScheme.onSurface,
  );

  // ===========================================================================
  // Title Styles
  // ===========================================================================
  static TextStyle titleLarge(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.27,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle titleMedium(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.50,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle titleSmall(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: Theme.of(context).colorScheme.onSurface,
  );

  // ===========================================================================
  // Body Styles
  // ===========================================================================
  static TextStyle bodyLarge(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.50,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle bodyMedium(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle bodySmall(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );

  // ===========================================================================
  // Label Styles
  // ===========================================================================
  static TextStyle labelLarge(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle labelMedium(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.33,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle labelSmall(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );

  // ===========================================================================
  // Special Styles
  // ===========================================================================
  static TextStyle monoLarge(BuildContext context) => AppTextStyleBuilder.monoTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle monoMedium(BuildContext context) => AppTextStyleBuilder.monoTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.43,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle monoSmall(BuildContext context) => AppTextStyleBuilder.monoTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.33,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );

  // Emergency mode - high visibility
  static TextStyle emergencyLarge(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
    color: AppColors.emergencyText,
  );

  static TextStyle emergencyMedium(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
    color: AppColors.emergencyText,
  );

  static TextStyle emergencySmall(BuildContext context) => AppTextStyleBuilder.interTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.4,
    color: AppColors.emergencyText,
  );
}

/// Spacing and sizing constants
abstract class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // Border radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Component sizing
  static const double buttonHeight = 48.0;
  static const double buttonHeightLarge = 56.0;
  static const double inputHeight = 56.0;
  static const double iconSizeSm = 16.0;
  static const double iconSizeMd = 24.0;
  static const double iconSizeLg = 32.0;
  static const double iconSizeXl = 48.0;

  // SOS Button - extra large for emergency access
  static const double sosButtonSize = 88.0;
  static const double sosButtonSizeSmall = 72.0;
}

/// Elevation and shadow constants
abstract class AppElevation {
  AppElevation._();

  static const double level0 = 0;
  static const double level1 = 1;
  static const double level2 = 3;
  static const double level3 = 6;
  static const double level4 = 8;
  static const double level5 = 12;

  // Emergency mode - higher elevation for critical elements
  static const double emergency = 16;
}

/// Animation durations
abstract class AppDurations {
  AppDurations._();

  static const Duration instant = Duration(milliseconds: 0);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 350);
  static const Duration slower = Duration(milliseconds: 500);
  static const Duration emergency = Duration(
    milliseconds: 100,
  ); // Faster for emergency
}

/// Shared text-style builders used by both [AppTextStyles] and
/// [AppTheme._buildTextTheme] so typography is defined in one place.
abstract class AppTextStyleBuilder {
  AppTextStyleBuilder._();

  static TextStyle interTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    double letterSpacing = 0,
    double height = 1.0,
    required Color color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      color: color,
    );
  }

  static TextStyle monoTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    double letterSpacing = 0,
    double height = 1.0,
    required Color color,
  }) {
    return GoogleFonts.robotoMono(
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      color: color,
    );
  }
}

/// Light Color Scheme
const ColorScheme _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: AppColors.onPrimary,
  primaryContainer: AppColors.primaryContainer,
  onPrimaryContainer: AppColors.onPrimaryContainer,
  secondary: AppColors.secondary,
  onSecondary: AppColors.onSecondary,
  secondaryContainer: AppColors.secondaryContainer,
  onSecondaryContainer: AppColors.onSecondaryContainer,
  tertiary: AppColors.tertiary,
  onTertiary: AppColors.onTertiary,
  tertiaryContainer: AppColors.tertiaryContainer,
  onTertiaryContainer: AppColors.onTertiaryContainer,
  error: AppColors.emergency,
  onError: AppColors.onEmergency,
  errorContainer: AppColors.emergencyContainer,
  onErrorContainer: AppColors.onEmergencyContainer,
  surface: AppColors.surfaceLight,
  onSurface: AppColors.onSurfaceLight,
  surfaceContainerHighest: AppColors.surfaceContainerHighestLight,
  surfaceContainerHigh: AppColors.surfaceContainerHighLight,
  surfaceContainer: AppColors.surfaceContainerLight,
  surfaceContainerLow: AppColors.surfaceVariantLight,
  surfaceContainerLowest: AppColors.surfaceLight,
  onSurfaceVariant: AppColors.onSurfaceVariantLight,
  outline: AppColors.outlineLight,
  outlineVariant: AppColors.outlineVariantLight,
  shadow: AppColors.shadowLight,
  scrim: AppColors.shadowLight,
  inverseSurface: AppColors.surfaceDark,
  onInverseSurface: AppColors.onSurfaceDark,
  inversePrimary: AppColors.primaryContainer,
);

/// Dark Color Scheme
const ColorScheme _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.primaryLight,
  onPrimary: AppColors.onPrimary,
  primaryContainer: AppColors.primaryDark,
  onPrimaryContainer: AppColors.onPrimaryContainer,
  secondary: AppColors.secondaryLight,
  onSecondary: AppColors.onSecondary,
  secondaryContainer: AppColors.secondaryDark,
  onSecondaryContainer: AppColors.onSecondaryContainer,
  tertiary: AppColors.tertiaryLight,
  onTertiary: AppColors.onTertiary,
  tertiaryContainer: AppColors.tertiaryDark,
  onTertiaryContainer: AppColors.onTertiaryContainer,
  error: AppColors.emergencyLight,
  onError: AppColors.onEmergency,
  errorContainer: AppColors.emergencyDark,
  onErrorContainer: AppColors.onEmergencyContainer,
  surface: AppColors.surfaceDark,
  onSurface: AppColors.onSurfaceDark,
  surfaceContainerHighest: AppColors.surfaceContainerHighestDark,
  surfaceContainerHigh: AppColors.surfaceContainerHighDark,
  surfaceContainer: AppColors.surfaceContainerDark,
  surfaceContainerLow: AppColors.surfaceVariantDark,
  surfaceContainerLowest: AppColors.backgroundDark,
  onSurfaceVariant: AppColors.onSurfaceVariantDark,
  outline: AppColors.outlineDark,
  outlineVariant: AppColors.outlineVariantDark,
  shadow: AppColors.shadowDark,
  scrim: AppColors.shadowDark,
  inverseSurface: AppColors.surfaceLight,
  onInverseSurface: AppColors.onSurfaceLight,
  inversePrimary: AppColors.primary,
);

/// Emergency Color Scheme (High Contrast)
const ColorScheme _emergencyColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.emergency,
  onPrimary: AppColors.onEmergency,
  primaryContainer: AppColors.emergencyDark,
  onPrimaryContainer: AppColors.onEmergencyContainer,
  secondary: AppColors.emergencyAccent,
  onSecondary: AppColors.emergency,
  secondaryContainer: AppColors.emergencyDark,
  onSecondaryContainer: AppColors.onEmergencyContainer,
  tertiary: AppColors.emergencyAccent,
  onTertiary: AppColors.emergency,
  tertiaryContainer: AppColors.emergencyDark,
  onTertiaryContainer: AppColors.onEmergencyContainer,
  error: AppColors.emergencyLight,
  onError: AppColors.onEmergency,
  errorContainer: AppColors.emergencyDark,
  onErrorContainer: AppColors.onEmergencyContainer,
  surface: AppColors.emergencySurface,
  onSurface: AppColors.emergencyOnSurface,
  surfaceContainerHighest: AppColors.emergencySurfaceVariant,
  surfaceContainerHigh: AppColors.emergencySurfaceVariant,
  surfaceContainer: AppColors.emergencySurface,
  surfaceContainerLow: AppColors.emergencySurface,
  surfaceContainerLowest: AppColors.emergencySurface,
  onSurfaceVariant: AppColors.emergencyOnSurface,
  outline: AppColors.emergencyOutline,
  outlineVariant: AppColors.emergencyOutline,
  shadow: Colors.black,
  scrim: Colors.black,
  inverseSurface: AppColors.emergencyOnSurface,
  onInverseSurface: AppColors.emergency,
  inversePrimary: AppColors.emergencyAccent,
);

/// Main theme class providing light, dark, and emergency themes
class AppTheme {
  AppTheme._();

  // ===========================================================================
  // Light Theme
  // ===========================================================================
  static ThemeData get lightTheme =>
      _buildTheme(brightness: Brightness.light, colorScheme: _lightColorScheme);

  // ===========================================================================
  // Dark Theme
  // ===========================================================================
  static ThemeData get darkTheme =>
      _buildTheme(brightness: Brightness.dark, colorScheme: _darkColorScheme);

  // ===========================================================================
  // Emergency Theme (High Contrast)
  // ===========================================================================
  static ThemeData get emergencyTheme => _buildTheme(
    brightness: Brightness.dark,
    colorScheme: _emergencyColorScheme,
  );

  // ===========================================================================
  // Theme Builder
  // ===========================================================================
  static ThemeData _buildTheme({
    required Brightness brightness,
    required ColorScheme colorScheme,
  }) {
    final TextTheme textTheme = _buildTextTheme(brightness);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      fontFamily: AppTextStyles.fontFamilyUI,

      // AppBar Theme — left-aligned titles across all screens
      appBarTheme: AppBarTheme(
        centerTitle: false,
        titleSpacing: AppSpacing.md,
        elevation: AppElevation.level0,
        scrolledUnderElevation: AppElevation.level1,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        systemOverlayStyle: brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: AppElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, AppSpacing.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          elevation: AppElevation.level1,
          textStyle: textTheme.labelLarge,
        ),
      ),

      // Filled Button Theme
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: Size(double.infinity, AppSpacing.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(double.infinity, AppSpacing.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          side: BorderSide(color: colorScheme.outline, width: 1.5),
          textStyle: textTheme.labelLarge,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, AppSpacing.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          textStyle: textTheme.labelLarge,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHigh,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        ),
        errorStyle: textTheme.bodySmall?.copyWith(color: colorScheme.error),
        floatingLabelStyle: textTheme.labelMedium?.copyWith(
          color: colorScheme.primary,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
        labelStyle: textTheme.labelMedium,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        side: BorderSide(color: colorScheme.outlineVariant),
        selectedColor: colorScheme.primaryContainer,
        checkmarkColor: colorScheme.onPrimaryContainer,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        elevation: AppElevation.level4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        ),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: textTheme.bodyMedium,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: BottomSheetThemeData(
        elevation: AppElevation.level4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusXl),
          ),
        ),
        modalBarrierColor: Colors.black54,
      ),

      // Navigation Bar Theme
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        elevation: AppElevation.level3,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return textTheme.labelSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w500,
            );
          }
          return textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          );
        }),
        indicatorColor: colorScheme.primaryContainer,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: textTheme.labelLarge,
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: colorScheme.primary, width: 3),
          ),
        ),
        dividerColor: colorScheme.outlineVariant,
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        titleTextStyle: textTheme.titleMedium,
        subtitleTextStyle: textTheme.bodyMedium,
        leadingAndTrailingTextStyle: textTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        textStyle: textTheme.labelSmall?.copyWith(
          color: colorScheme.onInverseSurface,
        ),
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),

      // Snack Bar Theme
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        contentTextStyle: textTheme.bodyMedium,
        actionBackgroundColor: colorScheme.tertiary,
        actionTextColor: colorScheme.onTertiary,
        elevation: AppElevation.level3,
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: colorScheme.surfaceContainerHigh,
        circularTrackColor: colorScheme.surfaceContainerHigh,
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.surfaceContainerHigh,
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withValues(alpha: 0.12),
        valueIndicatorColor: colorScheme.primary,
        valueIndicatorTextStyle: textTheme.labelSmall?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.surfaceContainerHigh;
        }),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
        side: BorderSide(color: colorScheme.outline, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: AppElevation.level3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: AppSpacing.iconSizeMd,
      ),

      // Primary Icon Theme
      primaryIconTheme: IconThemeData(
        color: colorScheme.onPrimary,
        size: AppSpacing.iconSizeMd,
      ),

      // Scaffold Background
      scaffoldBackgroundColor: colorScheme.surface,

      // Page Transitions
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: const ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: const ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: const ZoomPageTransitionsBuilder(),
        },
      ),
    );
  }

  // ===========================================================================
  // Text Theme Builder
  // ===========================================================================
  static TextTheme _buildTextTheme(Brightness brightness) {
    final Color onSurface = brightness == Brightness.light
        ? AppColors.onSurfaceLight
        : AppColors.onSurfaceDark;
    final Color onSurfaceVariant = brightness == Brightness.light
        ? AppColors.onSurfaceVariantLight
        : AppColors.onSurfaceVariantDark;

    return TextTheme(
      displayLarge: AppTextStyleBuilder.interTextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.12,
        color: onSurface,
      ),
      displayMedium: AppTextStyleBuilder.interTextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
        color: onSurface,
      ),
      displaySmall: AppTextStyleBuilder.interTextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.22,
        color: onSurface,
      ),
      headlineLarge: AppTextStyleBuilder.interTextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
        color: onSurface,
      ),
      headlineMedium: AppTextStyleBuilder.interTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
        color: onSurface,
      ),
      headlineSmall: AppTextStyleBuilder.interTextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.33,
        color: onSurface,
      ),
      titleLarge: AppTextStyleBuilder.interTextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        height: 1.27,
        color: onSurface,
      ),
      titleMedium: AppTextStyleBuilder.interTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 1.50,
        color: onSurface,
      ),
      titleSmall: AppTextStyleBuilder.interTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: onSurface,
      ),
      bodyLarge: AppTextStyleBuilder.interTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.50,
        color: onSurface,
      ),
      bodyMedium: AppTextStyleBuilder.interTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
        color: onSurface,
      ),
      bodySmall: AppTextStyleBuilder.interTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
        color: onSurfaceVariant,
      ),
      labelLarge: AppTextStyleBuilder.interTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.43,
        color: onSurface,
      ),
      labelMedium: AppTextStyleBuilder.interTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.33,
        color: onSurface,
      ),
      labelSmall: AppTextStyleBuilder.interTextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.45,
        color: onSurfaceVariant,
      ),
    );
  }
}
