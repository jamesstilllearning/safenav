/// SAFENAV CAVITE - Emergency Contacts Repository
///
/// Repository for managing ICE contacts and medical information in Firestore.
library;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failures.dart' hide FirebaseException;
import '../../../../core/errors/result.dart';
import '../../../../core/firebase/firebase_init.dart';
import '../../../../shared/models/user_preferences.dart';
import '../models/emergency_contact.dart';

/// Emergency contacts repository provider
final emergencyContactsRepositoryProvider = Provider<EmergencyContactsRepository>((ref) => EmergencyContactsRepository.instance);

/// Repository for emergency contact operations
class EmergencyContactsRepository {
  EmergencyContactsRepository._() {
    debugPrint('[EMERGENCY_CONTACTS_REPO] EmergencyContactsRepository: Constructor called');
  }

  static final EmergencyContactsRepository _instance = EmergencyContactsRepository._();
  static EmergencyContactsRepository get instance => _instance;

  final fs.FirebaseFirestore _firestore = fs.FirebaseFirestore.instance;

  /// Collection reference for emergency contacts
  fs.CollectionReference<Map<String, dynamic>> get _contactsCollection =>
      _firestore.collection(FirebaseConfig.usersCollection).doc('__emergency_contacts__').collection('contacts');

  /// Collection reference for medical info
  fs.CollectionReference<Map<String, dynamic>> get _medicalInfoCollection =>
      _firestore.collection(FirebaseConfig.usersCollection).doc('__medical_info__').collection('info');

  /// Collection reference for emergency preferences
  fs.CollectionReference<Map<String, dynamic>> get _emergencyPreferencesCollection =>
      _firestore.collection(FirebaseConfig.usersCollection).doc('__emergency_preferences__').collection('preferences');

  // ==================== EMERGENCY CONTACTS ====================

  /// Creates a new emergency contact
  Future<Result<EmergencyContact>> createContact(EmergencyContact contact) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] createContact: Creating contact ${contact.id}');
      final docRef = _contactsCollection.doc(contact.id);
      await docRef.set(contact.toJson());
      debugPrint('[EMERGENCY_CONTACTS_REPO] createContact: Successfully created contact ${contact.id}');
      return Success(contact);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] createContact: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] createContact: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to create emergency contact',
        code: 'CREATE_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets an emergency contact by ID
  Future<Result<EmergencyContact>> getContact(String contactId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getContact: Fetching contact $contactId');
      final docSnapshot = await _contactsCollection.doc(contactId).get();

      if (!docSnapshot.exists) {
        debugPrint('[EMERGENCY_CONTACTS_REPO] getContact: Contact not found: $contactId');
        return FailureResult(FirestoreFailure(
          message: 'Contact not found',
          code: 'CONTACT_NOT_FOUND',
        ));
      }

      final data = docSnapshot.data()!;
      final contact = EmergencyContact.fromJson(data);
      debugPrint('[EMERGENCY_CONTACTS_REPO] getContact: Successfully fetched contact $contactId');
      return Success(contact);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getContact: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getContact: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get emergency contact',
        code: 'GET_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Updates an emergency contact
  Future<Result<EmergencyContact>> updateContact(EmergencyContact contact) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] updateContact: Updating contact ${contact.id}');
      final docRef = _contactsCollection.doc(contact.id);
      final updatedContact = contact.copyWith(updatedAt: DateTime.now());
      await docRef.update(updatedContact.toJson());
      debugPrint('[EMERGENCY_CONTACTS_REPO] updateContact: Successfully updated contact ${contact.id}');
      return Success(updatedContact);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] updateContact: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] updateContact: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to update emergency contact',
        code: 'UPDATE_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Deletes an emergency contact
  Future<Result<void>> deleteContact(String contactId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] deleteContact: Deleting contact $contactId');
      await _contactsCollection.doc(contactId).delete();
      debugPrint('[EMERGENCY_CONTACTS_REPO] deleteContact: Successfully deleted contact $contactId');
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] deleteContact: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] deleteContact: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to delete emergency contact',
        code: 'DELETE_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets all emergency contacts for a user
  Future<Result<List<EmergencyContact>>> getUserContacts(String userId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getUserContacts: Fetching contacts for user $userId');
      final snapshot = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('isPrimary', descending: true)
          .orderBy('createdAt', descending: true)
          .get();

      final contacts = snapshot.docs
          .map((doc) => EmergencyContact.fromJson(doc.data()))
          .toList();

      debugPrint('[EMERGENCY_CONTACTS_REPO] getUserContacts: Fetched ${contacts.length} contacts');
      return Success(contacts);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getUserContacts: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getUserContacts: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get user contacts',
        code: 'GET_USER_CONTACTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of user emergency contacts for real-time updates
  Stream<List<EmergencyContact>> watchUserContacts(String userId) {
    return _contactsCollection
        .where('userId', isEqualTo: userId)
        .orderBy('isPrimary', descending: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => EmergencyContact.fromJson(doc.data()))
              .toList();
        });
  }

  /// Gets primary emergency contact for a user
  Future<Result<EmergencyContact?>> getPrimaryContact(String userId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getPrimaryContact: Fetching primary contact for user $userId');
      final snapshot = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .where('isPrimary', isEqualTo: true)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return const Success(null);
      }

      final contact = EmergencyContact.fromJson(snapshot.docs.first.data());
      return Success(contact);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getPrimaryContact: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getPrimaryContact: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get primary contact',
        code: 'GET_PRIMARY_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets contacts that should be notified for emergencies
  Future<Result<List<EmergencyContact>>> getEmergencyNotificationContacts(String userId) async {
    try {
      final snapshot = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .where('notifyOnEmergency', isEqualTo: true)
          .get();

      final contacts = snapshot.docs
          .map((doc) => EmergencyContact.fromJson(doc.data()))
          .toList();

      return Success(contacts);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get emergency notification contacts',
        code: 'GET_EMERGENCY_CONTACTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets contacts that should be notified for drills
  Future<Result<List<EmergencyContact>>> getDrillNotificationContacts(String userId) async {
    try {
      final snapshot = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .where('notifyOnDrill', isEqualTo: true)
          .get();

      final contacts = snapshot.docs
          .map((doc) => EmergencyContact.fromJson(doc.data()))
          .toList();

      return Success(contacts);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get drill notification contacts',
        code: 'GET_DRILL_CONTACTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Sets a contact as primary (unsets others)
  Future<Result<void>> setPrimaryContact(String userId, String contactId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] setPrimaryContact: Setting contact $contactId as primary for user $userId');

      final batch = _firestore.batch();

      // Unset all current primary contacts
      final currentPrimary = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .where('isPrimary', isEqualTo: true)
          .get();

      for (final doc in currentPrimary.docs) {
        batch.update(doc.reference, {'isPrimary': false, 'updatedAt': FieldValue.serverTimestamp()});
      }

      // Set new primary
      final newPrimaryRef = _contactsCollection.doc(contactId);
      batch.update(newPrimaryRef, {'isPrimary': true, 'updatedAt': FieldValue.serverTimestamp()});

      await batch.commit();
      debugPrint('[EMERGENCY_CONTACTS_REPO] setPrimaryContact: Successfully set primary contact');
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] setPrimaryContact: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] setPrimaryContact: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to set primary contact',
        code: 'SET_PRIMARY_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ==================== MEDICAL INFO ====================

  /// Creates or updates medical info
  Future<Result<MedicalInfo>> upsertMedicalInfo(MedicalInfo info) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] upsertMedicalInfo: Upserting medical info for user ${info.userId}');
      final docRef = _medicalInfoCollection.doc(info.userId);
      final updatedInfo = info.copyWith(updatedAt: DateTime.now());
      await docRef.set(updatedInfo.toJson());
      debugPrint('[EMERGENCY_CONTACTS_REPO] upsertMedicalInfo: Successfully upserted medical info');
      return Success(updatedInfo);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] upsertMedicalInfo: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] upsertMedicalInfo: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to upsert medical info',
        code: 'UPSERT_MEDICAL_INFO_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets medical info for a user
  Future<Result<MedicalInfo>> getMedicalInfo(String userId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getMedicalInfo: Fetching medical info for user $userId');
      final docSnapshot = await _medicalInfoCollection.doc(userId).get();

      if (!docSnapshot.exists) {
        // Return empty medical info
        final emptyInfo = MedicalInfo.empty(userId);
        return Success(emptyInfo);
      }

      final data = docSnapshot.data()!;
      final info = MedicalInfo.fromJson(data);
      return Success(info);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getMedicalInfo: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getMedicalInfo: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get medical info',
        code: 'GET_MEDICAL_INFO_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of medical info for real-time updates
  Stream<MedicalInfo> watchMedicalInfo(String userId) {
    return _medicalInfoCollection.doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return MedicalInfo.fromJson(snapshot.data()!);
      }
      return MedicalInfo.empty(userId);
    });
  }

  /// Deletes medical info
  Future<Result<void>> deleteMedicalInfo(String userId) async {
    try {
      await _medicalInfoCollection.doc(userId).delete();
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to delete medical info',
        code: 'DELETE_MEDICAL_INFO_FAILED',
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

  // ==================== EMERGENCY PREFERENCES ====================

  /// Gets emergency preferences for a user
  Future<Result<EmergencyPreferences>> getPreferences(String userId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getPreferences: Fetching preferences for user $userId');
      final docSnapshot = await _emergencyPreferencesCollection.doc(userId).get();

      if (!docSnapshot.exists) {
        // Return default preferences
        final defaultPrefs = EmergencyPreferences.defaultPreferences(userId);
        return Success(defaultPrefs);
      }

      final data = docSnapshot.data()!;
      final prefs = EmergencyPreferences.fromJson(data);
      return Success(prefs);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getPreferences: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getPreferences: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get emergency preferences',
        code: 'GET_EMERGENCY_PREFERENCES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Saves emergency preferences for a user
  Future<Result<EmergencyPreferences>> savePreferences(EmergencyPreferences prefs) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] savePreferences: Saving preferences for user ${prefs.userId}');
      final docRef = _emergencyPreferencesCollection.doc(prefs.userId);
      final updatedPrefs = EmergencyPreferences(
        userId: prefs.userId,
        shareLocationWithContacts: prefs.shareLocationWithContacts,
        shareLocationWithResponders: prefs.shareLocationWithResponders,
        autoCallEmergency: prefs.autoCallEmergency,
        autoCallDelaySeconds: prefs.autoCallDelaySeconds,
        sendPeriodicUpdates: prefs.sendPeriodicUpdates,
        updateIntervalSeconds: prefs.updateIntervalSeconds,
        vibrateOnEmergency: prefs.vibrateOnEmergency,
        flashScreenOnEmergency: prefs.flashScreenOnEmergency,
        playSirenSound: prefs.playSirenSound,
        alertLevel: prefs.alertLevel,
        blockedAlertTypes: prefs.blockedAlertTypes,
        customSettings: prefs.customSettings,
        createdAt: prefs.createdAt,
        updatedAt: DateTime.now(),
      );
      await docRef.set(updatedPrefs.toJson());
      debugPrint('[EMERGENCY_CONTACTS_REPO] savePreferences: Successfully saved preferences');
      return Success(updatedPrefs);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] savePreferences: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] savePreferences: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to save emergency preferences',
        code: 'SAVE_EMERGENCY_PREFERENCES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of emergency preferences for real-time updates
  Stream<EmergencyPreferences> watchPreferences(String userId) {
    return _emergencyPreferencesCollection.doc(userId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return EmergencyPreferences.fromJson(snapshot.data()!);
      }
      return EmergencyPreferences.defaultPreferences(userId);
    });
  }
}