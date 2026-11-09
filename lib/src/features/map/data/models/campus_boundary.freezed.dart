// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus_boundary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CampusBoundary _$CampusBoundaryFromJson(Map<String, dynamic> json) {
  return _CampusBoundary.fromJson(json);
}

/// @nodoc
mixin _$CampusBoundary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  String get amenity => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String? get wikidata => throw _privateConstructorUsedError;
  int get osmRelationId => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get sourceDate => throw _privateConstructorUsedError;
  String get verificationStatus => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<LatLng> get polygon => throw _privateConstructorUsedError;
  LatLng? get centroid => throw _privateConstructorUsedError;
  double? get areaSqMeters => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalTags =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CampusBoundaryCopyWith<CampusBoundary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampusBoundaryCopyWith<$Res> {
  factory $CampusBoundaryCopyWith(
          CampusBoundary value, $Res Function(CampusBoundary) then) =
      _$CampusBoundaryCopyWithImpl<$Res, CampusBoundary>;
  @useResult
  $Res call(
      {String id,
      String name,
      String shortName,
      String amenity,
      String city,
      String street,
      String? wikidata,
      int osmRelationId,
      String source,
      String sourceDate,
      String verificationStatus,
      String description,
      List<LatLng> polygon,
      LatLng? centroid,
      double? areaSqMeters,
      Map<String, dynamic>? additionalTags});
}

/// @nodoc
class _$CampusBoundaryCopyWithImpl<$Res, $Val extends CampusBoundary>
    implements $CampusBoundaryCopyWith<$Res> {
  _$CampusBoundaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? amenity = null,
    Object? city = null,
    Object? street = null,
    Object? wikidata = freezed,
    Object? osmRelationId = null,
    Object? source = null,
    Object? sourceDate = null,
    Object? verificationStatus = null,
    Object? description = null,
    Object? polygon = null,
    Object? centroid = freezed,
    Object? areaSqMeters = freezed,
    Object? additionalTags = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      amenity: null == amenity
          ? _value.amenity
          : amenity // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      osmRelationId: null == osmRelationId
          ? _value.osmRelationId
          : osmRelationId // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sourceDate: null == sourceDate
          ? _value.sourceDate
          : sourceDate // ignore: cast_nullable_to_non_nullable
              as String,
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      polygon: null == polygon
          ? _value.polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      centroid: freezed == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      areaSqMeters: freezed == areaSqMeters
          ? _value.areaSqMeters
          : areaSqMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalTags: freezed == additionalTags
          ? _value.additionalTags
          : additionalTags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CampusBoundaryImplCopyWith<$Res>
    implements $CampusBoundaryCopyWith<$Res> {
  factory _$$CampusBoundaryImplCopyWith(_$CampusBoundaryImpl value,
          $Res Function(_$CampusBoundaryImpl) then) =
      __$$CampusBoundaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String shortName,
      String amenity,
      String city,
      String street,
      String? wikidata,
      int osmRelationId,
      String source,
      String sourceDate,
      String verificationStatus,
      String description,
      List<LatLng> polygon,
      LatLng? centroid,
      double? areaSqMeters,
      Map<String, dynamic>? additionalTags});
}

/// @nodoc
class __$$CampusBoundaryImplCopyWithImpl<$Res>
    extends _$CampusBoundaryCopyWithImpl<$Res, _$CampusBoundaryImpl>
    implements _$$CampusBoundaryImplCopyWith<$Res> {
  __$$CampusBoundaryImplCopyWithImpl(
      _$CampusBoundaryImpl _value, $Res Function(_$CampusBoundaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? amenity = null,
    Object? city = null,
    Object? street = null,
    Object? wikidata = freezed,
    Object? osmRelationId = null,
    Object? source = null,
    Object? sourceDate = null,
    Object? verificationStatus = null,
    Object? description = null,
    Object? polygon = null,
    Object? centroid = freezed,
    Object? areaSqMeters = freezed,
    Object? additionalTags = freezed,
  }) {
    return _then(_$CampusBoundaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      amenity: null == amenity
          ? _value.amenity
          : amenity // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      osmRelationId: null == osmRelationId
          ? _value.osmRelationId
          : osmRelationId // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sourceDate: null == sourceDate
          ? _value.sourceDate
          : sourceDate // ignore: cast_nullable_to_non_nullable
              as String,
      verificationStatus: null == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      polygon: null == polygon
          ? _value._polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      centroid: freezed == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      areaSqMeters: freezed == areaSqMeters
          ? _value.areaSqMeters
          : areaSqMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalTags: freezed == additionalTags
          ? _value._additionalTags
          : additionalTags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CampusBoundaryImpl extends _CampusBoundary {
  const _$CampusBoundaryImpl(
      {required this.id,
      required this.name,
      required this.shortName,
      required this.amenity,
      required this.city,
      required this.street,
      this.wikidata,
      required this.osmRelationId,
      required this.source,
      required this.sourceDate,
      required this.verificationStatus,
      required this.description,
      required final List<LatLng> polygon,
      this.centroid,
      this.areaSqMeters,
      final Map<String, dynamic>? additionalTags})
      : _polygon = polygon,
        _additionalTags = additionalTags,
        super._();

  factory _$CampusBoundaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CampusBoundaryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String shortName;
  @override
  final String amenity;
  @override
  final String city;
  @override
  final String street;
  @override
  final String? wikidata;
  @override
  final int osmRelationId;
  @override
  final String source;
  @override
  final String sourceDate;
  @override
  final String verificationStatus;
  @override
  final String description;
  final List<LatLng> _polygon;
  @override
  List<LatLng> get polygon {
    if (_polygon is EqualUnmodifiableListView) return _polygon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygon);
  }

  @override
  final LatLng? centroid;
  @override
  final double? areaSqMeters;
  final Map<String, dynamic>? _additionalTags;
  @override
  Map<String, dynamic>? get additionalTags {
    final value = _additionalTags;
    if (value == null) return null;
    if (_additionalTags is EqualUnmodifiableMapView) return _additionalTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CampusBoundary(id: $id, name: $name, shortName: $shortName, amenity: $amenity, city: $city, street: $street, wikidata: $wikidata, osmRelationId: $osmRelationId, source: $source, sourceDate: $sourceDate, verificationStatus: $verificationStatus, description: $description, polygon: $polygon, centroid: $centroid, areaSqMeters: $areaSqMeters, additionalTags: $additionalTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampusBoundaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.amenity, amenity) || other.amenity == amenity) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata) &&
            (identical(other.osmRelationId, osmRelationId) ||
                other.osmRelationId == osmRelationId) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceDate, sourceDate) ||
                other.sourceDate == sourceDate) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._polygon, _polygon) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid) &&
            (identical(other.areaSqMeters, areaSqMeters) ||
                other.areaSqMeters == areaSqMeters) &&
            const DeepCollectionEquality()
                .equals(other._additionalTags, _additionalTags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      shortName,
      amenity,
      city,
      street,
      wikidata,
      osmRelationId,
      source,
      sourceDate,
      verificationStatus,
      description,
      const DeepCollectionEquality().hash(_polygon),
      centroid,
      areaSqMeters,
      const DeepCollectionEquality().hash(_additionalTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CampusBoundaryImplCopyWith<_$CampusBoundaryImpl> get copyWith =>
      __$$CampusBoundaryImplCopyWithImpl<_$CampusBoundaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CampusBoundaryImplToJson(
      this,
    );
  }
}

abstract class _CampusBoundary extends CampusBoundary {
  const factory _CampusBoundary(
      {required final String id,
      required final String name,
      required final String shortName,
      required final String amenity,
      required final String city,
      required final String street,
      final String? wikidata,
      required final int osmRelationId,
      required final String source,
      required final String sourceDate,
      required final String verificationStatus,
      required final String description,
      required final List<LatLng> polygon,
      final LatLng? centroid,
      final double? areaSqMeters,
      final Map<String, dynamic>? additionalTags}) = _$CampusBoundaryImpl;
  const _CampusBoundary._() : super._();

  factory _CampusBoundary.fromJson(Map<String, dynamic> json) =
      _$CampusBoundaryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get shortName;
  @override
  String get amenity;
  @override
  String get city;
  @override
  String get street;
  @override
  String? get wikidata;
  @override
  int get osmRelationId;
  @override
  String get source;
  @override
  String get sourceDate;
  @override
  String get verificationStatus;
  @override
  String get description;
  @override
  List<LatLng> get polygon;
  @override
  LatLng? get centroid;
  @override
  double? get areaSqMeters;
  @override
  Map<String, dynamic>? get additionalTags;
  @override
  @JsonKey(ignore: true)
  _$$CampusBoundaryImplCopyWith<_$CampusBoundaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
