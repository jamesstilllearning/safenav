/// SAFENAV CAVITE - Location Service
///
/// Handles GPS location tracking, permissions, and location-based utilities.
library;

import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../constants/app_constants.dart';
import '../errors/failures.dart';
import '../errors/result.dart';

/// Service for managing device location
class LocationService {
  LocationService._();

  static final LocationService _instance = LocationService._();
  static LocationService get instance => _instance;

  StreamSubscription<Position>? _positionStream;
  Position? _lastKnownPosition;
  bool _isListening = false;

  /// Current last known position
  Position? get lastKnownPosition => _lastKnownPosition;

  /// Whether location tracking is active
  bool get isListening => _isListening;

  /// Checks if location services are enabled on device
  Future<Result<bool>> isLocationServiceEnabled() async {
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      return Success(enabled);
    } catch (e) {
      return FailureResult(LocationFailure(
        message: AppConstants.errorGpsUnavailable,
        code: 'LOCATION_SERVICE_CHECK_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Checks and requests location permission
  Future<Result<LocationPermission>> checkAndRequestPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return FailureResult(PermissionFailure(
            message: AppConstants.errorLocationPermissionDenied,
            code: 'PERMISSION_DENIED',
          ));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return FailureResult(PermissionFailure(
          message: 'Location permissions are permanently denied. Please enable in app settings.',
          code: 'PERMISSION_DENIED_FOREVER',
        ));
      }

      return Success(permission);
    } catch (e) {
      return FailureResult(LocationFailure(
        message: 'Failed to check location permission',
        code: 'PERMISSION_CHECK_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets current position once
  Future<Result<Position>> getCurrentPosition({
    LocationAccuracy accuracy = LocationAccuracy.high,
    Duration? timeLimit,
  }) async {
    try {
      final permissionResult = await checkAndRequestPermission();
      if (permissionResult.isFailure) {
        return permissionResult as FailureResult<Position>;
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: accuracy,
          timeLimit: timeLimit ?? const Duration(seconds: 10),
          distanceFilter: 0,
        ),
      );

      _lastKnownPosition = position;
      return Success(position);
    } catch (e) {
      return FailureResult(LocationFailure(
        message: AppConstants.errorGpsUnavailable,
        code: 'GET_POSITION_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Starts listening to position updates
  Future<Result<void>> startPositionUpdates({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilter = 5, // meters
    Duration? timeInterval,
  }) async {
    if (_isListening) {
      return const Success(null);
    }

    try {
      final permissionResult = await checkAndRequestPermission();
      if (permissionResult.isFailure) {
        return permissionResult as FailureResult<void>;
      }

      _positionStream = Geolocator.getPositionStream(
        locationSettings: LocationSettings(
          accuracy: accuracy,
          distanceFilter: distanceFilter,
        ),
      ).listen(
        (position) {
          _lastKnownPosition = position;
        },
        onError: (error) {
          _isListening = false;
        },
      );

      _isListening = true;
      return const Success(null);
    } catch (e) {
      return FailureResult(LocationFailure(
        message: 'Failed to start location updates',
        code: 'START_UPDATES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stops listening to position updates
  Future<void> stopPositionUpdates() async {
    await _positionStream?.cancel();
    _positionStream = null;
    _isListening = false;
  }

  /// Gets address from coordinates (reverse geocoding)
  Future<Result<String>> getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isEmpty) {
        return FailureResult(LocationFailure(
          message: 'No address found for coordinates',
          code: 'NO_ADDRESS_FOUND',
        ));
      }

      final place = placemarks.first;
      final addressParts = <String>[];
      if (place.street?.isNotEmpty == true) addressParts.add(place.street!);
      if (place.subLocality?.isNotEmpty == true) addressParts.add(place.subLocality!);
      if (place.locality?.isNotEmpty == true) addressParts.add(place.locality!);
      if (place.administrativeArea?.isNotEmpty == true) addressParts.add(place.administrativeArea!);

      return Success(addressParts.join(', '));
    } catch (e) {
      return FailureResult(LocationFailure(
        message: 'Failed to get address from coordinates',
        code: 'REVERSE_GEOCODING_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets coordinates from address (forward geocoding)
  Future<Result<Position>> getCoordinatesFromAddress(String address) async {
    try {
      final locations = await locationFromAddress(address);
      if (locations.isEmpty) {
        return FailureResult(LocationFailure(
          message: 'No coordinates found for address',
          code: 'NO_COORDINATES_FOUND',
        ));
      }

      final location = locations.first;
      return Success(Position(
        latitude: location.latitude,
        longitude: location.longitude,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      ));
    } catch (e) {
      return FailureResult(LocationFailure(
        message: 'Failed to get coordinates from address',
        code: 'FORWARD_GEOCODING_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Calculates distance between two points in meters
  double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }

  /// Calculates bearing between two points in degrees
  double calculateBearing(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.bearingBetween(lat1, lon1, lat2, lon2);
  }

  /// Checks if GPS accuracy is sufficient for navigation
  bool isAccuracySufficient(Position position) {
    return position.accuracy <= AppConstants.gpsAccuracyThresholdMeters;
  }

  /// Disposes resources
  Future<void> dispose() async {
    await stopPositionUpdates();
    _lastKnownPosition = null;
  }
}