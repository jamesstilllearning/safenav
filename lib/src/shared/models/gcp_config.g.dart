// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gcp_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroundControlPoint _$GroundControlPointFromJson(Map<String, dynamic> json) =>
    _GroundControlPoint(
      id: json['id'] as String,
      label: json['label'] as String,
      imageCoordinate: GcpImageCoordinate.fromJson(
        json['imageCoordinate'] as Map<String, dynamic>,
      ),
      wgs84Coordinate: LatLngCoordinate.fromJson(
        json['wgs84Coordinate'] as Map<String, dynamic>,
      ),
      utmCoordinate: UtmCoordinate.fromJson(
        json['utmCoordinate'] as Map<String, dynamic>,
      ),
      localCoordinate: json['localCoordinate'] == null
          ? null
          : LocalCartesianCoordinate.fromJson(
              json['localCoordinate'] as Map<String, dynamic>,
            ),
      grade:
          $enumDecodeNullable(_$GcpGradeEnumMap, json['grade']) ??
          GcpGrade.unverified,
      source:
          $enumDecodeNullable(_$GcpSourceEnumMap, json['source']) ??
          GcpSource.manualSurvey,
      collectedAt: json['collectedAt'] == null
          ? null
          : DateTime.parse(json['collectedAt'] as String),
      collectedBy: json['collectedBy'] as String?,
      accuracyMeters: (json['accuracyMeters'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$GroundControlPointToJson(_GroundControlPoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'imageCoordinate': instance.imageCoordinate,
      'wgs84Coordinate': instance.wgs84Coordinate,
      'utmCoordinate': instance.utmCoordinate,
      'localCoordinate': instance.localCoordinate,
      'grade': _$GcpGradeEnumMap[instance.grade]!,
      'source': _$GcpSourceEnumMap[instance.source]!,
      'collectedAt': instance.collectedAt?.toIso8601String(),
      'collectedBy': instance.collectedBy,
      'accuracyMeters': instance.accuracyMeters,
      'notes': instance.notes,
      'metadata': instance.metadata,
    };

const _$GcpGradeEnumMap = {
  GcpGrade.survey: 'survey',
  GcpGrade.high: 'high',
  GcpGrade.standard: 'standard',
  GcpGrade.approximate: 'approximate',
  GcpGrade.unverified: 'unverified',
};

const _$GcpSourceEnumMap = {
  GcpSource.survey: 'survey',
  GcpSource.manualSurvey: 'manual_survey',
  GcpSource.rtk: 'rtk',
  GcpSource.georeferencedImage: 'georeferenced_image',
  GcpSource.gisExtraction: 'gis_extraction',
  GcpSource.manualDigitization: 'manual_digitization',
};

_GcpImageCoordinate _$GcpImageCoordinateFromJson(Map<String, dynamic> json) =>
    _GcpImageCoordinate(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      coordinateSystem:
          $enumDecodeNullable(
            _$GcpCoordinateSystemEnumMap,
            json['coordinateSystem'],
          ) ??
          GcpCoordinateSystem.normalized,
      imageWidth: (json['imageWidth'] as num?)?.toInt(),
      imageHeight: (json['imageHeight'] as num?)?.toInt(),
      floor: (json['floor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GcpImageCoordinateToJson(
  _GcpImageCoordinate instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'coordinateSystem': _$GcpCoordinateSystemEnumMap[instance.coordinateSystem]!,
  'imageWidth': instance.imageWidth,
  'imageHeight': instance.imageHeight,
  'floor': instance.floor,
};

const _$GcpCoordinateSystemEnumMap = {
  GcpCoordinateSystem.normalized: 'normalized',
  GcpCoordinateSystem.pixels: 'pixels',
  GcpCoordinateSystem.localMeters: 'local_meters',
};

_GcpConfig _$GcpConfigFromJson(Map<String, dynamic> json) => _GcpConfig(
  campusId: json['campusId'] as String,
  campusName: json['campusName'] as String,
  targetCrs:
      $enumDecodeNullable(
        _$CoordinateReferenceSystemEnumMap,
        json['targetCrs'],
      ) ??
      CoordinateReferenceSystem.utm51n,
  campusOriginWgs84: LatLngCoordinate.fromJson(
    json['campusOriginWgs84'] as Map<String, dynamic>,
  ),
  campusOriginUtm: UtmCoordinate.fromJson(
    json['campusOriginUtm'] as Map<String, dynamic>,
  ),
  groundControlPoints:
      (json['groundControlPoints'] as List<dynamic>?)
          ?.map((e) => GroundControlPoint.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  imageReference: json['imageReference'] == null
      ? null
      : GcpImageReference.fromJson(
          json['imageReference'] as Map<String, dynamic>,
        ),
  calibrationMethod:
      $enumDecodeNullable(
        _$CalibrationMethodEnumMap,
        json['calibrationMethod'],
      ) ??
      CalibrationMethod.affine,
  affineWgs84ToLocal: json['affineWgs84ToLocal'] == null
      ? null
      : AffineTransform.fromJson(
          json['affineWgs84ToLocal'] as Map<String, dynamic>,
        ),
  affineLocalToWgs84: json['affineLocalToWgs84'] == null
      ? null
      : AffineTransform.fromJson(
          json['affineLocalToWgs84'] as Map<String, dynamic>,
        ),
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
  accuracy: json['accuracy'] == null
      ? null
      : TransformAccuracy.fromJson(json['accuracy'] as Map<String, dynamic>),
  version: (json['version'] as num?)?.toInt() ?? 1,
  calibratedAt: json['calibratedAt'] == null
      ? null
      : DateTime.parse(json['calibratedAt'] as String),
  calibratedBy: json['calibratedBy'] as String?,
  notes: json['notes'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$GcpConfigToJson(
  _GcpConfig instance,
) => <String, dynamic>{
  'campusId': instance.campusId,
  'campusName': instance.campusName,
  'targetCrs': _$CoordinateReferenceSystemEnumMap[instance.targetCrs]!,
  'campusOriginWgs84': instance.campusOriginWgs84,
  'campusOriginUtm': instance.campusOriginUtm,
  'groundControlPoints': instance.groundControlPoints,
  'imageReference': instance.imageReference,
  'calibrationMethod': _$CalibrationMethodEnumMap[instance.calibrationMethod]!,
  'affineWgs84ToLocal': instance.affineWgs84ToLocal,
  'affineLocalToWgs84': instance.affineLocalToWgs84,
  'projectiveWgs84ToLocal': instance.projectiveWgs84ToLocal,
  'projectiveLocalToWgs84': instance.projectiveLocalToWgs84,
  'accuracy': instance.accuracy,
  'version': instance.version,
  'calibratedAt': instance.calibratedAt?.toIso8601String(),
  'calibratedBy': instance.calibratedBy,
  'notes': instance.notes,
  'metadata': instance.metadata,
};

const _$CoordinateReferenceSystemEnumMap = {
  CoordinateReferenceSystem.wgs84: 'wgs84',
  CoordinateReferenceSystem.utm51n: 'utm51n',
  CoordinateReferenceSystem.localCartesian: 'local_cartesian',
};

const _$CalibrationMethodEnumMap = {
  CalibrationMethod.similarity: 'similarity',
  CalibrationMethod.affine: 'affine',
  CalibrationMethod.projective: 'projective',
  CalibrationMethod.affineLstsq: 'affine_lstsq',
  CalibrationMethod.projectiveLstsq: 'projective_lstsq',
};

_GcpImageReference _$GcpImageReferenceFromJson(Map<String, dynamic> json) =>
    _GcpImageReference(
      imagePath: json['imagePath'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      format: json['format'] as String,
      description: json['description'] as String?,
      source: json['source'] as String?,
      imageDate: json['imageDate'] == null
          ? null
          : DateTime.parse(json['imageDate'] as String),
      coordinateSystem:
          $enumDecodeNullable(
            _$GcpCoordinateSystemEnumMap,
            json['coordinateSystem'],
          ) ??
          GcpCoordinateSystem.pixels,
    );

Map<String, dynamic> _$GcpImageReferenceToJson(
  _GcpImageReference instance,
) => <String, dynamic>{
  'imagePath': instance.imagePath,
  'width': instance.width,
  'height': instance.height,
  'format': instance.format,
  'description': instance.description,
  'source': instance.source,
  'imageDate': instance.imageDate?.toIso8601String(),
  'coordinateSystem': _$GcpCoordinateSystemEnumMap[instance.coordinateSystem]!,
};

_GcpEnvironmentConfig _$GcpEnvironmentConfigFromJson(
  Map<String, dynamic> json,
) => _GcpEnvironmentConfig(
  environment: json['environment'] as String,
  gcpConfig: GcpConfig.fromJson(json['gcpConfig'] as Map<String, dynamic>),
  useMockGps: json['useMockGps'] as bool? ?? false,
  mockGpsLocation: json['mockGpsLocation'] == null
      ? null
      : LatLngCoordinate.fromJson(
          json['mockGpsLocation'] as Map<String, dynamic>,
        ),
  debugTransforms: json['debugTransforms'] as bool? ?? false,
);

Map<String, dynamic> _$GcpEnvironmentConfigToJson(
  _GcpEnvironmentConfig instance,
) => <String, dynamic>{
  'environment': instance.environment,
  'gcpConfig': instance.gcpConfig,
  'useMockGps': instance.useMockGps,
  'mockGpsLocation': instance.mockGpsLocation,
  'debugTransforms': instance.debugTransforms,
};
