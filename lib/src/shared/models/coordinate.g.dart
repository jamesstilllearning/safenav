// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LatLngCoordinate _$LatLngCoordinateFromJson(Map<String, dynamic> json) =>
    _LatLngCoordinate(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LatLngCoordinateToJson(_LatLngCoordinate instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
    };

_UtmCoordinate _$UtmCoordinateFromJson(Map<String, dynamic> json) =>
    _UtmCoordinate(
      easting: (json['easting'] as num).toDouble(),
      northing: (json['northing'] as num).toDouble(),
      zoneNumber: (json['zoneNumber'] as num).toInt(),
      zoneLetter: json['zoneLetter'] as String,
    );

Map<String, dynamic> _$UtmCoordinateToJson(_UtmCoordinate instance) =>
    <String, dynamic>{
      'easting': instance.easting,
      'northing': instance.northing,
      'zoneNumber': instance.zoneNumber,
      'zoneLetter': instance.zoneLetter,
    };

_LocalCartesianCoordinate _$LocalCartesianCoordinateFromJson(
  Map<String, dynamic> json,
) => _LocalCartesianCoordinate(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  floor: (json['floor'] as num?)?.toInt(),
);

Map<String, dynamic> _$LocalCartesianCoordinateToJson(
  _LocalCartesianCoordinate instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'floor': instance.floor,
};

_AffineTransform _$AffineTransformFromJson(Map<String, dynamic> json) =>
    _AffineTransform(
      a: (json['a'] as num).toDouble(),
      b: (json['b'] as num).toDouble(),
      c: (json['c'] as num).toDouble(),
      d: (json['d'] as num).toDouble(),
      e: (json['e'] as num).toDouble(),
      f: (json['f'] as num).toDouble(),
    );

Map<String, dynamic> _$AffineTransformToJson(_AffineTransform instance) =>
    <String, dynamic>{
      'a': instance.a,
      'b': instance.b,
      'c': instance.c,
      'd': instance.d,
      'e': instance.e,
      'f': instance.f,
    };

_ProjectiveTransform _$ProjectiveTransformFromJson(Map<String, dynamic> json) =>
    _ProjectiveTransform(
      m00: (json['m00'] as num).toDouble(),
      m01: (json['m01'] as num).toDouble(),
      m02: (json['m02'] as num).toDouble(),
      m10: (json['m10'] as num).toDouble(),
      m11: (json['m11'] as num).toDouble(),
      m12: (json['m12'] as num).toDouble(),
      m20: (json['m20'] as num).toDouble(),
      m21: (json['m21'] as num).toDouble(),
    );

Map<String, dynamic> _$ProjectiveTransformToJson(
  _ProjectiveTransform instance,
) => <String, dynamic>{
  'm00': instance.m00,
  'm01': instance.m01,
  'm02': instance.m02,
  'm10': instance.m10,
  'm11': instance.m11,
  'm12': instance.m12,
  'm20': instance.m20,
  'm21': instance.m21,
};

_CampusGeoreference _$CampusGeoreferenceFromJson(
  Map<String, dynamic> json,
) => _CampusGeoreference(
  campusId: json['campusId'] as String,
  campusName: json['campusName'] as String,
  wgs84Origin: LatLngCoordinate.fromJson(
    json['wgs84Origin'] as Map<String, dynamic>,
  ),
  utmOrigin: UtmCoordinate.fromJson(json['utmOrigin'] as Map<String, dynamic>),
  localOrigin: LocalCartesianCoordinate.fromJson(
    json['localOrigin'] as Map<String, dynamic>,
  ),
  wgs84ToLocal: json['wgs84ToLocal'] == null
      ? const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0)
      : AffineTransform.fromJson(json['wgs84ToLocal'] as Map<String, dynamic>),
  localToWgs84: json['localToWgs84'] == null
      ? const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0)
      : AffineTransform.fromJson(json['localToWgs84'] as Map<String, dynamic>),
  utmToLocal: json['utmToLocal'] == null
      ? const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0)
      : AffineTransform.fromJson(json['utmToLocal'] as Map<String, dynamic>),
  localToUtm: json['localToUtm'] == null
      ? const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0)
      : AffineTransform.fromJson(json['localToUtm'] as Map<String, dynamic>),
  projectiveWgs84ToLocal: json['projectiveWgs84ToLocal'] == null
      ? null
      : ProjectiveTransform.fromJson(
          json['projectiveWgs84ToLocal'] as Map<String, dynamic>,
        ),
  projectiveLocalToWgs84: json['projectiveLocalToWgs84'] == null
      ? null
      : ProjectiveTransform.fromJson(
          json['projectiveLocalToWgs84'] as Map<String, dynamic>,
        ),
  calibratedAt: DateTime.parse(json['calibratedAt'] as String),
  calibrationMethod: json['calibrationMethod'] as String?,
  groundControlPointsWgs84: (json['groundControlPointsWgs84'] as List<dynamic>?)
      ?.map((e) => LatLngCoordinate.fromJson(e as Map<String, dynamic>))
      .toList(),
  groundControlPointsLocal: (json['groundControlPointsLocal'] as List<dynamic>?)
      ?.map((e) => LocalCartesianCoordinate.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CampusGeoreferenceToJson(_CampusGeoreference instance) =>
    <String, dynamic>{
      'campusId': instance.campusId,
      'campusName': instance.campusName,
      'wgs84Origin': instance.wgs84Origin,
      'utmOrigin': instance.utmOrigin,
      'localOrigin': instance.localOrigin,
      'wgs84ToLocal': instance.wgs84ToLocal,
      'localToWgs84': instance.localToWgs84,
      'utmToLocal': instance.utmToLocal,
      'localToUtm': instance.localToUtm,
      'projectiveWgs84ToLocal': instance.projectiveWgs84ToLocal,
      'projectiveLocalToWgs84': instance.projectiveLocalToWgs84,
      'calibratedAt': instance.calibratedAt.toIso8601String(),
      'calibrationMethod': instance.calibrationMethod,
      'groundControlPointsWgs84': instance.groundControlPointsWgs84,
      'groundControlPointsLocal': instance.groundControlPointsLocal,
      'metadata': instance.metadata,
    };

_TransformSuccess _$TransformSuccessFromJson(Map<String, dynamic> json) =>
    _TransformSuccess(
      value: json['value'],
      accuracyMeters: (json['accuracyMeters'] as num?)?.toDouble(),
      method: json['method'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TransformSuccessToJson(_TransformSuccess instance) =>
    <String, dynamic>{
      'value': instance.value,
      'accuracyMeters': instance.accuracyMeters,
      'method': instance.method,
      'runtimeType': instance.$type,
    };

_TransformFailure _$TransformFailureFromJson(Map<String, dynamic> json) =>
    _TransformFailure(
      error: json['error'] as String,
      code: json['code'] as String?,
      details: json['details'] as Map<String, dynamic>?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$TransformFailureToJson(_TransformFailure instance) =>
    <String, dynamic>{
      'error': instance.error,
      'code': instance.code,
      'details': instance.details,
      'runtimeType': instance.$type,
    };

_TransformAccuracy _$TransformAccuracyFromJson(Map<String, dynamic> json) =>
    _TransformAccuracy(
      meanError: (json['meanError'] as num).toDouble(),
      rmse: (json['rmse'] as num).toDouble(),
      maxError: (json['maxError'] as num).toDouble(),
      pointCount: (json['pointCount'] as num).toInt(),
    );

Map<String, dynamic> _$TransformAccuracyToJson(_TransformAccuracy instance) =>
    <String, dynamic>{
      'meanError': instance.meanError,
      'rmse': instance.rmse,
      'maxError': instance.maxError,
      'pointCount': instance.pointCount,
    };
