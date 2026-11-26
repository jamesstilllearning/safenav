/// SAFENAV CAVITE - Emergency Providers
///
/// Riverpod providers for emergency state management.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/emergency_report.dart';
import '../../data/repositories/emergency_repository.dart';
import '../../../../shared/models/user.dart';
import '../../../../core/services/location_service.dart';

part 'emergency_providers.freezed.dart';

/// Emergency repository provider
final emergencyRepositoryProvider = Provider<EmergencyRepository>((ref) => EmergencyRepository.instance);

/// Location service provider
final locationServiceProvider = Provider<LocationService>((ref) => LocationService.instance);

/// Current user ID provider - returns null since authentication has been removed
final currentUserIdProvider = Provider<String?>((ref) => null);

/// Current user name provider - returns null since authentication has been removed
final currentUserNameProvider = Provider<String?>((ref) => null);

/// Current user phone provider - returns null since authentication has been removed
final currentUserPhoneProvider = Provider<String?>((ref) => null);

/// Current user provider - returns null since authentication has been removed.
/// Kept as a null-returning provider so that dependent screens (alerts, profile)
/// can still reference it without breaking.
final currentUserProvider = Provider<User?>((ref) => null);

/// Current emergency location provider - gets GPS location when needed
final currentEmergencyLocationProvider = FutureProvider<EmergencyLocation?>((ref) async {
  final repository = ref.watch(emergencyRepositoryProvider);
  final result = await repository.getCurrentEmergencyLocation();
  return result.fold(
    (failure) => null,
    (location) => location,
  );
});

/// Active emergency report for current user
final activeEmergencyReportProvider = StreamProvider<EmergencyReport?>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) return const Stream.empty();

  final repository = ref.watch(emergencyRepositoryProvider);
  return repository.watchUserReports(userId, limit: 1).map((reports) {
    if (reports.isEmpty) return null;
    final report = reports.first;
    if (!report.isActive) return null;
    return report;
  });
});

/// Campus emergency contacts provider (from Firestore)
final campusEmergencyContactsProvider = FutureProvider<List<CampusEmergencyContact>>((ref) async {
  final repository = ref.watch(emergencyRepositoryProvider);
  final result = await repository.getCampusEmergencyContacts();
  return result.fold(
    (failure) => [],
    (contacts) => contacts,
  );
});

/// Stream of campus emergency contacts
final campusEmergencyContactsStreamProvider = StreamProvider<List<CampusEmergencyContact>>((ref) {
  final repository = ref.watch(emergencyRepositoryProvider);
  return repository.watchCampusEmergencyContacts();
});

/// Nearest assembly point provider
final nearestAssemblyPointProvider = FutureProvider<AssemblyPoint?>((ref) async {
  final locationResult = await ref.watch(currentEmergencyLocationProvider.future);
  if (locationResult == null) return null;

  final repository = ref.watch(emergencyRepositoryProvider);
  final result = await repository.getNearestAssemblyPoint(locationResult.latLng);
  return result.fold(
    (failure) => null,
    (point) => point,
  );
});

/// Nearest evacuation route provider
final nearestEvacuationRouteProvider = FutureProvider<EvacuationRouteSummary?>((ref) async {
  final locationResult = await ref.watch(currentEmergencyLocationProvider.future);
  if (locationResult == null) return null;

  final repository = ref.watch(emergencyRepositoryProvider);
  final result = await repository.getNearestEvacuationRoute(locationResult.latLng);
  return result.fold(
    (failure) => null,
    (route) => route,
  );
});

/// SOS activation state provider
final sosActivationStateProvider = StateProvider<SosActivationState>((ref) => SosActivationState.idle());

/// SOS activation state enum
@freezed
abstract class SosActivationState with _$SosActivationState {
  const factory SosActivationState.idle() = _Idle;
  const factory SosActivationState.confirming({required int holdProgress}) = _Confirming;
  const factory SosActivationState.gettingLocation() = _GettingLocation;
  const factory SosActivationState.creatingReport() = _CreatingReport;
  const factory SosActivationState.reportCreated({required EmergencyReport report}) = _ReportCreated;
  const factory SosActivationState.error({required String message}) = _Error;
}

extension SosActivationStateX on SosActivationState {
  bool get isIdle => this is _Idle;
  bool get isConfirming => this is _Confirming;
  bool get isGettingLocation => this is _GettingLocation;
  bool get isCreatingReport => this is _CreatingReport;
  bool get isReportCreated => this is _ReportCreated;
  bool get isError => this is _Error;

  EmergencyReport? get report => this is _ReportCreated ? (this as _ReportCreated).report : null;
  String? get errorMessage => this is _Error ? (this as _Error).message : null;
  int get holdProgress => this is _Confirming ? (this as _Confirming).holdProgress : 0;
}

/// Emergency status view state (for the full-screen status screen)
@freezed
abstract class EmergencyStatusViewState with _$EmergencyStatusViewState {
  const factory EmergencyStatusViewState({
    required EmergencyReport report,
    required AssemblyPoint? nearestAssemblyPoint,
    required EvacuationRouteSummary? evacuationRoute,
    @Default(false) bool showCancelButton,
  }) = _EmergencyStatusViewState;
}

/// Provider for emergency status view state
final emergencyStatusViewStateProvider = StateProvider<EmergencyStatusViewState?>((ref) => null);

/// Emergency Report Notifier - manages creating and updating emergency reports
final emergencyReportNotifierProvider = StateNotifierProvider<EmergencyReportNotifier, AsyncValue<EmergencyReport?>>((ref) {
  return EmergencyReportNotifier(ref.watch(emergencyRepositoryProvider), ref.watch(currentUserIdProvider));
});

/// Emergency Action Notifier - manages SOS UI state (hold progress, confirmation dialog, etc.)
final emergencyActionNotifierProvider = StateNotifierProvider<EmergencyActionNotifier, EmergencyActionState>((ref) {
  return EmergencyActionNotifier();
});

/// Stream provider for watching a specific emergency report by ID
final emergencyReportProvider = StreamProvider.family<EmergencyReport?, String>((ref, reportId) {
  final repository = ref.watch(emergencyRepositoryProvider);
  return repository.watchReport(reportId);
});

/// Active emergency report for current user (family provider)
final activeUserEmergencyReportProvider = StreamProvider.family<EmergencyReport?, String>((ref, userId) {
  if (userId.isEmpty) return const Stream.empty();
  final repository = ref.watch(emergencyRepositoryProvider);
  return repository.watchUserReports(userId, limit: 1).map((reports) {
    if (reports.isEmpty) return null;
    final report = reports.first;
    if (!report.isActive) return null;
    return report;
  });
});

/// Alias for campus emergency contacts future provider
final campusEmergencyContactsFutureProvider = campusEmergencyContactsProvider;

/// Emergency Report Notifier class
class EmergencyReportNotifier extends StateNotifier<AsyncValue<EmergencyReport?>> {
  final EmergencyRepository _repository;
  final String? _userId;

  EmergencyReportNotifier(this._repository, this._userId) : super(const AsyncValue.data(null));

  /// Creates a new emergency report
  Future<EmergencyReport?> createEmergencyReport({
    required EmergencyType type,
    String? description,
  }) async {
    final userId = _userId;
    if (userId == null) {
      state = AsyncValue.error('User not authenticated', StackTrace.current);
      return null;
    }

    state = const AsyncValue.loading();

    try {
      // Get current location
      final locationResult = await _repository.getCurrentEmergencyLocation();
      final location = locationResult.fold(
        (failure) => null,
        (loc) => loc,
      );

      if (location == null) {
        state = AsyncValue.error('Could not get location', StackTrace.current);
        return null;
      }
      
      final userName = 'Current User';
      final userPhone = '';

      // Create report
      final report = EmergencyReport.create(
        id: 'emergency_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        userName: userName,
        userPhone: userPhone,
        userLocation: location,
        type: type,
        description: description,
      );

      final result = await _repository.createReport(report);

      final newReport = result.fold(
        (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
          return null;
        },
        (report) => report,
      );

      if (newReport != null) {
        state = AsyncValue.data(newReport);
      }

      return newReport;
    } catch (e, st) {
      state = AsyncValue.error(e.toString(), st);
      return null;
    }
  }

  /// Updates the status of an emergency report
  Future<void> updateReportStatus(
    String reportId,
    EmergencyStatus status, {
    ResponderInfo? responder,
    String? note,
  }) async {
    final current = state.value;
    if (current == null || current.id != reportId) return;

    state = const AsyncValue.loading();

    final result = await _repository.updateReportStatus(reportId, status, responder: responder, note: note);

    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (updatedReport) => state = AsyncValue.data(updatedReport),
    );
  }

  /// Adds a note to the report
  Future<void> addNote(String reportId, String note) async {
    final current = state.value;
    if (current == null || current.id != reportId) return;

    final updatedReport = current.addNote(note);
    final result = await _repository.updateReport(updatedReport);

    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (updatedReport) => state = AsyncValue.data(updatedReport),
    );
  }
}

/// Emergency Action State for SOS UI
@freezed
abstract class EmergencyActionState with _$EmergencyActionState {
  const factory EmergencyActionState({
    @Default(false) bool isActivatingSos,
    @Default(0) int holdProgress,
    @Default(false) bool showConfirmation,
    EmergencyType? selectedType,
  }) = _EmergencyActionState;

  const EmergencyActionState._();

  bool get isIdle => !isActivatingSos && holdProgress == 0 && !showConfirmation;
}

/// Emergency Action Notifier - manages SOS UI state
class EmergencyActionNotifier extends StateNotifier<EmergencyActionState> {
  EmergencyActionNotifier() : super(const EmergencyActionState());

  void setHoldProgress(int progress) {
    state = state.copyWith(holdProgress: progress.clamp(0, 100));
  }

  void setSelectedType(EmergencyType type) {
    state = state.copyWith(selectedType: type);
  }

  void showConfirmationDialog() {
    state = state.copyWith(showConfirmation: true, holdProgress: 100);
  }

  void hideConfirmationDialog() {
    state = state.copyWith(showConfirmation: false, holdProgress: 0, selectedType: null);
  }

  void setActivating(bool activating) {
    state = state.copyWith(isActivatingSos: activating);
  }

  void reset() {
    state = const EmergencyActionState();
  }
}