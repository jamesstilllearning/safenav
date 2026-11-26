/// SAFENAV CAVITE - Firestore Service
///
/// Handles Firestore database operations for user profiles and other data.
library;

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/user.dart';
import '../errors/failures.dart' hide FirebaseException;
import '../errors/result.dart';
import '../firebase/firebase_init.dart';

/// Firestore service provider
final firestoreServiceProvider = Provider<FirestoreService>((ref) => FirestoreService.instance);

/// Service for Firestore operations
class FirestoreService {
  FirestoreService._() {
    debugPrint('[FIRESTORE] FirestoreService: Constructor called');
  }

  static final FirestoreService _instance = FirestoreService._();
  static FirestoreService get instance => _instance;

  final fs.FirebaseFirestore _firestore = fs.FirebaseFirestore.instance;

  /// Collection reference for users
  fs.CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection(FirebaseConfig.usersCollection);

  /// Creates a user profile in Firestore
  Future<Result<void>> createUserProfile(User user) async {
    try {
      debugPrint('[FIRESTORE] createUserProfile: Creating profile for user ${user.id}');
      final docRef = _usersCollection.doc(user.id);
      await docRef.set(user.toJson());
      debugPrint('[FIRESTORE] createUserProfile: Successfully created profile for user ${user.id}');
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      debugPrint('[FIRESTORE] createUserProfile: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[FIRESTORE] createUserProfile: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to create user profile',
        code: 'CREATE_PROFILE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets a user profile from Firestore
  Future<Result<User>> getUserProfile(String userId) async {
    try {
      debugPrint('[FIRESTORE] getUserProfile: Fetching profile for user $userId');
      final docSnapshot = await _usersCollection.doc(userId).get();

      if (!docSnapshot.exists) {
        debugPrint('[FIRESTORE] getUserProfile: Profile not found for user $userId');
        return FailureResult(FirestoreFailure(
          message: 'User profile not found',
          code: 'PROFILE_NOT_FOUND',
        ));
      }

      final data = docSnapshot.data()!;
      final user = User.fromJson(data);
      debugPrint('[FIRESTORE] getUserProfile: Successfully fetched profile for user $userId');
      return Success(user);
    } on fs.FirebaseException catch (e) {
      debugPrint('[FIRESTORE] getUserProfile: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[FIRESTORE] getUserProfile: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get user profile',
        code: 'GET_PROFILE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Updates a user profile in Firestore
  Future<Result<void>> updateUserProfile(User user) async {
    try {
      debugPrint('[FIRESTORE] updateUserProfile: Updating profile for user ${user.id}');
      final docRef = _usersCollection.doc(user.id);
      await docRef.update(user.toJson());
      debugPrint('[FIRESTORE] updateUserProfile: Successfully updated profile for user ${user.id}');
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      debugPrint('[FIRESTORE] updateUserProfile: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[FIRESTORE] updateUserProfile: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to update user profile',
        code: 'UPDATE_PROFILE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Deletes a user profile from Firestore
  Future<Result<void>> deleteUserProfile(String userId) async {
    try {
      debugPrint('[FIRESTORE] deleteUserProfile: Deleting profile for user $userId');
      await _usersCollection.doc(userId).delete();
      debugPrint('[FIRESTORE] deleteUserProfile: Successfully deleted profile for user $userId');
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      debugPrint('[FIRESTORE] deleteUserProfile: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[FIRESTORE] deleteUserProfile: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to delete user profile',
        code: 'DELETE_PROFILE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Queries users with filtering and pagination
  Future<Result<List<User>>> queryUsers({
    UserRole? role,
    bool? isActive,
    int limit = 50,
    fs.DocumentSnapshot? startAfter,
  }) async {
    try {
      debugPrint('[FIRESTORE] queryUsers: Fetching users with filters');
      fs.Query<Map<String, dynamic>> query = _usersCollection
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (role != null) {
        query = query.where('role', isEqualTo: role.name);
      }
      if (isActive != null) {
        query = query.where('isActive', isEqualTo: isActive);
      }
      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();
      final users = snapshot.docs
          .map((doc) => User.fromJson(doc.data()))
          .toList();

      debugPrint('[FIRESTORE] queryUsers: Fetched ${users.length} users');
      return Success(users);
    } on fs.FirebaseException catch (e) {
      debugPrint('[FIRESTORE] queryUsers: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[FIRESTORE] queryUsers: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to query users',
        code: 'QUERY_USERS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets users count with optional filters
  Future<Result<int>> getUsersCount({
    UserRole? role,
    bool? isActive,
  }) async {
    try {
      fs.Query<Map<String, dynamic>> query = _usersCollection;

      if (role != null) {
        query = query.where('role', isEqualTo: role.name);
      }
      if (isActive != null) {
        query = query.where('isActive', isEqualTo: isActive);
      }

      final snapshot = await query.count().get();
      return Success(snapshot.count ?? 0);
    } on fs.FirebaseException catch (e) {
      debugPrint('[FIRESTORE] getUsersCount: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get users count',
        code: 'GET_COUNT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Checks if a user profile exists in Firestore
  Future<Result<bool>> userProfileExists(String userId) async {
    try {
      final docSnapshot = await _usersCollection.doc(userId).get();
      return Success(docSnapshot.exists);
    } on fs.FirebaseException catch (e) {
      debugPrint('[FIRESTORE] userProfileExists: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[FIRESTORE] userProfileExists: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to check user profile existence',
        code: 'CHECK_PROFILE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Maps Firestore error codes to user-friendly messages
  String _getFirestoreErrorMessage(String code) {
    switch (code) {
      case 'permission-denied':
        return 'Permission denied. You do not have access to this resource.';
      case 'not-found':
        return 'The requested document was not found.';
      case 'already-exists':
        return 'A document with this ID already exists.';
      case 'resource-exhausted':
        return 'Too many requests. Please try again later.';
      case 'failed-precondition':
        return 'Operation failed due to a precondition.';
      case 'aborted':
        return 'Operation was aborted. Please try again.';
      case 'out-of-range':
        return 'Operation was out of range.';
      case 'unimplemented':
        return 'Operation is not implemented.';
      case 'internal':
        return 'Internal server error. Please try again later.';
      case 'unavailable':
        return 'Service unavailable. Please check your connection.';
      case 'data-loss':
        return 'Data loss occurred. Please contact support.';
      case 'unauthenticated':
        return 'Authentication required. Please sign in again.';
      default:
        return 'Database error: $code';
    }
  }
}