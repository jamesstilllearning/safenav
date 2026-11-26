/// SAFENAV CAVITE - Main Application Entry Point
///
/// Campus Navigation and Emergency Evacuation System for EARIST Cavite Campus.
library;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/core/firebase/firebase_init.dart';
import 'src/core/router/app_router.dart';
import 'src/core/theme/app_theme.dart';
import 'src/core/theme/theme_provider.dart';

/// Main application widget
class SafeNavApp extends ConsumerWidget {
  const SafeNavApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize Firebase FIRST.
    debugPrint('[MAIN] SafeNavApp.build: Watching firebaseInitProvider...');
    final firebaseInit = ref.watch(firebaseInitProvider);

    // Load theme preferences
    ref.listen(themeControllerProvider, (previous, next) {
      if (previous is! ThemeState || previous.themeMode != next.themeMode) {
        debugPrint('[MAIN] Theme mode changed: ${next.themeMode}');
      }
    });

    return firebaseInit.when(
      data: (_) {
        debugPrint(
          '[MAIN] SafeNavApp.build: firebaseInitProvider completed, watching routerProvider...',
        );
        // Only access the router AFTER Firebase initializes.
        final router = ref.watch(routerProvider);
        debugPrint(
          '[MAIN] SafeNavApp.build: routerProvider completed, building MaterialApp.router',
        );

        // Watch theme mode for dynamic theme switching
        final themeMode = ref.watch(effectiveThemeModeProvider);
        final isEmergency = ref.watch(isEmergencyModeProvider);

        return MaterialApp.router(
          title: 'SAFENAV CAVITE',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: isEmergency ? AppTheme.emergencyTheme : AppTheme.darkTheme,
          themeMode: themeMode,
          routerConfig: router,
          builder: (context, child) => _AppBuilder(child: child),
        );
      },
      loading: () {
        debugPrint(
          '[MAIN] SafeNavApp.build: firebaseInitProvider still loading, showing _LoadingApp',
        );
        return _LoadingApp();
      },
      error: (error, stack) {
        debugPrint(
          '[MAIN] SafeNavApp.build: firebaseInitProvider ERROR - $error',
        );
        return _ErrorApp(error: error);
      },
    );
  }
}

/// Wrapper for app-level providers and initialization
class _AppBuilder extends ConsumerWidget {
  const _AppBuilder({required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Ensure theme is loaded on first build
    ref.listen(themeControllerProvider, (_, __) {});

    // Initialize services that need context
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        // Ensure text scaling doesn't break UI
        textScaler: TextScaler.linear(
          MediaQuery.of(context).textScaler.scale(1.0).clamp(0.8, 1.3),
        ),
      ),
      child: child ?? const SizedBox.shrink(),
    );
  }
}

/// Loading screen while Firebase initializes
class _LoadingApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'SAFENAV CAVITE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
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
              const Text('Initializing...'),
            ],
          ),
        ),
      ),
    );
  }
}

/// Error screen for initialization failures
class _ErrorApp extends ConsumerWidget {
  const _ErrorApp({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'SAFENAV CAVITE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Initialization Failed',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Future.microtask(() => main()),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Application entry point
void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Run the app with Riverpod provider scope
  runApp(const ProviderScope(child: SafeNavApp()));
}
