/// SAFENAV CAVITE - Dart Extensions
///
/// Common extension methods for Flutter/Dart types used throughout the app.
library;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

/// Extensions on BuildContext for easy theme access
extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get safeAreaPadding => mediaQuery.padding;
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomNavBarHeight => mediaQuery.padding.bottom;
  bool get isDarkMode => theme.brightness == Brightness.dark;
  bool get isEmergencyMode => theme.colorScheme.primary == const Color(0xFFB71C1C);

  // Responsive breakpoints
  bool get isPhone => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;
  bool get isDesktop => screenWidth >= 1200;

  // Safe navigation
  void pop<T>([T? result]) => Navigator.of(this).pop(result);
  Future<T?> push<T>(Widget page) => Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));
  Future<T?> pushReplacement<T>(Widget page) => Navigator.of(this).pushReplacement<T, T>(MaterialPageRoute(builder: (_) => page));
  void pushAndRemoveUntil<T>(Widget page) => Navigator.of(this).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => page),
    (route) => false,
  );
}

/// Extensions on Color for common operations
extension ColorExtensions on Color {
  Color withOpacity(double opacity) => withValues(alpha: opacity);
  Color lighten(double amount) => Color.fromARGB(
    (a * 255.0).round().clamp(0, 255),
    ((r * 255.0) + ((255 - r * 255.0) * amount)).round().clamp(0, 255),
    ((g * 255.0) + ((255 - g * 255.0) * amount)).round().clamp(0, 255),
    ((b * 255.0) + ((255 - b * 255.0) * amount)).round().clamp(0, 255),
  );
  Color darken(double amount) => Color.fromARGB(
    (a * 255.0).round().clamp(0, 255),
    ((r * 255.0) * (1 - amount)).round().clamp(0, 255),
    ((g * 255.0) * (1 - amount)).round().clamp(0, 255),
    ((b * 255.0) * (1 - amount)).round().clamp(0, 255),
  );
  bool get isLight => computeLuminance() > 0.5;
  bool get isDark => !isLight;
}

/// Extensions on String for validation and formatting
extension StringExtensions on String {
  bool get isValidEmail => RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
  ).hasMatch(this);

  bool get isValidPhone => RegExp(
    r'^(\+63|0)?9\d{9}$',
  ).hasMatch(replaceAll(RegExp(r'\s+'), ''));

  String get trimmed => trim();
  String get capitalize => isEmpty ? this : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String get titleCase => split(' ').map((w) => w.capitalize).join(' ');

  String maskEmail() {
    if (!isValidEmail) return this;
    final parts = split('@');
    final name = parts[0];
    if (name.length <= 2) return '${name[0]}***@${parts[1]}';
    return '${name.substring(0, 2)}${'*' * (name.length - 2)}@${parts[1]}';
  }
}

/// Extensions on num for formatting
extension NumExtensions on num {
  String formatDistance({String locale = AppConstants.languageEnglish}) {
    if (this < 1000) {
      return '${toStringAsFixed(0)} m';
    }
    return '${(this / 1000).toStringAsFixed(1)} km';
  }

  String formatDuration({String locale = AppConstants.languageEnglish}) {
    final minutes = (this / 60).floor();
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = (minutes / 60).floor();
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) {
      return '$hours hr';
    }
    return '$hours hr $remainingMinutes min';
  }

  String formatCoordinate({int decimals = 6}) => toStringAsFixed(decimals);
}

/// Extensions on DateTime for formatting
extension DateTimeExtensions on DateTime {
  String formatTime({String locale = AppConstants.languageEnglish}) {
    return DateFormat.jm(locale).format(this);
  }

  String formatDate({String locale = AppConstants.languageEnglish}) {
    return DateFormat.yMMMd(locale).format(this);
  }

  String formatDateTime({String locale = AppConstants.languageEnglish}) {
    return DateFormat.yMMMd(locale).add_jm().format(this);
  }

  String formatRelative({String locale = AppConstants.languageEnglish}) {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return formatDate(locale: locale);
    }
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }
}

/// Extensions on List for common operations
extension ListExtensions<T> on List<T> {
  bool get isNullOrEmpty => isEmpty;
  bool get isNotNullOrEmpty => isNotEmpty;

  List<T> distinctBy<K>(K Function(T) key) {
    final seen = <K>{};
    return where((element) => seen.add(key(element))).toList();
  }

  T? firstOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  List<List<T>> chunk(int size) {
    if (size <= 0) throw ArgumentError('Size must be greater than 0');
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, (i + size).clamp(0, length)));
    }
    return chunks;
  }
}

/// Extensions on Map for common operations
extension MapExtensions<K, V> on Map<K, V> {
  V? getOrDefault(K key, V defaultValue) => this[key] ?? defaultValue;

  Map<K, R> mapValues<R>(R Function(V) transform) {
    return Map.fromEntries(entries.map((e) => MapEntry(e.key, transform(e.value))));
  }
}

/// Extensions on Widget for common patterns
extension WidgetExtensions on Widget {
  Widget paddingAll(double value) => Padding(padding: EdgeInsets.all(value), child: this);
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), child: this);
  Widget paddingOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      Padding(padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom), child: this);

  Widget centered() => Center(child: this);
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);

  Widget withConstraints(BoxConstraints constraints) => ConstrainedBox(constraints: constraints, child: this);
  Widget sizedBox({double? width, double? height}) => SizedBox(width: width, height: height, child: this);

  Widget visible(bool visible, {Widget? replacement}) => visible ? this : (replacement ?? const SizedBox.shrink());

  Widget onTap(VoidCallback onTap) => InkWell(onTap: onTap, child: this);
  Widget onLongPress(VoidCallback onLongPress) => InkWell(onLongPress: onLongPress, child: this);

  Widget clipRRect({double radius = 12}) => ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);
  Widget clipOval() => ClipOval(child: this);

  Widget withHero(String tag) => Hero(tag: tag, child: this);
  Widget withKey(Key key) => KeyedSubtree(key: key, child: this);
}