// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  /// Unique location ID
  String get id => throw _privateConstructorUsedError;

  /// Location name
  String get name => throw _privateConstructorUsedError;

  /// Location code (e.g., BLDG-A, BLDG-B)
  String get code => throw _privateConstructorUsedError;

  /// Category
  LocationCategory get category => throw _privateConstructorUsedError;

  /// Description
  String? get description => throw _privateConstructorUsedError;

  /// Latitude
  double get latitude => throw _privateConstructorUsedError;

  /// Longitude
  double get longitude => throw _privateConstructorUsedError;

  /// Building floor (for multi-floor buildings)
  int? get floor => throw _privateConstructorUsedError;

  /// Room number (for specific rooms)
  String? get roomNumber => throw _privateConstructorUsedError;

  /// Whether this is an evacuation assembly point
  bool get isEvacuationPoint => throw _privateConstructorUsedError;

  /// Whether this is a shelter location
  bool get isShelter => throw _privateConstructorUsedError;

  /// Whether location has wheelchair access
  bool get hasWheelchairAccess => throw _privateConstructorUsedError;

  /// Whether location has emergency equipment
  bool get hasEmergencyEquipment => throw _privateConstructorUsedError;

  /// Emergency equipment details
  String? get emergencyEquipmentDetails => throw _privateConstructorUsedError;

  /// Contact phone for this location
  String? get contactPhone => throw _privateConstructorUsedError;

  /// Operating hours
  String? get operatingHours => throw _privateConstructorUsedError;

  /// Image URL
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Tags for search/filtering
  List<String> get tags => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last update timestamp
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Additional metadata
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {String id,
      String name,
      String code,
      LocationCategory category,
      String? description,
      double latitude,
      double longitude,
      int? floor,
      String? roomNumber,
      bool isEvacuationPoint,
      bool isShelter,
      bool hasWheelchairAccess,
      bool hasEmergencyEquipment,
      String? emergencyEquipmentDetails,
      String? contactPhone,
      String? operatingHours,
      String? imageUrl,
      List<String> tags,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? category = null,
    Object? description = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? floor = freezed,
    Object? roomNumber = freezed,
    Object? isEvacuationPoint = null,
    Object? isShelter = null,
    Object? hasWheelchairAccess = null,
    Object? hasEmergencyEquipment = null,
    Object? emergencyEquipmentDetails = freezed,
    Object? contactPhone = freezed,
    Object? operatingHours = freezed,
    Object? imageUrl = freezed,
    Object? tags = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as LocationCategory,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      roomNumber: freezed == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEvacuationPoint: null == isEvacuationPoint
          ? _value.isEvacuationPoint
          : isEvacuationPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isShelter: null == isShelter
          ? _value.isShelter
          : isShelter // ignore: cast_nullable_to_non_nullable
              as bool,
      hasWheelchairAccess: null == hasWheelchairAccess
          ? _value.hasWheelchairAccess
          : hasWheelchairAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      hasEmergencyEquipment: null == hasEmergencyEquipment
          ? _value.hasEmergencyEquipment
          : hasEmergencyEquipment // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyEquipmentDetails: freezed == emergencyEquipmentDetails
          ? _value.emergencyEquipmentDetails
          : emergencyEquipmentDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      operatingHours: freezed == operatingHours
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String code,
      LocationCategory category,
      String? description,
      double latitude,
      double longitude,
      int? floor,
      String? roomNumber,
      bool isEvacuationPoint,
      bool isShelter,
      bool hasWheelchairAccess,
      bool hasEmergencyEquipment,
      String? emergencyEquipmentDetails,
      String? contactPhone,
      String? operatingHours,
      String? imageUrl,
      List<String> tags,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? category = null,
    Object? description = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? floor = freezed,
    Object? roomNumber = freezed,
    Object? isEvacuationPoint = null,
    Object? isShelter = null,
    Object? hasWheelchairAccess = null,
    Object? hasEmergencyEquipment = null,
    Object? emergencyEquipmentDetails = freezed,
    Object? contactPhone = freezed,
    Object? operatingHours = freezed,
    Object? imageUrl = freezed,
    Object? tags = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = null,
  }) {
    return _then(_$LocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as LocationCategory,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      roomNumber: freezed == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isEvacuationPoint: null == isEvacuationPoint
          ? _value.isEvacuationPoint
          : isEvacuationPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isShelter: null == isShelter
          ? _value.isShelter
          : isShelter // ignore: cast_nullable_to_non_nullable
              as bool,
      hasWheelchairAccess: null == hasWheelchairAccess
          ? _value.hasWheelchairAccess
          : hasWheelchairAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      hasEmergencyEquipment: null == hasEmergencyEquipment
          ? _value.hasEmergencyEquipment
          : hasEmergencyEquipment // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyEquipmentDetails: freezed == emergencyEquipmentDetails
          ? _value.emergencyEquipmentDetails
          : emergencyEquipmentDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPhone: freezed == contactPhone
          ? _value.contactPhone
          : contactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      operatingHours: freezed == operatingHours
          ? _value.operatingHours
          : operatingHours // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.category,
      this.description,
      required this.latitude,
      required this.longitude,
      this.floor,
      this.roomNumber,
      this.isEvacuationPoint = false,
      this.isShelter = false,
      this.hasWheelchairAccess = false,
      this.hasEmergencyEquipment = false,
      this.emergencyEquipmentDetails,
      this.contactPhone,
      this.operatingHours,
      this.imageUrl,
      final List<String> tags = const [],
      required this.createdAt,
      required this.updatedAt,
      final Map<String, dynamic> metadata = const {}})
      : _tags = tags,
        _metadata = metadata;

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  /// Unique location ID
  @override
  final String id;

  /// Location name
  @override
  final String name;

  /// Location code (e.g., BLDG-A, BLDG-B)
  @override
  final String code;

  /// Category
  @override
  final LocationCategory category;

  /// Description
  @override
  final String? description;

  /// Latitude
  @override
  final double latitude;

  /// Longitude
  @override
  final double longitude;

  /// Building floor (for multi-floor buildings)
  @override
  final int? floor;

  /// Room number (for specific rooms)
  @override
  final String? roomNumber;

  /// Whether this is an evacuation assembly point
  @override
  @JsonKey()
  final bool isEvacuationPoint;

  /// Whether this is a shelter location
  @override
  @JsonKey()
  final bool isShelter;

  /// Whether location has wheelchair access
  @override
  @JsonKey()
  final bool hasWheelchairAccess;

  /// Whether location has emergency equipment
  @override
  @JsonKey()
  final bool hasEmergencyEquipment;

  /// Emergency equipment details
  @override
  final String? emergencyEquipmentDetails;

  /// Contact phone for this location
  @override
  final String? contactPhone;

  /// Operating hours
  @override
  final String? operatingHours;

  /// Image URL
  @override
  final String? imageUrl;

  /// Tags for search/filtering
  final List<String> _tags;

  /// Tags for search/filtering
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// Creation timestamp
  @override
  final DateTime createdAt;

  /// Last update timestamp
  @override
  final DateTime updatedAt;

  /// Additional metadata
  final Map<String, dynamic> _metadata;

  /// Additional metadata
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Location(id: $id, name: $name, code: $code, category: $category, description: $description, latitude: $latitude, longitude: $longitude, floor: $floor, roomNumber: $roomNumber, isEvacuationPoint: $isEvacuationPoint, isShelter: $isShelter, hasWheelchairAccess: $hasWheelchairAccess, hasEmergencyEquipment: $hasEmergencyEquipment, emergencyEquipmentDetails: $emergencyEquipmentDetails, contactPhone: $contactPhone, operatingHours: $operatingHours, imageUrl: $imageUrl, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.isEvacuationPoint, isEvacuationPoint) ||
                other.isEvacuationPoint == isEvacuationPoint) &&
            (identical(other.isShelter, isShelter) ||
                other.isShelter == isShelter) &&
            (identical(other.hasWheelchairAccess, hasWheelchairAccess) ||
                other.hasWheelchairAccess == hasWheelchairAccess) &&
            (identical(other.hasEmergencyEquipment, hasEmergencyEquipment) ||
                other.hasEmergencyEquipment == hasEmergencyEquipment) &&
            (identical(other.emergencyEquipmentDetails,
                    emergencyEquipmentDetails) ||
                other.emergencyEquipmentDetails == emergencyEquipmentDetails) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.operatingHours, operatingHours) ||
                other.operatingHours == operatingHours) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        code,
        category,
        description,
        latitude,
        longitude,
        floor,
        roomNumber,
        isEvacuationPoint,
        isShelter,
        hasWheelchairAccess,
        hasEmergencyEquipment,
        emergencyEquipmentDetails,
        contactPhone,
        operatingHours,
        imageUrl,
        const DeepCollectionEquality().hash(_tags),
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {required final String id,
      required final String name,
      required final String code,
      required final LocationCategory category,
      final String? description,
      required final double latitude,
      required final double longitude,
      final int? floor,
      final String? roomNumber,
      final bool isEvacuationPoint,
      final bool isShelter,
      final bool hasWheelchairAccess,
      final bool hasEmergencyEquipment,
      final String? emergencyEquipmentDetails,
      final String? contactPhone,
      final String? operatingHours,
      final String? imageUrl,
      final List<String> tags,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final Map<String, dynamic> metadata}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override

  /// Unique location ID
  String get id;
  @override

  /// Location name
  String get name;
  @override

  /// Location code (e.g., BLDG-A, BLDG-B)
  String get code;
  @override

  /// Category
  LocationCategory get category;
  @override

  /// Description
  String? get description;
  @override

  /// Latitude
  double get latitude;
  @override

  /// Longitude
  double get longitude;
  @override

  /// Building floor (for multi-floor buildings)
  int? get floor;
  @override

  /// Room number (for specific rooms)
  String? get roomNumber;
  @override

  /// Whether this is an evacuation assembly point
  bool get isEvacuationPoint;
  @override

  /// Whether this is a shelter location
  bool get isShelter;
  @override

  /// Whether location has wheelchair access
  bool get hasWheelchairAccess;
  @override

  /// Whether location has emergency equipment
  bool get hasEmergencyEquipment;
  @override

  /// Emergency equipment details
  String? get emergencyEquipmentDetails;
  @override

  /// Contact phone for this location
  String? get contactPhone;
  @override

  /// Operating hours
  String? get operatingHours;
  @override

  /// Image URL
  String? get imageUrl;
  @override

  /// Tags for search/filtering
  List<String> get tags;
  @override

  /// Creation timestamp
  DateTime get createdAt;
  @override

  /// Last update timestamp
  DateTime get updatedAt;
  @override

  /// Additional metadata
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
