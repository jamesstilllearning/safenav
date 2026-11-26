/// SAFENAV CAVITE - Campus Map Parser Models
///
/// Additional models for the campus map parser service.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import 'campus_room.dart';

part 'campus_map_parser_models.freezed.dart';
part 'campus_map_parser_models.g.dart';

/// Reference points for coordinate transformation
/// These map normalized image coordinates (0-1) to real-world LatLng
@freezed
abstract class CampusReferencePoints with _$CampusReferencePoints {
  const CampusReferencePoints._();

  const factory CampusReferencePoints({
    required double topLeftLat,
    required double topLeftLng,
    required double topRightLat,
    required double topRightLng,
    required double bottomLeftLat,
    required double bottomLeftLng,
    required double bottomRightLat,
    required double bottomRightLng,
    required double imageWidth,
    required double imageHeight,
    @Default('EARIST Cavite Campus Map') String source,
    DateTime? calibratedAt,
  }) = _CampusReferencePoints;

  factory CampusReferencePoints.fromJson(Map<String, dynamic> json) =>
      _$CampusReferencePointsFromJson(json);

  /// Get top-left as LatLng
  LatLng get topLeft => LatLng(topLeftLat, topLeftLng);

  /// Get top-right as LatLng
  LatLng get topRight => LatLng(topRightLat, topRightLng);

  /// Get bottom-left as LatLng
  LatLng get bottomLeft => LatLng(bottomLeftLat, bottomLeftLng);

  /// Get bottom-right as LatLng
  LatLng get bottomRight => LatLng(bottomRightLat, bottomRightLng);
}

/// Search filter for campus rooms
@freezed
abstract class RoomSearchFilter with _$RoomSearchFilter {
  const RoomSearchFilter._();

  const factory RoomSearchFilter({
    String? query,
    String? buildingId,
    String? floorId,
    @RoomCategoryConverter() RoomCategory? category,
    @DataConfidenceConverter() DataConfidence? minConfidence,
    bool? navigableOnly,
    bool? facilityOnly,
  }) = _RoomSearchFilter;

  factory RoomSearchFilter.fromJson(Map<String, dynamic> json) =>
      _$RoomSearchFilterFromJson(json);
}

/// Search result with pagination
@freezed
abstract class RoomSearchResult with _$RoomSearchResult {
  const RoomSearchResult._();

  const factory RoomSearchResult({
    required List<CampusRoom> rooms,
    required int totalCount,
    required RoomSearchFilter filter,
    int? page,
    int? pageSize,
  }) = _RoomSearchResult;

  factory RoomSearchResult.fromJson(Map<String, dynamic> json) =>
      _$RoomSearchResultFromJson(json);
}

