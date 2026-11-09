// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus_building.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuildingCategory {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BuildingCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory()';
  }
}

/// @nodoc
class $BuildingCategoryCopyWith<$Res> {
  $BuildingCategoryCopyWith(
      BuildingCategory _, $Res Function(BuildingCategory) __);
}

/// Adds pattern-matching-related methods to [BuildingCategory].
extension BuildingCategoryPatterns on BuildingCategory {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Academic value)? academic,
    TResult Function(_Administrative value)? administrative,
    TResult Function(_Library value)? library,
    TResult Function(_Laboratory value)? laboratory,
    TResult Function(_Gymnasium value)? gymnasium,
    TResult Function(_Cafeteria value)? cafeteria,
    TResult Function(_Dormitory value)? dormitory,
    TResult Function(_Parking value)? parking,
    TResult Function(_Other value)? other,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Academic() when academic != null:
        return academic(_that);
      case _Administrative() when administrative != null:
        return administrative(_that);
      case _Library() when library != null:
        return library(_that);
      case _Laboratory() when laboratory != null:
        return laboratory(_that);
      case _Gymnasium() when gymnasium != null:
        return gymnasium(_that);
      case _Cafeteria() when cafeteria != null:
        return cafeteria(_that);
      case _Dormitory() when dormitory != null:
        return dormitory(_that);
      case _Parking() when parking != null:
        return parking(_that);
      case _Other() when other != null:
        return other(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Academic value) academic,
    required TResult Function(_Administrative value) administrative,
    required TResult Function(_Library value) library,
    required TResult Function(_Laboratory value) laboratory,
    required TResult Function(_Gymnasium value) gymnasium,
    required TResult Function(_Cafeteria value) cafeteria,
    required TResult Function(_Dormitory value) dormitory,
    required TResult Function(_Parking value) parking,
    required TResult Function(_Other value) other,
  }) {
    final _that = this;
    switch (_that) {
      case _Academic():
        return academic(_that);
      case _Administrative():
        return administrative(_that);
      case _Library():
        return library(_that);
      case _Laboratory():
        return laboratory(_that);
      case _Gymnasium():
        return gymnasium(_that);
      case _Cafeteria():
        return cafeteria(_that);
      case _Dormitory():
        return dormitory(_that);
      case _Parking():
        return parking(_that);
      case _Other():
        return other(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Academic value)? academic,
    TResult? Function(_Administrative value)? administrative,
    TResult? Function(_Library value)? library,
    TResult? Function(_Laboratory value)? laboratory,
    TResult? Function(_Gymnasium value)? gymnasium,
    TResult? Function(_Cafeteria value)? cafeteria,
    TResult? Function(_Dormitory value)? dormitory,
    TResult? Function(_Parking value)? parking,
    TResult? Function(_Other value)? other,
  }) {
    final _that = this;
    switch (_that) {
      case _Academic() when academic != null:
        return academic(_that);
      case _Administrative() when administrative != null:
        return administrative(_that);
      case _Library() when library != null:
        return library(_that);
      case _Laboratory() when laboratory != null:
        return laboratory(_that);
      case _Gymnasium() when gymnasium != null:
        return gymnasium(_that);
      case _Cafeteria() when cafeteria != null:
        return cafeteria(_that);
      case _Dormitory() when dormitory != null:
        return dormitory(_that);
      case _Parking() when parking != null:
        return parking(_that);
      case _Other() when other != null:
        return other(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? academic,
    TResult Function()? administrative,
    TResult Function()? library,
    TResult Function()? laboratory,
    TResult Function()? gymnasium,
    TResult Function()? cafeteria,
    TResult Function()? dormitory,
    TResult Function()? parking,
    TResult Function()? other,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Academic() when academic != null:
        return academic();
      case _Administrative() when administrative != null:
        return administrative();
      case _Library() when library != null:
        return library();
      case _Laboratory() when laboratory != null:
        return laboratory();
      case _Gymnasium() when gymnasium != null:
        return gymnasium();
      case _Cafeteria() when cafeteria != null:
        return cafeteria();
      case _Dormitory() when dormitory != null:
        return dormitory();
      case _Parking() when parking != null:
        return parking();
      case _Other() when other != null:
        return other();
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
  TResult when<TResult extends Object?>({
    required TResult Function() academic,
    required TResult Function() administrative,
    required TResult Function() library,
    required TResult Function() laboratory,
    required TResult Function() gymnasium,
    required TResult Function() cafeteria,
    required TResult Function() dormitory,
    required TResult Function() parking,
    required TResult Function() other,
  }) {
    final _that = this;
    switch (_that) {
      case _Academic():
        return academic();
      case _Administrative():
        return administrative();
      case _Library():
        return library();
      case _Laboratory():
        return laboratory();
      case _Gymnasium():
        return gymnasium();
      case _Cafeteria():
        return cafeteria();
      case _Dormitory():
        return dormitory();
      case _Parking():
        return parking();
      case _Other():
        return other();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? academic,
    TResult? Function()? administrative,
    TResult? Function()? library,
    TResult? Function()? laboratory,
    TResult? Function()? gymnasium,
    TResult? Function()? cafeteria,
    TResult? Function()? dormitory,
    TResult? Function()? parking,
    TResult? Function()? other,
  }) {
    final _that = this;
    switch (_that) {
      case _Academic() when academic != null:
        return academic();
      case _Administrative() when administrative != null:
        return administrative();
      case _Library() when library != null:
        return library();
      case _Laboratory() when laboratory != null:
        return laboratory();
      case _Gymnasium() when gymnasium != null:
        return gymnasium();
      case _Cafeteria() when cafeteria != null:
        return cafeteria();
      case _Dormitory() when dormitory != null:
        return dormitory();
      case _Parking() when parking != null:
        return parking();
      case _Other() when other != null:
        return other();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Academic implements BuildingCategory {
  const _Academic();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Academic);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.academic()';
  }
}

/// @nodoc

class _Administrative implements BuildingCategory {
  const _Administrative();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Administrative);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.administrative()';
  }
}

/// @nodoc

class _Library implements BuildingCategory {
  const _Library();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Library);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.library()';
  }
}

/// @nodoc

class _Laboratory implements BuildingCategory {
  const _Laboratory();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Laboratory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.laboratory()';
  }
}

/// @nodoc

class _Gymnasium implements BuildingCategory {
  const _Gymnasium();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Gymnasium);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.gymnasium()';
  }
}

/// @nodoc

class _Cafeteria implements BuildingCategory {
  const _Cafeteria();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Cafeteria);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.cafeteria()';
  }
}

/// @nodoc

class _Dormitory implements BuildingCategory {
  const _Dormitory();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Dormitory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.dormitory()';
  }
}

/// @nodoc

class _Parking implements BuildingCategory {
  const _Parking();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Parking);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.parking()';
  }
}

/// @nodoc

class _Other implements BuildingCategory {
  const _Other();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Other);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BuildingCategory.other()';
  }
}

/// @nodoc
mixin _$CampusBuilding {
  String get id;
  int get osmWayId;
  String get name;
  String get buildingType;
  @BuildingCategoryConverter()
  BuildingCategory get category;
  String get description;
  String get source;
  String get sourceDate;
  String get verificationStatus;
  List<LatLng> get polygon;
  LatLng get centroid;
  double? get areaSqMeters;
  int? get floors;
  String? get address;
  Map<String, dynamic>? get additionalTags;

  /// Create a copy of CampusBuilding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CampusBuildingCopyWith<CampusBuilding> get copyWith =>
      _$CampusBuildingCopyWithImpl<CampusBuilding>(
          this as CampusBuilding, _$identity);

  /// Serializes this CampusBuilding to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as CampusBuilding;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CampusBuilding &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.osmWayId, _this.osmWayId) ||
                other.osmWayId == _this.osmWayId) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.buildingType, _this.buildingType) ||
                other.buildingType == _this.buildingType) &&
            (identical(other.category, _this.category) ||
                other.category == _this.category) &&
            (identical(other.description, _this.description) ||
                other.description == _this.description) &&
            (identical(other.source, _this.source) ||
                other.source == _this.source) &&
            (identical(other.sourceDate, _this.sourceDate) ||
                other.sourceDate == _this.sourceDate) &&
            (identical(other.verificationStatus, _this.verificationStatus) ||
                other.verificationStatus == _this.verificationStatus) &&
            const DeepCollectionEquality()
                .equals(other.polygon, _this.polygon) &&
            (identical(other.centroid, _this.centroid) ||
                other.centroid == _this.centroid) &&
            (identical(other.areaSqMeters, _this.areaSqMeters) ||
                other.areaSqMeters == _this.areaSqMeters) &&
            (identical(other.floors, _this.floors) ||
                other.floors == _this.floors) &&
            (identical(other.address, _this.address) ||
                other.address == _this.address) &&
            const DeepCollectionEquality()
                .equals(other.additionalTags, _this.additionalTags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as CampusBuilding;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.osmWayId,
        _this.name,
        _this.buildingType,
        _this.category,
        _this.description,
        _this.source,
        _this.sourceDate,
        _this.verificationStatus,
        const DeepCollectionEquality().hash(_this.polygon),
        _this.centroid,
        _this.areaSqMeters,
        _this.floors,
        _this.address,
        const DeepCollectionEquality().hash(_this.additionalTags));
  }

  @override
  String toString() {
    final _this = this as CampusBuilding;
    return 'CampusBuilding(id: ${_this.id}, osmWayId: ${_this.osmWayId}, name: ${_this.name}, buildingType: ${_this.buildingType}, category: ${_this.category}, description: ${_this.description}, source: ${_this.source}, sourceDate: ${_this.sourceDate}, verificationStatus: ${_this.verificationStatus}, polygon: ${_this.polygon}, centroid: ${_this.centroid}, areaSqMeters: ${_this.areaSqMeters}, floors: ${_this.floors}, address: ${_this.address}, additionalTags: ${_this.additionalTags})';
  }
}

/// @nodoc
abstract mixin class $CampusBuildingCopyWith<$Res> {
  factory $CampusBuildingCopyWith(
          CampusBuilding value, $Res Function(CampusBuilding) _then) =
      _$CampusBuildingCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int osmWayId,
      String name,
      String buildingType,
      @BuildingCategoryConverter() BuildingCategory category,
      String description,
      String source,
      String sourceDate,
      String verificationStatus,
      List<LatLng> polygon,
      LatLng centroid,
      double? areaSqMeters,
      int? floors,
      String? address,
      Map<String, dynamic>? additionalTags});

  $BuildingCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$CampusBuildingCopyWithImpl<$Res>
    implements $CampusBuildingCopyWith<$Res> {
  _$CampusBuildingCopyWithImpl(this._self, this._then);

  final CampusBuilding _self;
  final $Res Function(CampusBuilding) _then;

  /// Create a copy of CampusBuilding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? osmWayId = null,
    Object? name = null,
    Object? buildingType = null,
    Object? category = null,
    Object? description = null,
    Object? source = null,
    Object? sourceDate = null,
    Object? verificationStatus = null,
    Object? polygon = null,
    Object? centroid = null,
    Object? areaSqMeters = freezed,
    Object? floors = freezed,
    Object? address = freezed,
    Object? additionalTags = freezed,
  }) {
    return _then(CampusBuilding(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      osmWayId: null == osmWayId
          ? _self.osmWayId
          : osmWayId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingType: null == buildingType
          ? _self.buildingType
          : buildingType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as BuildingCategory,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      polygon: null == polygon
          ? _self.polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      centroid: null == centroid
          ? _self.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as LatLng,
      areaSqMeters: freezed == areaSqMeters
          ? _self.areaSqMeters
          : areaSqMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      floors: freezed == floors
          ? _self.floors
          : floors // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalTags: freezed == additionalTags
          ? _self.additionalTags
          : additionalTags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of CampusBuilding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuildingCategoryCopyWith<$Res> get category {
    return $BuildingCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CampusBuilding].
extension CampusBuildingPatterns on CampusBuilding {
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
    TResult Function(_CampusBuilding value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampusBuilding() when $default != null:
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
    TResult Function(_CampusBuilding value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBuilding():
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
    TResult? Function(_CampusBuilding value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBuilding() when $default != null:
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
            int osmWayId,
            String name,
            String buildingType,
            @BuildingCategoryConverter() BuildingCategory category,
            String description,
            String source,
            String sourceDate,
            String verificationStatus,
            List<LatLng> polygon,
            LatLng centroid,
            double? areaSqMeters,
            int? floors,
            String? address,
            Map<String, dynamic>? additionalTags)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CampusBuilding() when $default != null:
        return $default(
            _that.id,
            _that.osmWayId,
            _that.name,
            _that.buildingType,
            _that.category,
            _that.description,
            _that.source,
            _that.sourceDate,
            _that.verificationStatus,
            _that.polygon,
            _that.centroid,
            _that.areaSqMeters,
            _that.floors,
            _that.address,
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
            int osmWayId,
            String name,
            String buildingType,
            @BuildingCategoryConverter() BuildingCategory category,
            String description,
            String source,
            String sourceDate,
            String verificationStatus,
            List<LatLng> polygon,
            LatLng centroid,
            double? areaSqMeters,
            int? floors,
            String? address,
            Map<String, dynamic>? additionalTags)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBuilding():
        return $default(
            _that.id,
            _that.osmWayId,
            _that.name,
            _that.buildingType,
            _that.category,
            _that.description,
            _that.source,
            _that.sourceDate,
            _that.verificationStatus,
            _that.polygon,
            _that.centroid,
            _that.areaSqMeters,
            _that.floors,
            _that.address,
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
            int osmWayId,
            String name,
            String buildingType,
            @BuildingCategoryConverter() BuildingCategory category,
            String description,
            String source,
            String sourceDate,
            String verificationStatus,
            List<LatLng> polygon,
            LatLng centroid,
            double? areaSqMeters,
            int? floors,
            String? address,
            Map<String, dynamic>? additionalTags)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CampusBuilding() when $default != null:
        return $default(
            _that.id,
            _that.osmWayId,
            _that.name,
            _that.buildingType,
            _that.category,
            _that.description,
            _that.source,
            _that.sourceDate,
            _that.verificationStatus,
            _that.polygon,
            _that.centroid,
            _that.areaSqMeters,
            _that.floors,
            _that.address,
            _that.additionalTags);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CampusBuilding extends CampusBuilding {
  const _CampusBuilding(
      {required this.id,
      required this.osmWayId,
      required this.name,
      required this.buildingType,
      @BuildingCategoryConverter() required this.category,
      required this.description,
      required this.source,
      required this.sourceDate,
      required this.verificationStatus,
      required List<LatLng> polygon,
      required this.centroid,
      this.areaSqMeters,
      this.floors,
      this.address,
      Map<String, dynamic>? additionalTags})
      : _polygon = polygon,
        _additionalTags = additionalTags,
        super._();
  factory _CampusBuilding.fromJson(Map<String, dynamic> json) =>
      _$CampusBuildingFromJson(json);

  @override
  final String id;
  @override
  final int osmWayId;
  @override
  final String name;
  @override
  final String buildingType;
  @override
  @BuildingCategoryConverter()
  final BuildingCategory category;
  @override
  final String description;
  @override
  final String source;
  @override
  final String sourceDate;
  @override
  final String verificationStatus;
  final List<LatLng> _polygon;
  @override
  List<LatLng> get polygon {
    if (_polygon is EqualUnmodifiableListView) return _polygon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygon);
  }

  @override
  final LatLng centroid;
  @override
  final double? areaSqMeters;
  @override
  final int? floors;
  @override
  final String? address;
  final Map<String, dynamic>? _additionalTags;
  @override
  Map<String, dynamic>? get additionalTags {
    final value = _additionalTags;
    if (value == null) return null;
    if (_additionalTags is EqualUnmodifiableMapView) return _additionalTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of CampusBuilding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CampusBuildingCopyWith<_CampusBuilding> get copyWith =>
      __$CampusBuildingCopyWithImpl<_CampusBuilding>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CampusBuildingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CampusBuilding &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.osmWayId, osmWayId) ||
                other.osmWayId == osmWayId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buildingType, buildingType) ||
                other.buildingType == buildingType) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceDate, sourceDate) ||
                other.sourceDate == sourceDate) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            const DeepCollectionEquality().equals(other.polygon, _polygon) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid) &&
            (identical(other.areaSqMeters, areaSqMeters) ||
                other.areaSqMeters == areaSqMeters) &&
            (identical(other.floors, floors) || other.floors == floors) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other.additionalTags, _additionalTags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        osmWayId,
        name,
        buildingType,
        category,
        description,
        source,
        sourceDate,
        verificationStatus,
        const DeepCollectionEquality().hash(_polygon),
        centroid,
        areaSqMeters,
        floors,
        address,
        const DeepCollectionEquality().hash(_additionalTags));
  }

  @override
  String toString() {
    return 'CampusBuilding(id: $id, osmWayId: $osmWayId, name: $name, buildingType: $buildingType, category: $category, description: $description, source: $source, sourceDate: $sourceDate, verificationStatus: $verificationStatus, polygon: $polygon, centroid: $centroid, areaSqMeters: $areaSqMeters, floors: $floors, address: $address, additionalTags: $additionalTags)';
  }
}

/// @nodoc
abstract mixin class _$CampusBuildingCopyWith<$Res>
    implements $CampusBuildingCopyWith<$Res> {
  factory _$CampusBuildingCopyWith(
          _CampusBuilding value, $Res Function(_CampusBuilding) _then) =
      __$CampusBuildingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int osmWayId,
      String name,
      String buildingType,
      @BuildingCategoryConverter() BuildingCategory category,
      String description,
      String source,
      String sourceDate,
      String verificationStatus,
      List<LatLng> polygon,
      LatLng centroid,
      double? areaSqMeters,
      int? floors,
      String? address,
      Map<String, dynamic>? additionalTags});

  @override
  $BuildingCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$CampusBuildingCopyWithImpl<$Res>
    implements _$CampusBuildingCopyWith<$Res> {
  __$CampusBuildingCopyWithImpl(this._self, this._then);

  final _CampusBuilding _self;
  final $Res Function(_CampusBuilding) _then;

  /// Create a copy of CampusBuilding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? osmWayId = null,
    Object? name = null,
    Object? buildingType = null,
    Object? category = null,
    Object? description = null,
    Object? source = null,
    Object? sourceDate = null,
    Object? verificationStatus = null,
    Object? polygon = null,
    Object? centroid = null,
    Object? areaSqMeters = freezed,
    Object? floors = freezed,
    Object? address = freezed,
    Object? additionalTags = freezed,
  }) {
    return _then(_CampusBuilding(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      osmWayId: null == osmWayId
          ? _self.osmWayId
          : osmWayId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingType: null == buildingType
          ? _self.buildingType
          : buildingType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as BuildingCategory,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
      polygon: null == polygon
          ? _self._polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      centroid: null == centroid
          ? _self.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as LatLng,
      areaSqMeters: freezed == areaSqMeters
          ? _self.areaSqMeters
          : areaSqMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      floors: freezed == floors
          ? _self.floors
          : floors // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalTags: freezed == additionalTags
          ? _self._additionalTags
          : additionalTags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of CampusBuilding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BuildingCategoryCopyWith<$Res> get category {
    return $BuildingCategoryCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}

// dart format on
