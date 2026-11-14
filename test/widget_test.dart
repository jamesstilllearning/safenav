// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:safenav_cavite/main.dart';
import 'package:safenav_cavite/src/core/firebase/firebase_init.dart';
import 'package:safenav_cavite/src/core/services/auth_service.dart';
import 'package:safenav_cavite/src/features/auth/auth_state.dart';
import 'package:safenav_cavite/src/shared/models/user.dart';
import 'package:safenav_cavite/src/core/errors/result.dart';

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    // Create a mock user for testing
    final mockUser = User(
      id: 'test-user-001',
      email: 'test@earist.edu.ph',
      firstName: 'Test',
      lastName: 'User',
      role: UserRole.student,
      emailVerified: true,
      createdAt: DateTime.fromMillisecondsSinceEpoch(1704067200000, isUtc: true), // 2024-01-01
      updatedAt: DateTime.fromMillisecondsSinceEpoch(1704067200000, isUtc: true),
    );

    // Create a mock auth service
    final mockAuthService = _MockAuthService(mockUser);

    // Override all necessary providers for testing
    final container = ProviderContainer(
      overrides: [
        // Skip Firebase initialization
        firebaseInitProvider.overrideWith((ref) async {}),
        // Override auth service to return mock user
        authServiceProvider.overrideWith((ref) => mockAuthService),
        // Override auth status to return authenticated state immediately
        authStatusProvider.overrideWith((ref) => AuthStatus.authenticated(mockUser)),
      ],
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const SafeNavApp(),
      ),
    );

    // Pump a few frames to allow the app to render
    // The initial route is '/' (splash screen) which shows "SAFENAV CAVITE"
    // Note: The splash screen's ref.listen only fires on changes, not initial value,
    // so it won't auto-navigate to home in this test setup
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 100));

    // Verify that the app loads without error - check for splash screen text
    // The splash screen shows "SAFENAV CAVITE" text
    expect(find.text('SAFENAV CAVITE'), findsOneWidget);

    // Clean up
    container.dispose();
  });
}

// Mock AuthService for testing - implements AuthService interface
class _MockAuthService implements AuthService {
  _MockAuthService(this._mockUser);

  final User _mockUser;

  @override
  Future<Result<void>> initialize() async {
    return const Success(null);
  }

  @override
  bool get isLoggedIn => true;

  @override
  User? get currentUser => _mockUser;

  @override
  Future<void> dispose() async {
    // No-op for testing
  }

  // Unused methods for testing - return not implemented
  @override
  Stream<User?> get authStateChanges => throw UnimplementedError();

  @override
  bool get isInitialized => true;

  @override
  Future<Result<User>> signInWithEmailAndPassword(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? middleInitial,
    required UserRole role,
    String? studentId,
    String? employeeId,
    String? department,
    String? phoneNumber,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> sendEmailVerification() async {
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateProfile({String? displayName, String? photoUrl}) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> signOut() async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteAccount() async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> reauthenticateWithPassword(String password) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updatePassword(String newPassword) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> getIdToken({bool forceRefresh = false}) async {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> setCustomClaims(String uid, Map<String, dynamic> claims) async {
    throw UnimplementedError();
  }

  // Dev methods
  @override
  Future<void> setMockUserForDev({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required UserRole role,
    String? middleInitial,
    String? studentId,
    String? employeeId,
    String? department,
    String? phoneNumber,
  }) async {
    // No-op
  }

  @override
  Future<void> clearMockUserForDev() async {
    // No-op
  }
}
