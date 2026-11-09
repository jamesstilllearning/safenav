// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus_boundary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampusBoundary {
  String get id;
  String get name;
  String get shortName;
  String get amenity;
  String get city;
  String get street;
  String? get wikidata;
  int get osmRelationId;
  String get source;
  String get sourceDate;
  String get verificationStatus;
  String get description;
  List<LatLng> get polygon;
  LatLng? get centroid;
  double? get areaSqMeters;
  Map<String, dynamic>? get additionalTags;

  /// Create a copy of CampusBoundary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CampusBoundaryCopyWith<CampusBoundary> get copyWith =>
      _$CampusBoundaryCopyWithImpl<CampusBoundary>(
          this as CampusBoundary, _$identity);

  /// Serializes this CampusBoundary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as CampusBoundary;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CampusBoundary &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.shortName, _this.shortName) ||
                other.shortName == _this.shortName) &&
            (identical(other.amenity, _this.amenity) ||
                other.amenity == _this.amenity) &&
            (identical(other.city, _this.city) || other.city == _this.city) &&
            (identical(other.street, _this.street) ||
                other.street == _this.street) &&
            (identical(other.wikidata, _this.wikidata) ||
                other.wikidata == _this.wikidata) &&
            (identical(other.osmRelationId, _this.osmRelationId) ||
                other.osmRelationId == _this.osmRelationId) &&
            (identical(other.source, _this.source) ||
                other.source == _this.source) &&
            (identical(other.sourceDate, _this.sourceDate) ||
                other.sourceDate == _this.sourceDate) &&
            (identical(other.verificationStatus, _this.verificationStatus) ||
                other.verificationStatus == _this.verificationStatus) &&
            (identical(other.description, _this.description) ||
                other.description == _this.description) &&
            const DeepCollectionEquality()
                .equals(other.polygon, _this.polygon) &&
            (identical(other.centroid, _this.centroid) ||
                other.centroid == _this.centroid) &&
            (identical(other.areaSqMeters, _this.areaSqMeters) ||
                other.areaSqMeters == _this.areaSqMeters) &&
            const DeepCollectionEquality()
                .equals(other.additionalTags, _this.additionalTags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as CampusBoundary;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.shortName,
        _this.amenity,
        _this.city,
        _this.street,
        _this.wikidata,
        _this.osmRelationId,
        _this.source,
        _this.sourceDate,
        _this.verificationStatus,
        _this.description,
        const DeepCollectionEquality().hash(_this.polygon),
        _this.centroid,
        _this.areaSqMeters,
        const DeepCollectionEquality().hash(_this.additionalTags));
  }

  @override
  String toString() {
    final _this = this as CampusBoundary;
    return 'CampusBoundary(id: ${_this.id}, name: ${_this.name}, shortName: ${_this.shortName}, amenity: ${_this.amenity}, city: ${_this.city}, street: ${_this.street}, wikidata: ${_this.wikidata}, osmRelationId: ${_this.osmRelationId}, source: ${_this.source}, sourceDate: ${_this.sourceDate}, verificationStatus: ${_this.verificationStatus}, description: ${_this.description}, polygon: ${_this.polygon}, centroid: ${_this.centroid}, areaSqMeters: ${_this.areaSqMeters}, additionalTags: ${_this.additionalTags})';
  }
}

/// @nodoc
abstract mixin class $CampusBoundaryCopyWith<$Res> {
  factory $CampusBoundaryCopyWith(
          CampusBoundary value, $Res Function(CampusBoundary) _then) =
      _$CampusBoundaryCopyWithImpl;
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
class _$CampusBoundaryCopyWithImpl<$Res>
    implements $CampusBoundaryCopyWith<$Res> {
  _$CampusBoundaryCopyWithImpl(this._self, this._then);

  final CampusBoundary _self;
  final $Res Function(CampusBoundary) _then;

  /// Create a copy of CampusBoundary
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(CampusBoundary(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      amenity: null == amenity
          ? _self.amenity
          : amenity // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _self.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      osmRelationId: null == osmRelationId
          ? _self.osmRelationId
          : osmRelationId // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sourceDate: null == sourceDate
          ? _self.sourceDate
          : sourceDate // ignore: cast_nullable_to_non_nullable
              as String,
      verificationStatus: null == verificationStatus
          ? _self.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      polygon: null == polygon
          ? _self.polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      centroid: freezed == centroid
          ? _self.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      areaSqMeters: freezed == areaSqMeters
          ? _self.areaSqMeters
          : areaSqMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalTags: freezed == additionalTags
          ? _self.additionalTags
          : additionalTags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CampusBoundary].
extension CampusBoundaryPatterns on CampusBoundary {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CampusBoundary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampusBoundary() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CampusBoundary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBoundary():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CampusBoundary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBoundary() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
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
            Map<String, dynamic>? additionalTags)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampusBoundary() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.shortName,
            _that.amenity,
            _that.city,
            _that.street,
            _that.wikidata,
            _that.osmRelationId,
            _that.source,
            _that.sourceDate,
            _that.verificationStatus,
            _that.description,
            _that.polygon,
            _that.centroid,
            _that.areaSqMeters,
            _that.additionalTags);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
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
            Map<String, dynamic>? additionalTags)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBoundary():
        return $default(
            _that.id,
            _that.name,
            _that.shortName,
            _that.amenity,
            _that.city,
            _that.street,
            _that.wikidata,
            _that.osmRelationId,
            _that.source,
            _that.sourceDate,
            _that.verificationStatus,
            _that.description,
            _that.polygon,
            _that.centroid,
            _that.areaSqMeters,
            _that.additionalTags);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
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
            Map<String, dynamic>? additionalTags)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBoundary() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.shortName,
            _that.amenity,
            _that.city,
            _that.street,
            _that.wikidata,
            _that.osmRelationId,
            _that.source,
            _that.sourceDate,
            _that.verificationStatus,
            _that.description,
            _that.polygon,
            _that.centroid,
            _that.areaSqMeters,
            _that.additionalTags);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CampusBoundary extends CampusBoundary {
  const _CampusBoundary(
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
      required List<LatLng> polygon,
      this.centroid,
      this.areaSqMeters,
      Map<String, dynamic>? additionalTags})
      : _polygon = polygon,
        _additionalTags = additionalTags,
        super._();
  factory _CampusBoundary.fromJson(Map<String, dynamic> json) =>
      _$CampusBoundaryFromJson(json);

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

  /// Create a copy of CampusBoundary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CampusBoundaryCopyWith<_CampusBoundary> get copyWith =>
      __$CampusBoundaryCopyWithImpl<_CampusBoundary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CampusBoundaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CampusBoundary &&
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
            const DeepCollectionEquality().equals(other.polygon, _polygon) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid) &&
            (identical(other.areaSqMeters, areaSqMeters) ||
                other.areaSqMeters == areaSqMeters) &&
            const DeepCollectionEquality()
                .equals(other.additionalTags, _additionalTags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
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
  }

  @override
  String toString() {
    return 'CampusBoundary(id: $id, name: $name, shortName: $shortName, amenity: $amenity, city: $city, street: $street, wikidata: $wikidata, osmRelationId: $osmRelationId, source: $source, sourceDate: $sourceDate, verificationStatus: $verificationStatus, description: $description, polygon: $polygon, centroid: $centroid, areaSqMeters: $areaSqMeters, additionalTags: $additionalTags)';
  }
}

/// @nodoc
abstract mixin class _$CampusBoundaryCopyWith<$Res>
    implements $CampusBoundaryCopyWith<$Res> {
  factory _$CampusBoundaryCopyWith(
          _CampusBoundary value, $Res Function(_CampusBoundary) _then) =
      __$CampusBoundaryCopyWithImpl;
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
class __$CampusBoundaryCopyWithImpl<$Res>
    implements _$CampusBoundaryCopyWith<$Res> {
  __$CampusBoundaryCopyWithImpl(this._self, this._then);

  final _CampusBoundary _self;
  final $Res Function(_CampusBoundary) _then;

  /// Create a copy of CampusBoundary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_CampusBoundary(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _self.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      amenity: null == amenity
          ? _self.amenity
          : amenity // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _self.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      osmRelationId: null == osmRelationId
          ? _self.osmRelationId
          : osmRelationId // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      sourceDate: null == sourceDate
          ? _self.sourceDate
          : sourceDate // ignore: cast_nullable_to_non_nullable
              as String,
      verificationStatus: null == verificationStatus
          ? _self.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      polygon: null == polygon
          ? _self._polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      centroid: freezed == centroid
          ? _self.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      areaSqMeters: freezed == areaSqMeters
          ? _self.areaSqMeters
          : areaSqMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalTags: freezed == additionalTags
          ? _self._additionalTags
          : additionalTags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
