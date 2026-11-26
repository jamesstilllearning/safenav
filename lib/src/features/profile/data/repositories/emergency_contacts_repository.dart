/// SAFENAV CAVITE - Emergency Contacts Repository
///
/// Repository for managing ICE (In Case of Emergency) contacts,
/// medical information, and emergency preferences in Firestore.
library;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failures.dart' hide FirebaseException;
import '../../../../core/errors/result.dart';

/// Emergency contacts repository provider
final emergencyContactsRepositoryProvider = Provider<EmergencyContactsRepository>((ref) => EmergencyContactsRepository.instance);

/// Relationship type for emergency contacts
enum ContactRelationship {
  @JsonValue('spouse')
  spouse,
  @JsonValue('parent')
  parent,
  @JsonValue('child')
  child,
  @JsonValue('sibling')
  sibling,
  @JsonValue('relative')
  relative,
  @JsonValue('friend')
  friend,
  @JsonValue('guardian')
  guardian,
  @JsonValue('doctor')
  doctor,
  @JsonValue('other')
  other;

  String get displayName {
    switch (this) {
      case ContactRelationship.spouse:
        return 'Spouse/Partner';
      case ContactRelationship.parent:
        return 'Parent';
      case ContactRelationship.child:
        return 'Child';
      case ContactRelationship.sibling:
        return 'Sibling';
      case ContactRelationship.relative:
        return 'Relative';
      case ContactRelationship.friend:
        return 'Friend';
      case ContactRelationship.guardian:
        return 'Guardian';
      case ContactRelationship.doctor:
        return 'Doctor';
      case ContactRelationship.other:
        return 'Other';
    }
  }

  static ContactRelationship fromString(String value) {
    return ContactRelationship.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ContactRelationship.other,
    );
  }
}

/// Emergency contact model
class EmergencyContact {
  const EmergencyContact({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.relationship,
    this.email,
    this.address,
    this.isPrimary = false,
    this.canReceiveAlerts = true,
    this.canReceiveLocation = true,
    this.priority = 1,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String name;
  final String phoneNumber;
  final ContactRelationship relationship;
  final String? email;
  final String? address;
  final bool isPrimary;
  final bool canReceiveAlerts;
  final bool canReceiveLocation;
  final int priority; // 1 = highest priority
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'phoneNumber': phoneNumber,
        'relationship': relationship.name,
        'email': email,
        'address': address,
        'isPrimary': isPrimary,
        'canReceiveAlerts': canReceiveAlerts,
        'canReceiveLocation': canReceiveLocation,
        'priority': priority,
        'notes': notes,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
      };

  factory EmergencyContact.fromJson(Map<String, dynamic> json) => EmergencyContact(
        id: json['id'] as String,
        userId: json['userId'] as String,
        name: json['name'] as String,
        phoneNumber: json['phoneNumber'] as String,
        relationship: ContactRelationship.fromString(json['relationship'] as String? ?? 'other'),
        email: json['email'] as String?,
        address: json['address'] as String?,
        isPrimary: json['isPrimary'] as bool? ?? false,
        canReceiveAlerts: json['canReceiveAlerts'] as bool? ?? true,
        canReceiveLocation: json['canReceiveLocation'] as bool? ?? true,
        priority: json['priority'] as int? ?? 1,
        notes: json['notes'] as String?,
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      );

  EmergencyContact copyWith({
    String? id,
    String? userId,
    String? name,
    String? phoneNumber,
    ContactRelationship? relationship,
    String? email,
    String? address,
    bool? isPrimary,
    bool? canReceiveAlerts,
    bool? canReceiveLocation,
    int? priority,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EmergencyContact(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      relationship: relationship ?? this.relationship,
      email: email ?? this.email,
      address: address ?? this.address,
      isPrimary: isPrimary ?? this.isPrimary,
      canReceiveAlerts: canReceiveAlerts ?? this.canReceiveAlerts,
      canReceiveLocation: canReceiveLocation ?? this.canReceiveLocation,
      priority: priority ?? this.priority,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Medical information model
class MedicalInfo {
  const MedicalInfo({
    required this.userId,
    this.bloodType,
    this.allergies = const [],
    this.medications = const [],
    this.conditions = const [],
    this.emergencyNotes,
    this.organDonor = false,
    this.insuranceProvider,
    this.insurancePolicyNumber,
    this.primaryPhysician,
    this.primaryPhysicianPhone,
    required this.createdAt,
    required this.updatedAt,
  });

  final String userId;
  final String? bloodType; // A+, A-, B+, B-, AB+, AB-, O+, O-
  final List<String> allergies;
  final List<String> medications;
  final List<String> conditions;
  final String? emergencyNotes;
  final bool organDonor;
  final String? insuranceProvider;
  final String? insurancePolicyNumber;
  final String? primaryPhysician;
  final String? primaryPhysicianPhone;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'bloodType': bloodType,
        'allergies': allergies,
        'medications': medications,
        'conditions': conditions,
        'emergencyNotes': emergencyNotes,
        'organDonor': organDonor,
        'insuranceProvider': insuranceProvider,
        'insurancePolicyNumber': insurancePolicyNumber,
        'primaryPhysician': primaryPhysician,
        'primaryPhysicianPhone': primaryPhysicianPhone,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
      };

  factory MedicalInfo.fromJson(Map<String, dynamic> json) => MedicalInfo(
        userId: json['userId'] as String,
        bloodType: json['bloodType'] as String?,
        allergies: List<String>.from(json['allergies'] ?? []),
        medications: List<String>.from(json['medications'] ?? []),
        conditions: List<String>.from(json['conditions'] ?? []),
        emergencyNotes: json['emergencyNotes'] as String?,
        organDonor: json['organDonor'] as bool? ?? false,
        insuranceProvider: json['insuranceProvider'] as String?,
        insurancePolicyNumber: json['insurancePolicyNumber'] as String?,
        primaryPhysician: json['primaryPhysician'] as String?,
        primaryPhysicianPhone: json['primaryPhysicianPhone'] as String?,
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      );

  MedicalInfo copyWith({
    String? userId,
    String? bloodType,
    List<String>? allergies,
    List<String>? medications,
    List<String>? conditions,
    String? emergencyNotes,
    bool? organDonor,
    String? insuranceProvider,
    String? insurancePolicyNumber,
    String? primaryPhysician,
    String? primaryPhysicianPhone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MedicalInfo(
      userId: userId ?? this.userId,
      bloodType: bloodType ?? this.bloodType,
      allergies: allergies ?? this.allergies,
      medications: medications ?? this.medications,
      conditions: conditions ?? this.conditions,
      emergencyNotes: emergencyNotes ?? this.emergencyNotes,
      organDonor: organDonor ?? this.organDonor,
      insuranceProvider: insuranceProvider ?? this.insuranceProvider,
      insurancePolicyNumber: insurancePolicyNumber ?? this.insurancePolicyNumber,
      primaryPhysician: primaryPhysician ?? this.primaryPhysician,
      primaryPhysicianPhone: primaryPhysicianPhone ?? this.primaryPhysicianPhone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Check if medical info has any critical data
  bool get hasCriticalInfo => bloodType != null ||
      allergies.isNotEmpty ||
      medications.isNotEmpty ||
      conditions.isNotEmpty ||
      emergencyNotes != null;
}

/// Emergency preferences model
class EmergencyPreferences {
  const EmergencyPreferences({
    required this.userId,
    this.shareLocationWithContacts = true,
    this.autoCallEmergencyServices = false,
    this.sendPeriodicCheckIns = false,
    this.checkInIntervalMinutes = 60,
    this.enableSosButton = true,
    this.enableFallDetection = false,
    this.enableGeofenceAlerts = true,
    this.preferredHospital,
    this.preferredLanguage = 'en',
    this.emergencyMessageTemplate,
    required this.createdAt,
    required this.updatedAt,
  });

  final String userId;
  final bool shareLocationWithContacts;
  final bool autoCallEmergencyServices;
  final bool sendPeriodicCheckIns;
  final int checkInIntervalMinutes;
  final bool enableSosButton;
  final bool enableFallDetection;
  final bool enableGeofenceAlerts;
  final String? preferredHospital;
  final String preferredLanguage;
  final String? emergencyMessageTemplate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'shareLocationWithContacts': shareLocationWithContacts,
        'autoCallEmergencyServices': autoCallEmergencyServices,
        'sendPeriodicCheckIns': sendPeriodicCheckIns,
        'checkInIntervalMinutes': checkInIntervalMinutes,
        'enableSosButton': enableSosButton,
        'enableFallDetection': enableFallDetection,
        'enableGeofenceAlerts': enableGeofenceAlerts,
        'preferredHospital': preferredHospital,
        'preferredLanguage': preferredLanguage,
        'emergencyMessageTemplate': emergencyMessageTemplate,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
      };

  factory EmergencyPreferences.fromJson(Map<String, dynamic> json) => EmergencyPreferences(
        userId: json['userId'] as String,
        shareLocationWithContacts: json['shareLocationWithContacts'] as bool? ?? true,
        autoCallEmergencyServices: json['autoCallEmergencyServices'] as bool? ?? false,
        sendPeriodicCheckIns: json['sendPeriodicCheckIns'] as bool? ?? false,
        checkInIntervalMinutes: json['checkInIntervalMinutes'] as int? ?? 60,
        enableSosButton: json['enableSosButton'] as bool? ?? true,
        enableFallDetection: json['enableFallDetection'] as bool? ?? false,
        enableGeofenceAlerts: json['enableGeofenceAlerts'] as bool? ?? true,
        preferredHospital: json['preferredHospital'] as String?,
        preferredLanguage: json['preferredLanguage'] as String? ?? 'en',
        emergencyMessageTemplate: json['emergencyMessageTemplate'] as String?,
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updatedAt: (json['updatedAt'] as Timestamp).toDate(),
      );

  EmergencyPreferences copyWith({
    String? userId,
    bool? shareLocationWithContacts,
    bool? autoCallEmergencyServices,
    bool? sendPeriodicCheckIns,
    int? checkInIntervalMinutes,
    bool? enableSosButton,
    bool? enableFallDetection,
    bool? enableGeofenceAlerts,
    String? preferredHospital,
    String? preferredLanguage,
    String? emergencyMessageTemplate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EmergencyPreferences(
      userId: userId ?? this.userId,
      shareLocationWithContacts: shareLocationWithContacts ?? this.shareLocationWithContacts,
      autoCallEmergencyServices: autoCallEmergencyServices ?? this.autoCallEmergencyServices,
      sendPeriodicCheckIns: sendPeriodicCheckIns ?? this.sendPeriodicCheckIns,
      checkInIntervalMinutes: checkInIntervalMinutes ?? this.checkInIntervalMinutes,
      enableSosButton: enableSosButton ?? this.enableSosButton,
      enableFallDetection: enableFallDetection ?? this.enableFallDetection,
      enableGeofenceAlerts: enableGeofenceAlerts ?? this.enableGeofenceAlerts,
      preferredHospital: preferredHospital ?? this.preferredHospital,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      emergencyMessageTemplate: emergencyMessageTemplate ?? this.emergencyMessageTemplate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Repository for emergency contacts and medical info operations
class EmergencyContactsRepository {
  EmergencyContactsRepository._() {
    debugPrint('[EMERGENCY_CONTACTS_REPO] EmergencyContactsRepository: Constructor called');
  }

  static final EmergencyContactsRepository _instance = EmergencyContactsRepository._();
  static EmergencyContactsRepository get instance => _instance;

  final fs.FirebaseFirestore _firestore = fs.FirebaseFirestore.instance;

  /// Collection references
  fs.CollectionReference<Map<String, dynamic>> get _contactsCollection =>
      _firestore.collection('emergency_contacts');

  fs.CollectionReference<Map<String, dynamic>> get _medicalInfoCollection =>
      _firestore.collection('medical_info');

  fs.CollectionReference<Map<String, dynamic>> get _emergencyPrefsCollection =>
      _firestore.collection('emergency_preferences');

  // ==================== Emergency Contacts ====================

  /// Creates a new emergency contact
  Future<Result<EmergencyContact>> createContact(EmergencyContact contact) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] createContact: Creating contact ${contact.id} for user ${contact.userId}');
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

      final contact = EmergencyContact.fromJson(docSnapshot.data()!);
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
        message: 'Failed to get contact',
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
        message: 'Failed to update contact',
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
        message: 'Failed to delete contact',
        code: 'DELETE_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets all emergency contacts for a user
  Future<Result<List<EmergencyContact>>> getContacts(String userId) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getContacts: Fetching contacts for user $userId');
      final snapshot = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('priority')
          .orderBy('createdAt', descending: true)
          .get();

      final contacts = snapshot.docs
          .map((doc) => EmergencyContact.fromJson(doc.data()))
          .toList();

      debugPrint('[EMERGENCY_CONTACTS_REPO] getContacts: Fetched ${contacts.length} contacts');
      return Success(contacts);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getContacts: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] getContacts: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get contacts',
        code: 'GET_CONTACTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of emergency contacts for real-time updates
  Stream<List<EmergencyContact>> watchContacts(String userId) {
    return _contactsCollection
        .where('userId', isEqualTo: userId)
        .orderBy('priority')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => EmergencyContact.fromJson(doc.data()))
          .toList();
    });
  }

  /// Gets primary emergency contact
  Future<Result<EmergencyContact?>> getPrimaryContact(String userId) async {
    try {
      final snapshot = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .where('isPrimary', isEqualTo: true)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return Success(null);
      }

      final contact = EmergencyContact.fromJson(snapshot.docs.first.data());
      return Success(contact);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get primary contact',
        code: 'GET_PRIMARY_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Sets a contact as primary (unsets others)
  Future<Result<void>> setPrimaryContact(String userId, String contactId) async {
    try {
      final batch = _firestore.batch();

      // Unset all current primary contacts
      final currentPrimary = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .where('isPrimary', isEqualTo: true)
          .get();

      for (final doc in currentPrimary.docs) {
        batch.update(doc.reference, {'isPrimary': false, 'updatedAt': Timestamp.fromDate(DateTime.now())});
      }

      // Set new primary
      batch.update(_contactsCollection.doc(contactId), {
        'isPrimary': true,
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      });

      await batch.commit();
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to set primary contact',
        code: 'SET_PRIMARY_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets contacts that can receive alerts
  Future<Result<List<EmergencyContact>>> getAlertRecipients(String userId) async {
    try {
      final snapshot = await _contactsCollection
          .where('userId', isEqualTo: userId)
          .where('canReceiveAlerts', isEqualTo: true)
          .orderBy('priority')
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
        message: 'Failed to get alert recipients',
        code: 'GET_ALERT_RECIPIENTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ==================== Medical Info ====================

  /// Creates or updates medical info
  Future<Result<MedicalInfo>> saveMedicalInfo(MedicalInfo info) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] saveMedicalInfo: Saving medical info for user ${info.userId}');
      final docRef = _medicalInfoCollection.doc(info.userId);
      await docRef.set(info.toJson());
      debugPrint('[EMERGENCY_CONTACTS_REPO] saveMedicalInfo: Successfully saved medical info');
      return Success(info);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] saveMedicalInfo: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_CONTACTS_REPO] saveMedicalInfo: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to save medical info',
        code: 'SAVE_MEDICAL_INFO_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets medical info for a user
  Future<Result<MedicalInfo?>> getMedicalInfo(String userId) async {
    try {
      final docSnapshot = await _medicalInfoCollection.doc(userId).get();

      if (!docSnapshot.exists) {
        return Success(null);
      }

      final info = MedicalInfo.fromJson(docSnapshot.data()!);
      return Success(info);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get medical info',
        code: 'GET_MEDICAL_INFO_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of medical info for real-time updates
  Stream<MedicalInfo?> watchMedicalInfo(String userId) {
    return _medicalInfoCollection.doc(userId).snapshots().map((snapshot) {
      if (!snapshot.exists) return null;
      return MedicalInfo.fromJson(snapshot.data()!);
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

  // ==================== Emergency Preferences ====================

  /// Creates or updates emergency preferences
  Future<Result<EmergencyPreferences>> savePreferences(EmergencyPreferences prefs) async {
    try {
      debugPrint('[EMERGENCY_CONTACTS_REPO] savePreferences: Saving preferences for user ${prefs.userId}');
      final docRef = _emergencyPrefsCollection.doc(prefs.userId);
      await docRef.set(prefs.toJson());
      debugPrint('[EMERGENCY_CONTACTS_REPO] savePreferences: Successfully saved preferences');
      return Success(prefs);
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
        code: 'SAVE_PREFERENCES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets emergency preferences for a user
  Future<Result<EmergencyPreferences>> getPreferences(String userId) async {
    try {
      final docSnapshot = await _emergencyPrefsCollection.doc(userId).get();

      if (!docSnapshot.exists) {
        // Return defaults
        final prefs = EmergencyPreferences(
          userId: userId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await savePreferences(prefs);
        return Success(prefs);
      }

      final prefs = EmergencyPreferences.fromJson(docSnapshot.data()!);
      return Success(prefs);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get emergency preferences',
        code: 'GET_PREFERENCES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of emergency preferences for real-time updates
  Stream<EmergencyPreferences> watchPreferences(String userId) {
    return _emergencyPrefsCollection.doc(userId).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return EmergencyPreferences(
          userId: userId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }
      return EmergencyPreferences.fromJson(snapshot.data()!);
    });
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