// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_twin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Building3D {

 String get id; String get name; String get displayName; int get floorCount; List<Floor3D> get floors; BuildingBounds3D get bounds; String get modelPath; String get metadataPath; BuildingType get type; Map<String, dynamic> get properties; DateTime get lastUpdated;
/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Building3DCopyWith<Building3D> get copyWith => _$Building3DCopyWithImpl<Building3D>(this as Building3D, _$identity);

  /// Serializes this Building3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Building3D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Building3D&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.floorCount, _this.floorCount) || other.floorCount == _this.floorCount)&&const DeepCollectionEquality().equals(other.floors, _this.floors)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds)&&(identical(other.modelPath, _this.modelPath) || other.modelPath == _this.modelPath)&&(identical(other.metadataPath, _this.metadataPath) || other.metadataPath == _this.metadataPath)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.properties, _this.properties)&&(identical(other.lastUpdated, _this.lastUpdated) || other.lastUpdated == _this.lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Building3D;
  return Object.hash(runtimeType,_this.id,_this.name,_this.displayName,_this.floorCount,const DeepCollectionEquality().hash(_this.floors),_this.bounds,_this.modelPath,_this.metadataPath,_this.type,const DeepCollectionEquality().hash(_this.properties),_this.lastUpdated);
}

@override
String toString() {
  final _this = this as Building3D;
  return 'Building3D(id: ${_this.id}, name: ${_this.name}, displayName: ${_this.displayName}, floorCount: ${_this.floorCount}, floors: ${_this.floors}, bounds: ${_this.bounds}, modelPath: ${_this.modelPath}, metadataPath: ${_this.metadataPath}, type: ${_this.type}, properties: ${_this.properties}, lastUpdated: ${_this.lastUpdated})';
}


}

/// @nodoc
abstract mixin class $Building3DCopyWith<$Res>  {
  factory $Building3DCopyWith(Building3D value, $Res Function(Building3D) _then) = _$Building3DCopyWithImpl;
@useResult
$Res call({
 String id, String name, String displayName, int floorCount, List<Floor3D> floors, BuildingBounds3D bounds, String modelPath, String metadataPath, BuildingType type, Map<String, dynamic> properties, DateTime lastUpdated
});


$BuildingBounds3DCopyWith<$Res> get bounds;$BuildingTypeCopyWith<$Res> get type;

}
/// @nodoc
class _$Building3DCopyWithImpl<$Res>
    implements $Building3DCopyWith<$Res> {
  _$Building3DCopyWithImpl(this._self, this._then);

  final Building3D _self;
  final $Res Function(Building3D) _then;

/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? displayName = null,Object? floorCount = null,Object? floors = null,Object? bounds = null,Object? modelPath = null,Object? metadataPath = null,Object? type = null,Object? properties = null,Object? lastUpdated = null,}) {
  return _then(Building3D(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,floorCount: null == floorCount ? _self.floorCount : floorCount // ignore: cast_nullable_to_non_nullable
as int,floors: null == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as List<Floor3D>,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as BuildingBounds3D,modelPath: null == modelPath ? _self.modelPath : modelPath // ignore: cast_nullable_to_non_nullable
as String,metadataPath: null == metadataPath ? _self.metadataPath : metadataPath // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BuildingType,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingBounds3DCopyWith<$Res> get bounds {
  
  return $BuildingBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingTypeCopyWith<$Res> get type {
  
  return $BuildingTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [Building3D].
extension Building3DPatterns on Building3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Building3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Building3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Building3D value)  $default,){
final _that = this;
switch (_that) {
case _Building3D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Building3D value)?  $default,){
final _that = this;
switch (_that) {
case _Building3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String displayName,  int floorCount,  List<Floor3D> floors,  BuildingBounds3D bounds,  String modelPath,  String metadataPath,  BuildingType type,  Map<String, dynamic> properties,  DateTime lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Building3D() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.floorCount,_that.floors,_that.bounds,_that.modelPath,_that.metadataPath,_that.type,_that.properties,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String displayName,  int floorCount,  List<Floor3D> floors,  BuildingBounds3D bounds,  String modelPath,  String metadataPath,  BuildingType type,  Map<String, dynamic> properties,  DateTime lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _Building3D():
return $default(_that.id,_that.name,_that.displayName,_that.floorCount,_that.floors,_that.bounds,_that.modelPath,_that.metadataPath,_that.type,_that.properties,_that.lastUpdated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String displayName,  int floorCount,  List<Floor3D> floors,  BuildingBounds3D bounds,  String modelPath,  String metadataPath,  BuildingType type,  Map<String, dynamic> properties,  DateTime lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _Building3D() when $default != null:
return $default(_that.id,_that.name,_that.displayName,_that.floorCount,_that.floors,_that.bounds,_that.modelPath,_that.metadataPath,_that.type,_that.properties,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Building3D implements Building3D {
  const _Building3D({required this.id, required this.name, required this.displayName, required this.floorCount, required  List<Floor3D> floors, required this.bounds, required this.modelPath, required this.metadataPath, required this.type, required  Map<String, dynamic> properties, required this.lastUpdated}): _floors = floors,_properties = properties;
  factory _Building3D.fromJson(Map<String, dynamic> json) => _$Building3DFromJson(json);

@override final  String id;
@override final  String name;
@override final  String displayName;
@override final  int floorCount;
 final  List<Floor3D> _floors;
@override List<Floor3D> get floors {
  if (_floors is EqualUnmodifiableListView) return _floors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_floors);
}

@override final  BuildingBounds3D bounds;
@override final  String modelPath;
@override final  String metadataPath;
@override final  BuildingType type;
 final  Map<String, dynamic> _properties;
@override Map<String, dynamic> get properties {
  if (_properties is EqualUnmodifiableMapView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_properties);
}

@override final  DateTime lastUpdated;

/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Building3DCopyWith<_Building3D> get copyWith => __$Building3DCopyWithImpl<_Building3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Building3DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Building3D&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.floorCount, floorCount) || other.floorCount == floorCount)&&const DeepCollectionEquality().equals(other.floors, _floors)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.modelPath, modelPath) || other.modelPath == modelPath)&&(identical(other.metadataPath, metadataPath) || other.metadataPath == metadataPath)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.properties, _properties)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,displayName,floorCount,const DeepCollectionEquality().hash(_floors),bounds,modelPath,metadataPath,type,const DeepCollectionEquality().hash(_properties),lastUpdated);
}

@override
String toString() {
    return 'Building3D(id: $id, name: $name, displayName: $displayName, floorCount: $floorCount, floors: $floors, bounds: $bounds, modelPath: $modelPath, metadataPath: $metadataPath, type: $type, properties: $properties, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$Building3DCopyWith<$Res> implements $Building3DCopyWith<$Res> {
  factory _$Building3DCopyWith(_Building3D value, $Res Function(_Building3D) _then) = __$Building3DCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String displayName, int floorCount, List<Floor3D> floors, BuildingBounds3D bounds, String modelPath, String metadataPath, BuildingType type, Map<String, dynamic> properties, DateTime lastUpdated
});


@override $BuildingBounds3DCopyWith<$Res> get bounds;@override $BuildingTypeCopyWith<$Res> get type;

}
/// @nodoc
class __$Building3DCopyWithImpl<$Res>
    implements _$Building3DCopyWith<$Res> {
  __$Building3DCopyWithImpl(this._self, this._then);

  final _Building3D _self;
  final $Res Function(_Building3D) _then;

/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? displayName = null,Object? floorCount = null,Object? floors = null,Object? bounds = null,Object? modelPath = null,Object? metadataPath = null,Object? type = null,Object? properties = null,Object? lastUpdated = null,}) {
  return _then(_Building3D(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,floorCount: null == floorCount ? _self.floorCount : floorCount // ignore: cast_nullable_to_non_nullable
as int,floors: null == floors ? _self._floors : floors // ignore: cast_nullable_to_non_nullable
as List<Floor3D>,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as BuildingBounds3D,modelPath: null == modelPath ? _self.modelPath : modelPath // ignore: cast_nullable_to_non_nullable
as String,metadataPath: null == metadataPath ? _self.metadataPath : metadataPath // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BuildingType,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingBounds3DCopyWith<$Res> get bounds {
  
  return $BuildingBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of Building3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingTypeCopyWith<$Res> get type {
  
  return $BuildingTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}

BuildingType _$BuildingTypeFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'academic':
          return AcademicBuilding.fromJson(
            json
          );
                case 'administrative':
          return AdministrativeBuilding.fromJson(
            json
          );
                case 'laboratory':
          return LaboratoryBuilding.fromJson(
            json
          );
                case 'library':
          return LibraryBuilding.fromJson(
            json
          );
                case 'gymnasium':
          return GymnasiumBuilding.fromJson(
            json
          );
                case 'auditorium':
          return AuditoriumBuilding.fromJson(
            json
          );
                case 'cafeteria':
          return CafeteriaBuilding.fromJson(
            json
          );
                case 'dormitory':
          return DormitoryBuilding.fromJson(
            json
          );
                case 'other':
          return OtherBuilding.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'BuildingType',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$BuildingType {



  /// Serializes this BuildingType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingType);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType()';
}


}

/// @nodoc
class $BuildingTypeCopyWith<$Res>  {
$BuildingTypeCopyWith(BuildingType _, $Res Function(BuildingType) __);
}


/// Adds pattern-matching-related methods to [BuildingType].
extension BuildingTypePatterns on BuildingType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AcademicBuilding value)?  academic,TResult Function( AdministrativeBuilding value)?  administrative,TResult Function( LaboratoryBuilding value)?  laboratory,TResult Function( LibraryBuilding value)?  library,TResult Function( GymnasiumBuilding value)?  gymnasium,TResult Function( AuditoriumBuilding value)?  auditorium,TResult Function( CafeteriaBuilding value)?  cafeteria,TResult Function( DormitoryBuilding value)?  dormitory,TResult Function( OtherBuilding value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AcademicBuilding() when academic != null:
return academic(_that);case AdministrativeBuilding() when administrative != null:
return administrative(_that);case LaboratoryBuilding() when laboratory != null:
return laboratory(_that);case LibraryBuilding() when library != null:
return library(_that);case GymnasiumBuilding() when gymnasium != null:
return gymnasium(_that);case AuditoriumBuilding() when auditorium != null:
return auditorium(_that);case CafeteriaBuilding() when cafeteria != null:
return cafeteria(_that);case DormitoryBuilding() when dormitory != null:
return dormitory(_that);case OtherBuilding() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AcademicBuilding value)  academic,required TResult Function( AdministrativeBuilding value)  administrative,required TResult Function( LaboratoryBuilding value)  laboratory,required TResult Function( LibraryBuilding value)  library,required TResult Function( GymnasiumBuilding value)  gymnasium,required TResult Function( AuditoriumBuilding value)  auditorium,required TResult Function( CafeteriaBuilding value)  cafeteria,required TResult Function( DormitoryBuilding value)  dormitory,required TResult Function( OtherBuilding value)  other,}){
final _that = this;
switch (_that) {
case AcademicBuilding():
return academic(_that);case AdministrativeBuilding():
return administrative(_that);case LaboratoryBuilding():
return laboratory(_that);case LibraryBuilding():
return library(_that);case GymnasiumBuilding():
return gymnasium(_that);case AuditoriumBuilding():
return auditorium(_that);case CafeteriaBuilding():
return cafeteria(_that);case DormitoryBuilding():
return dormitory(_that);case OtherBuilding():
return other(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AcademicBuilding value)?  academic,TResult? Function( AdministrativeBuilding value)?  administrative,TResult? Function( LaboratoryBuilding value)?  laboratory,TResult? Function( LibraryBuilding value)?  library,TResult? Function( GymnasiumBuilding value)?  gymnasium,TResult? Function( AuditoriumBuilding value)?  auditorium,TResult? Function( CafeteriaBuilding value)?  cafeteria,TResult? Function( DormitoryBuilding value)?  dormitory,TResult? Function( OtherBuilding value)?  other,}){
final _that = this;
switch (_that) {
case AcademicBuilding() when academic != null:
return academic(_that);case AdministrativeBuilding() when administrative != null:
return administrative(_that);case LaboratoryBuilding() when laboratory != null:
return laboratory(_that);case LibraryBuilding() when library != null:
return library(_that);case GymnasiumBuilding() when gymnasium != null:
return gymnasium(_that);case AuditoriumBuilding() when auditorium != null:
return auditorium(_that);case CafeteriaBuilding() when cafeteria != null:
return cafeteria(_that);case DormitoryBuilding() when dormitory != null:
return dormitory(_that);case OtherBuilding() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  academic,TResult Function()?  administrative,TResult Function()?  laboratory,TResult Function()?  library,TResult Function()?  gymnasium,TResult Function()?  auditorium,TResult Function()?  cafeteria,TResult Function()?  dormitory,TResult Function( String label)?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AcademicBuilding() when academic != null:
return academic();case AdministrativeBuilding() when administrative != null:
return administrative();case LaboratoryBuilding() when laboratory != null:
return laboratory();case LibraryBuilding() when library != null:
return library();case GymnasiumBuilding() when gymnasium != null:
return gymnasium();case AuditoriumBuilding() when auditorium != null:
return auditorium();case CafeteriaBuilding() when cafeteria != null:
return cafeteria();case DormitoryBuilding() when dormitory != null:
return dormitory();case OtherBuilding() when other != null:
return other(_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  academic,required TResult Function()  administrative,required TResult Function()  laboratory,required TResult Function()  library,required TResult Function()  gymnasium,required TResult Function()  auditorium,required TResult Function()  cafeteria,required TResult Function()  dormitory,required TResult Function( String label)  other,}) {final _that = this;
switch (_that) {
case AcademicBuilding():
return academic();case AdministrativeBuilding():
return administrative();case LaboratoryBuilding():
return laboratory();case LibraryBuilding():
return library();case GymnasiumBuilding():
return gymnasium();case AuditoriumBuilding():
return auditorium();case CafeteriaBuilding():
return cafeteria();case DormitoryBuilding():
return dormitory();case OtherBuilding():
return other(_that.label);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  academic,TResult? Function()?  administrative,TResult? Function()?  laboratory,TResult? Function()?  library,TResult? Function()?  gymnasium,TResult? Function()?  auditorium,TResult? Function()?  cafeteria,TResult? Function()?  dormitory,TResult? Function( String label)?  other,}) {final _that = this;
switch (_that) {
case AcademicBuilding() when academic != null:
return academic();case AdministrativeBuilding() when administrative != null:
return administrative();case LaboratoryBuilding() when laboratory != null:
return laboratory();case LibraryBuilding() when library != null:
return library();case GymnasiumBuilding() when gymnasium != null:
return gymnasium();case AuditoriumBuilding() when auditorium != null:
return auditorium();case CafeteriaBuilding() when cafeteria != null:
return cafeteria();case DormitoryBuilding() when dormitory != null:
return dormitory();case OtherBuilding() when other != null:
return other(_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AcademicBuilding implements BuildingType {
  const AcademicBuilding({ String? $type}): $type = $type ?? 'academic';
  factory AcademicBuilding.fromJson(Map<String, dynamic> json) => _$AcademicBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$AcademicBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AcademicBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.academic()';
}


}




/// @nodoc
@JsonSerializable()

class AdministrativeBuilding implements BuildingType {
  const AdministrativeBuilding({ String? $type}): $type = $type ?? 'administrative';
  factory AdministrativeBuilding.fromJson(Map<String, dynamic> json) => _$AdministrativeBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$AdministrativeBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AdministrativeBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.administrative()';
}


}




/// @nodoc
@JsonSerializable()

class LaboratoryBuilding implements BuildingType {
  const LaboratoryBuilding({ String? $type}): $type = $type ?? 'laboratory';
  factory LaboratoryBuilding.fromJson(Map<String, dynamic> json) => _$LaboratoryBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LaboratoryBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LaboratoryBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.laboratory()';
}


}




/// @nodoc
@JsonSerializable()

class LibraryBuilding implements BuildingType {
  const LibraryBuilding({ String? $type}): $type = $type ?? 'library';
  factory LibraryBuilding.fromJson(Map<String, dynamic> json) => _$LibraryBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LibraryBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.library()';
}


}




/// @nodoc
@JsonSerializable()

class GymnasiumBuilding implements BuildingType {
  const GymnasiumBuilding({ String? $type}): $type = $type ?? 'gymnasium';
  factory GymnasiumBuilding.fromJson(Map<String, dynamic> json) => _$GymnasiumBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$GymnasiumBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GymnasiumBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.gymnasium()';
}


}




/// @nodoc
@JsonSerializable()

class AuditoriumBuilding implements BuildingType {
  const AuditoriumBuilding({ String? $type}): $type = $type ?? 'auditorium';
  factory AuditoriumBuilding.fromJson(Map<String, dynamic> json) => _$AuditoriumBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$AuditoriumBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditoriumBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.auditorium()';
}


}




/// @nodoc
@JsonSerializable()

class CafeteriaBuilding implements BuildingType {
  const CafeteriaBuilding({ String? $type}): $type = $type ?? 'cafeteria';
  factory CafeteriaBuilding.fromJson(Map<String, dynamic> json) => _$CafeteriaBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CafeteriaBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CafeteriaBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.cafeteria()';
}


}




/// @nodoc
@JsonSerializable()

class DormitoryBuilding implements BuildingType {
  const DormitoryBuilding({ String? $type}): $type = $type ?? 'dormitory';
  factory DormitoryBuilding.fromJson(Map<String, dynamic> json) => _$DormitoryBuildingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$DormitoryBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DormitoryBuilding);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'BuildingType.dormitory()';
}


}




/// @nodoc
@JsonSerializable()

class OtherBuilding implements BuildingType {
  const OtherBuilding(this.label, { String? $type}): $type = $type ?? 'other';
  factory OtherBuilding.fromJson(Map<String, dynamic> json) => _$OtherBuildingFromJson(json);

 final  String label;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BuildingType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherBuildingCopyWith<OtherBuilding> get copyWith => _$OtherBuildingCopyWithImpl<OtherBuilding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherBuilding&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label);
}

@override
String toString() {
    return 'BuildingType.other(label: $label)';
}


}

/// @nodoc
abstract mixin class $OtherBuildingCopyWith<$Res> implements $BuildingTypeCopyWith<$Res> {
  factory $OtherBuildingCopyWith(OtherBuilding value, $Res Function(OtherBuilding) _then) = _$OtherBuildingCopyWithImpl;
@useResult
$Res call({
 String label
});




}
/// @nodoc
class _$OtherBuildingCopyWithImpl<$Res>
    implements $OtherBuildingCopyWith<$Res> {
  _$OtherBuildingCopyWithImpl(this._self, this._then);

  final OtherBuilding _self;
  final $Res Function(OtherBuilding) _then;

/// Create a copy of BuildingType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,}) {
  return _then(OtherBuilding(
null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BuildingBounds3D {

 double get minX; double get minY; double get minZ; double get maxX; double get maxY; double get maxZ;
/// Create a copy of BuildingBounds3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingBounds3DCopyWith<BuildingBounds3D> get copyWith => _$BuildingBounds3DCopyWithImpl<BuildingBounds3D>(this as BuildingBounds3D, _$identity);

  /// Serializes this BuildingBounds3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuildingBounds3D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingBounds3D&&(identical(other.minX, _this.minX) || other.minX == _this.minX)&&(identical(other.minY, _this.minY) || other.minY == _this.minY)&&(identical(other.minZ, _this.minZ) || other.minZ == _this.minZ)&&(identical(other.maxX, _this.maxX) || other.maxX == _this.maxX)&&(identical(other.maxY, _this.maxY) || other.maxY == _this.maxY)&&(identical(other.maxZ, _this.maxZ) || other.maxZ == _this.maxZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuildingBounds3D;
  return Object.hash(runtimeType,_this.minX,_this.minY,_this.minZ,_this.maxX,_this.maxY,_this.maxZ);
}

@override
String toString() {
  final _this = this as BuildingBounds3D;
  return 'BuildingBounds3D(minX: ${_this.minX}, minY: ${_this.minY}, minZ: ${_this.minZ}, maxX: ${_this.maxX}, maxY: ${_this.maxY}, maxZ: ${_this.maxZ})';
}


}

/// @nodoc
abstract mixin class $BuildingBounds3DCopyWith<$Res>  {
  factory $BuildingBounds3DCopyWith(BuildingBounds3D value, $Res Function(BuildingBounds3D) _then) = _$BuildingBounds3DCopyWithImpl;
@useResult
$Res call({
 double minX, double minY, double minZ, double maxX, double maxY, double maxZ
});




}
/// @nodoc
class _$BuildingBounds3DCopyWithImpl<$Res>
    implements $BuildingBounds3DCopyWith<$Res> {
  _$BuildingBounds3DCopyWithImpl(this._self, this._then);

  final BuildingBounds3D _self;
  final $Res Function(BuildingBounds3D) _then;

/// Create a copy of BuildingBounds3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minX = null,Object? minY = null,Object? minZ = null,Object? maxX = null,Object? maxY = null,Object? maxZ = null,}) {
  return _then(BuildingBounds3D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,minZ: null == minZ ? _self.minZ : minZ // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,maxZ: null == maxZ ? _self.maxZ : maxZ // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BuildingBounds3D].
extension BuildingBounds3DPatterns on BuildingBounds3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildingBounds3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildingBounds3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildingBounds3D value)  $default,){
final _that = this;
switch (_that) {
case _BuildingBounds3D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildingBounds3D value)?  $default,){
final _that = this;
switch (_that) {
case _BuildingBounds3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minX,  double minY,  double minZ,  double maxX,  double maxY,  double maxZ)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildingBounds3D() when $default != null:
return $default(_that.minX,_that.minY,_that.minZ,_that.maxX,_that.maxY,_that.maxZ);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minX,  double minY,  double minZ,  double maxX,  double maxY,  double maxZ)  $default,) {final _that = this;
switch (_that) {
case _BuildingBounds3D():
return $default(_that.minX,_that.minY,_that.minZ,_that.maxX,_that.maxY,_that.maxZ);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minX,  double minY,  double minZ,  double maxX,  double maxY,  double maxZ)?  $default,) {final _that = this;
switch (_that) {
case _BuildingBounds3D() when $default != null:
return $default(_that.minX,_that.minY,_that.minZ,_that.maxX,_that.maxY,_that.maxZ);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildingBounds3D extends BuildingBounds3D {
  const _BuildingBounds3D({required this.minX, required this.minY, required this.minZ, required this.maxX, required this.maxY, required this.maxZ}): super._();
  factory _BuildingBounds3D.fromJson(Map<String, dynamic> json) => _$BuildingBounds3DFromJson(json);

@override final  double minX;
@override final  double minY;
@override final  double minZ;
@override final  double maxX;
@override final  double maxY;
@override final  double maxZ;

/// Create a copy of BuildingBounds3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildingBounds3DCopyWith<_BuildingBounds3D> get copyWith => __$BuildingBounds3DCopyWithImpl<_BuildingBounds3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingBounds3DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildingBounds3D&&(identical(other.minX, minX) || other.minX == minX)&&(identical(other.minY, minY) || other.minY == minY)&&(identical(other.minZ, minZ) || other.minZ == minZ)&&(identical(other.maxX, maxX) || other.maxX == maxX)&&(identical(other.maxY, maxY) || other.maxY == maxY)&&(identical(other.maxZ, maxZ) || other.maxZ == maxZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minX,minY,minZ,maxX,maxY,maxZ);
}

@override
String toString() {
    return 'BuildingBounds3D(minX: $minX, minY: $minY, minZ: $minZ, maxX: $maxX, maxY: $maxY, maxZ: $maxZ)';
}


}

/// @nodoc
abstract mixin class _$BuildingBounds3DCopyWith<$Res> implements $BuildingBounds3DCopyWith<$Res> {
  factory _$BuildingBounds3DCopyWith(_BuildingBounds3D value, $Res Function(_BuildingBounds3D) _then) = __$BuildingBounds3DCopyWithImpl;
@override @useResult
$Res call({
 double minX, double minY, double minZ, double maxX, double maxY, double maxZ
});




}
/// @nodoc
class __$BuildingBounds3DCopyWithImpl<$Res>
    implements _$BuildingBounds3DCopyWith<$Res> {
  __$BuildingBounds3DCopyWithImpl(this._self, this._then);

  final _BuildingBounds3D _self;
  final $Res Function(_BuildingBounds3D) _then;

/// Create a copy of BuildingBounds3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minX = null,Object? minY = null,Object? minZ = null,Object? maxX = null,Object? maxY = null,Object? maxZ = null,}) {
  return _then(_BuildingBounds3D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,minZ: null == minZ ? _self.minZ : minZ // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,maxZ: null == maxZ ? _self.maxZ : maxZ // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$Vector3D {

 double get x; double get y; double get z;
/// Create a copy of Vector3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Vector3DCopyWith<Vector3D> get copyWith => _$Vector3DCopyWithImpl<Vector3D>(this as Vector3D, _$identity);

  /// Serializes this Vector3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Vector3D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vector3D&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y)&&(identical(other.z, _this.z) || other.z == _this.z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Vector3D;
  return Object.hash(runtimeType,_this.x,_this.y,_this.z);
}

@override
String toString() {
  final _this = this as Vector3D;
  return 'Vector3D(x: ${_this.x}, y: ${_this.y}, z: ${_this.z})';
}


}

/// @nodoc
abstract mixin class $Vector3DCopyWith<$Res>  {
  factory $Vector3DCopyWith(Vector3D value, $Res Function(Vector3D) _then) = _$Vector3DCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z
});




}
/// @nodoc
class _$Vector3DCopyWithImpl<$Res>
    implements $Vector3DCopyWith<$Res> {
  _$Vector3DCopyWithImpl(this._self, this._then);

  final Vector3D _self;
  final $Res Function(Vector3D) _then;

/// Create a copy of Vector3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(Vector3D(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Vector3D].
extension Vector3DPatterns on Vector3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vector3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vector3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vector3D value)  $default,){
final _that = this;
switch (_that) {
case _Vector3D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vector3D value)?  $default,){
final _that = this;
switch (_that) {
case _Vector3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  double z)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vector3D() when $default != null:
return $default(_that.x,_that.y,_that.z);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  double z)  $default,) {final _that = this;
switch (_that) {
case _Vector3D():
return $default(_that.x,_that.y,_that.z);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  double z)?  $default,) {final _that = this;
switch (_that) {
case _Vector3D() when $default != null:
return $default(_that.x,_that.y,_that.z);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vector3D extends Vector3D {
  const _Vector3D({required this.x, required this.y, required this.z}): super._();
  factory _Vector3D.fromJson(Map<String, dynamic> json) => _$Vector3DFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;

/// Create a copy of Vector3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Vector3DCopyWith<_Vector3D> get copyWith => __$Vector3DCopyWithImpl<_Vector3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Vector3DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vector3D&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y,z);
}

@override
String toString() {
    return 'Vector3D(x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class _$Vector3DCopyWith<$Res> implements $Vector3DCopyWith<$Res> {
  factory _$Vector3DCopyWith(_Vector3D value, $Res Function(_Vector3D) _then) = __$Vector3DCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z
});




}
/// @nodoc
class __$Vector3DCopyWithImpl<$Res>
    implements _$Vector3DCopyWith<$Res> {
  __$Vector3DCopyWithImpl(this._self, this._then);

  final _Vector3D _self;
  final $Res Function(_Vector3D) _then;

/// Create a copy of Vector3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(_Vector3D(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$Floor3D {

 int get index; String get name; double get elevation; double get height; List<Room3D> get rooms; FloorBounds3D get bounds; String get modelNodeName; bool get hasInterior; Map<String, dynamic> get properties;
/// Create a copy of Floor3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Floor3DCopyWith<Floor3D> get copyWith => _$Floor3DCopyWithImpl<Floor3D>(this as Floor3D, _$identity);

  /// Serializes this Floor3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Floor3D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Floor3D&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.elevation, _this.elevation) || other.elevation == _this.elevation)&&(identical(other.height, _this.height) || other.height == _this.height)&&const DeepCollectionEquality().equals(other.rooms, _this.rooms)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds)&&(identical(other.modelNodeName, _this.modelNodeName) || other.modelNodeName == _this.modelNodeName)&&(identical(other.hasInterior, _this.hasInterior) || other.hasInterior == _this.hasInterior)&&const DeepCollectionEquality().equals(other.properties, _this.properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Floor3D;
  return Object.hash(runtimeType,_this.index,_this.name,_this.elevation,_this.height,const DeepCollectionEquality().hash(_this.rooms),_this.bounds,_this.modelNodeName,_this.hasInterior,const DeepCollectionEquality().hash(_this.properties));
}

@override
String toString() {
  final _this = this as Floor3D;
  return 'Floor3D(index: ${_this.index}, name: ${_this.name}, elevation: ${_this.elevation}, height: ${_this.height}, rooms: ${_this.rooms}, bounds: ${_this.bounds}, modelNodeName: ${_this.modelNodeName}, hasInterior: ${_this.hasInterior}, properties: ${_this.properties})';
}


}

/// @nodoc
abstract mixin class $Floor3DCopyWith<$Res>  {
  factory $Floor3DCopyWith(Floor3D value, $Res Function(Floor3D) _then) = _$Floor3DCopyWithImpl;
@useResult
$Res call({
 int index, String name, double elevation, double height, List<Room3D> rooms, FloorBounds3D bounds, String modelNodeName, bool hasInterior, Map<String, dynamic> properties
});


$FloorBounds3DCopyWith<$Res> get bounds;

}
/// @nodoc
class _$Floor3DCopyWithImpl<$Res>
    implements $Floor3DCopyWith<$Res> {
  _$Floor3DCopyWithImpl(this._self, this._then);

  final Floor3D _self;
  final $Res Function(Floor3D) _then;

/// Create a copy of Floor3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? name = null,Object? elevation = null,Object? height = null,Object? rooms = null,Object? bounds = null,Object? modelNodeName = null,Object? hasInterior = null,Object? properties = null,}) {
  return _then(Floor3D(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room3D>,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as FloorBounds3D,modelNodeName: null == modelNodeName ? _self.modelNodeName : modelNodeName // ignore: cast_nullable_to_non_nullable
as String,hasInterior: null == hasInterior ? _self.hasInterior : hasInterior // ignore: cast_nullable_to_non_nullable
as bool,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of Floor3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FloorBounds3DCopyWith<$Res> get bounds {
  
  return $FloorBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [Floor3D].
extension Floor3DPatterns on Floor3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Floor3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Floor3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Floor3D value)  $default,){
final _that = this;
switch (_that) {
case _Floor3D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Floor3D value)?  $default,){
final _that = this;
switch (_that) {
case _Floor3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String name,  double elevation,  double height,  List<Room3D> rooms,  FloorBounds3D bounds,  String modelNodeName,  bool hasInterior,  Map<String, dynamic> properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Floor3D() when $default != null:
return $default(_that.index,_that.name,_that.elevation,_that.height,_that.rooms,_that.bounds,_that.modelNodeName,_that.hasInterior,_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String name,  double elevation,  double height,  List<Room3D> rooms,  FloorBounds3D bounds,  String modelNodeName,  bool hasInterior,  Map<String, dynamic> properties)  $default,) {final _that = this;
switch (_that) {
case _Floor3D():
return $default(_that.index,_that.name,_that.elevation,_that.height,_that.rooms,_that.bounds,_that.modelNodeName,_that.hasInterior,_that.properties);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String name,  double elevation,  double height,  List<Room3D> rooms,  FloorBounds3D bounds,  String modelNodeName,  bool hasInterior,  Map<String, dynamic> properties)?  $default,) {final _that = this;
switch (_that) {
case _Floor3D() when $default != null:
return $default(_that.index,_that.name,_that.elevation,_that.height,_that.rooms,_that.bounds,_that.modelNodeName,_that.hasInterior,_that.properties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Floor3D implements Floor3D {
  const _Floor3D({required this.index, required this.name, required this.elevation, required this.height, required  List<Room3D> rooms, required this.bounds, required this.modelNodeName, required this.hasInterior, required  Map<String, dynamic> properties}): _rooms = rooms,_properties = properties;
  factory _Floor3D.fromJson(Map<String, dynamic> json) => _$Floor3DFromJson(json);

@override final  int index;
@override final  String name;
@override final  double elevation;
@override final  double height;
 final  List<Room3D> _rooms;
@override List<Room3D> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}

@override final  FloorBounds3D bounds;
@override final  String modelNodeName;
@override final  bool hasInterior;
 final  Map<String, dynamic> _properties;
@override Map<String, dynamic> get properties {
  if (_properties is EqualUnmodifiableMapView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_properties);
}


/// Create a copy of Floor3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Floor3DCopyWith<_Floor3D> get copyWith => __$Floor3DCopyWithImpl<_Floor3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Floor3DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Floor3D&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.rooms, _rooms)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.modelNodeName, modelNodeName) || other.modelNodeName == modelNodeName)&&(identical(other.hasInterior, hasInterior) || other.hasInterior == hasInterior)&&const DeepCollectionEquality().equals(other.properties, _properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,index,name,elevation,height,const DeepCollectionEquality().hash(_rooms),bounds,modelNodeName,hasInterior,const DeepCollectionEquality().hash(_properties));
}

@override
String toString() {
    return 'Floor3D(index: $index, name: $name, elevation: $elevation, height: $height, rooms: $rooms, bounds: $bounds, modelNodeName: $modelNodeName, hasInterior: $hasInterior, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$Floor3DCopyWith<$Res> implements $Floor3DCopyWith<$Res> {
  factory _$Floor3DCopyWith(_Floor3D value, $Res Function(_Floor3D) _then) = __$Floor3DCopyWithImpl;
@override @useResult
$Res call({
 int index, String name, double elevation, double height, List<Room3D> rooms, FloorBounds3D bounds, String modelNodeName, bool hasInterior, Map<String, dynamic> properties
});


@override $FloorBounds3DCopyWith<$Res> get bounds;

}
/// @nodoc
class __$Floor3DCopyWithImpl<$Res>
    implements _$Floor3DCopyWith<$Res> {
  __$Floor3DCopyWithImpl(this._self, this._then);

  final _Floor3D _self;
  final $Res Function(_Floor3D) _then;

/// Create a copy of Floor3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? name = null,Object? elevation = null,Object? height = null,Object? rooms = null,Object? bounds = null,Object? modelNodeName = null,Object? hasInterior = null,Object? properties = null,}) {
  return _then(_Floor3D(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room3D>,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as FloorBounds3D,modelNodeName: null == modelNodeName ? _self.modelNodeName : modelNodeName // ignore: cast_nullable_to_non_nullable
as String,hasInterior: null == hasInterior ? _self.hasInterior : hasInterior // ignore: cast_nullable_to_non_nullable
as bool,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of Floor3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FloorBounds3DCopyWith<$Res> get bounds {
  
  return $FloorBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// @nodoc
mixin _$FloorBounds3D {

 double get minX; double get minY; double get maxX; double get maxY; double get minZ; double get maxZ;
/// Create a copy of FloorBounds3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorBounds3DCopyWith<FloorBounds3D> get copyWith => _$FloorBounds3DCopyWithImpl<FloorBounds3D>(this as FloorBounds3D, _$identity);

  /// Serializes this FloorBounds3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FloorBounds3D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorBounds3D&&(identical(other.minX, _this.minX) || other.minX == _this.minX)&&(identical(other.minY, _this.minY) || other.minY == _this.minY)&&(identical(other.maxX, _this.maxX) || other.maxX == _this.maxX)&&(identical(other.maxY, _this.maxY) || other.maxY == _this.maxY)&&(identical(other.minZ, _this.minZ) || other.minZ == _this.minZ)&&(identical(other.maxZ, _this.maxZ) || other.maxZ == _this.maxZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FloorBounds3D;
  return Object.hash(runtimeType,_this.minX,_this.minY,_this.maxX,_this.maxY,_this.minZ,_this.maxZ);
}

@override
String toString() {
  final _this = this as FloorBounds3D;
  return 'FloorBounds3D(minX: ${_this.minX}, minY: ${_this.minY}, maxX: ${_this.maxX}, maxY: ${_this.maxY}, minZ: ${_this.minZ}, maxZ: ${_this.maxZ})';
}


}

/// @nodoc
abstract mixin class $FloorBounds3DCopyWith<$Res>  {
  factory $FloorBounds3DCopyWith(FloorBounds3D value, $Res Function(FloorBounds3D) _then) = _$FloorBounds3DCopyWithImpl;
@useResult
$Res call({
 double minX, double minY, double maxX, double maxY, double minZ, double maxZ
});




}
/// @nodoc
class _$FloorBounds3DCopyWithImpl<$Res>
    implements $FloorBounds3DCopyWith<$Res> {
  _$FloorBounds3DCopyWithImpl(this._self, this._then);

  final FloorBounds3D _self;
  final $Res Function(FloorBounds3D) _then;

/// Create a copy of FloorBounds3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minX = null,Object? minY = null,Object? maxX = null,Object? maxY = null,Object? minZ = null,Object? maxZ = null,}) {
  return _then(FloorBounds3D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,minZ: null == minZ ? _self.minZ : minZ // ignore: cast_nullable_to_non_nullable
as double,maxZ: null == maxZ ? _self.maxZ : maxZ // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FloorBounds3D].
extension FloorBounds3DPatterns on FloorBounds3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FloorBounds3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FloorBounds3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FloorBounds3D value)  $default,){
final _that = this;
switch (_that) {
case _FloorBounds3D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FloorBounds3D value)?  $default,){
final _that = this;
switch (_that) {
case _FloorBounds3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minX,  double minY,  double maxX,  double maxY,  double minZ,  double maxZ)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FloorBounds3D() when $default != null:
return $default(_that.minX,_that.minY,_that.maxX,_that.maxY,_that.minZ,_that.maxZ);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minX,  double minY,  double maxX,  double maxY,  double minZ,  double maxZ)  $default,) {final _that = this;
switch (_that) {
case _FloorBounds3D():
return $default(_that.minX,_that.minY,_that.maxX,_that.maxY,_that.minZ,_that.maxZ);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minX,  double minY,  double maxX,  double maxY,  double minZ,  double maxZ)?  $default,) {final _that = this;
switch (_that) {
case _FloorBounds3D() when $default != null:
return $default(_that.minX,_that.minY,_that.maxX,_that.maxY,_that.minZ,_that.maxZ);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FloorBounds3D extends FloorBounds3D {
  const _FloorBounds3D({required this.minX, required this.minY, required this.maxX, required this.maxY, required this.minZ, required this.maxZ}): super._();
  factory _FloorBounds3D.fromJson(Map<String, dynamic> json) => _$FloorBounds3DFromJson(json);

@override final  double minX;
@override final  double minY;
@override final  double maxX;
@override final  double maxY;
@override final  double minZ;
@override final  double maxZ;

/// Create a copy of FloorBounds3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorBounds3DCopyWith<_FloorBounds3D> get copyWith => __$FloorBounds3DCopyWithImpl<_FloorBounds3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FloorBounds3DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloorBounds3D&&(identical(other.minX, minX) || other.minX == minX)&&(identical(other.minY, minY) || other.minY == minY)&&(identical(other.maxX, maxX) || other.maxX == maxX)&&(identical(other.maxY, maxY) || other.maxY == maxY)&&(identical(other.minZ, minZ) || other.minZ == minZ)&&(identical(other.maxZ, maxZ) || other.maxZ == maxZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minX,minY,maxX,maxY,minZ,maxZ);
}

@override
String toString() {
    return 'FloorBounds3D(minX: $minX, minY: $minY, maxX: $maxX, maxY: $maxY, minZ: $minZ, maxZ: $maxZ)';
}


}

/// @nodoc
abstract mixin class _$FloorBounds3DCopyWith<$Res> implements $FloorBounds3DCopyWith<$Res> {
  factory _$FloorBounds3DCopyWith(_FloorBounds3D value, $Res Function(_FloorBounds3D) _then) = __$FloorBounds3DCopyWithImpl;
@override @useResult
$Res call({
 double minX, double minY, double maxX, double maxY, double minZ, double maxZ
});




}
/// @nodoc
class __$FloorBounds3DCopyWithImpl<$Res>
    implements _$FloorBounds3DCopyWith<$Res> {
  __$FloorBounds3DCopyWithImpl(this._self, this._then);

  final _FloorBounds3D _self;
  final $Res Function(_FloorBounds3D) _then;

/// Create a copy of FloorBounds3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minX = null,Object? minY = null,Object? maxX = null,Object? maxY = null,Object? minZ = null,Object? maxZ = null,}) {
  return _then(_FloorBounds3D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,minZ: null == minZ ? _self.minZ : minZ // ignore: cast_nullable_to_non_nullable
as double,maxZ: null == maxZ ? _self.maxZ : maxZ // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$Room3D {

 String get id; String get buildingId; int get floorIndex; String get name; String get number; RoomCategory get category; RoomBounds3D get bounds; String get meshName; Vector3D get centroid; List<Vector3D> get polygon; Map<String, dynamic> get properties; bool get isAccessible; bool get isEmergencyExit; bool get isAssemblyPoint;
/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Room3DCopyWith<Room3D> get copyWith => _$Room3DCopyWithImpl<Room3D>(this as Room3D, _$identity);

  /// Serializes this Room3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Room3D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Room3D&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorIndex, _this.floorIndex) || other.floorIndex == _this.floorIndex)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds)&&(identical(other.meshName, _this.meshName) || other.meshName == _this.meshName)&&(identical(other.centroid, _this.centroid) || other.centroid == _this.centroid)&&const DeepCollectionEquality().equals(other.polygon, _this.polygon)&&const DeepCollectionEquality().equals(other.properties, _this.properties)&&(identical(other.isAccessible, _this.isAccessible) || other.isAccessible == _this.isAccessible)&&(identical(other.isEmergencyExit, _this.isEmergencyExit) || other.isEmergencyExit == _this.isEmergencyExit)&&(identical(other.isAssemblyPoint, _this.isAssemblyPoint) || other.isAssemblyPoint == _this.isAssemblyPoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Room3D;
  return Object.hash(runtimeType,_this.id,_this.buildingId,_this.floorIndex,_this.name,_this.number,_this.category,_this.bounds,_this.meshName,_this.centroid,const DeepCollectionEquality().hash(_this.polygon),const DeepCollectionEquality().hash(_this.properties),_this.isAccessible,_this.isEmergencyExit,_this.isAssemblyPoint);
}

@override
String toString() {
  final _this = this as Room3D;
  return 'Room3D(id: ${_this.id}, buildingId: ${_this.buildingId}, floorIndex: ${_this.floorIndex}, name: ${_this.name}, number: ${_this.number}, category: ${_this.category}, bounds: ${_this.bounds}, meshName: ${_this.meshName}, centroid: ${_this.centroid}, polygon: ${_this.polygon}, properties: ${_this.properties}, isAccessible: ${_this.isAccessible}, isEmergencyExit: ${_this.isEmergencyExit}, isAssemblyPoint: ${_this.isAssemblyPoint})';
}


}

/// @nodoc
abstract mixin class $Room3DCopyWith<$Res>  {
  factory $Room3DCopyWith(Room3D value, $Res Function(Room3D) _then) = _$Room3DCopyWithImpl;
@useResult
$Res call({
 String id, String buildingId, int floorIndex, String name, String number, RoomCategory category, RoomBounds3D bounds, String meshName, Vector3D centroid, List<Vector3D> polygon, Map<String, dynamic> properties, bool isAccessible, bool isEmergencyExit, bool isAssemblyPoint
});


$RoomCategoryCopyWith<$Res> get category;$RoomBounds3DCopyWith<$Res> get bounds;$Vector3DCopyWith<$Res> get centroid;

}
/// @nodoc
class _$Room3DCopyWithImpl<$Res>
    implements $Room3DCopyWith<$Res> {
  _$Room3DCopyWithImpl(this._self, this._then);

  final Room3D _self;
  final $Res Function(Room3D) _then;

/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? buildingId = null,Object? floorIndex = null,Object? name = null,Object? number = null,Object? category = null,Object? bounds = null,Object? meshName = null,Object? centroid = null,Object? polygon = null,Object? properties = null,Object? isAccessible = null,Object? isEmergencyExit = null,Object? isAssemblyPoint = null,}) {
  return _then(Room3D(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorIndex: null == floorIndex ? _self.floorIndex : floorIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoomCategory,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as RoomBounds3D,meshName: null == meshName ? _self.meshName : meshName // ignore: cast_nullable_to_non_nullable
as String,centroid: null == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Vector3D,polygon: null == polygon ? _self.polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<Vector3D>,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isAccessible: null == isAccessible ? _self.isAccessible : isAccessible // ignore: cast_nullable_to_non_nullable
as bool,isEmergencyExit: null == isEmergencyExit ? _self.isEmergencyExit : isEmergencyExit // ignore: cast_nullable_to_non_nullable
as bool,isAssemblyPoint: null == isAssemblyPoint ? _self.isAssemblyPoint : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCategoryCopyWith<$Res> get category {
  
  return $RoomCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomBounds3DCopyWith<$Res> get bounds {
  
  return $RoomBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get centroid {
  
  return $Vector3DCopyWith<$Res>(_self.centroid, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}
}


/// Adds pattern-matching-related methods to [Room3D].
extension Room3DPatterns on Room3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Room3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Room3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Room3D value)  $default,){
final _that = this;
switch (_that) {
case _Room3D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Room3D value)?  $default,){
final _that = this;
switch (_that) {
case _Room3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String buildingId,  int floorIndex,  String name,  String number,  RoomCategory category,  RoomBounds3D bounds,  String meshName,  Vector3D centroid,  List<Vector3D> polygon,  Map<String, dynamic> properties,  bool isAccessible,  bool isEmergencyExit,  bool isAssemblyPoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Room3D() when $default != null:
return $default(_that.id,_that.buildingId,_that.floorIndex,_that.name,_that.number,_that.category,_that.bounds,_that.meshName,_that.centroid,_that.polygon,_that.properties,_that.isAccessible,_that.isEmergencyExit,_that.isAssemblyPoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String buildingId,  int floorIndex,  String name,  String number,  RoomCategory category,  RoomBounds3D bounds,  String meshName,  Vector3D centroid,  List<Vector3D> polygon,  Map<String, dynamic> properties,  bool isAccessible,  bool isEmergencyExit,  bool isAssemblyPoint)  $default,) {final _that = this;
switch (_that) {
case _Room3D():
return $default(_that.id,_that.buildingId,_that.floorIndex,_that.name,_that.number,_that.category,_that.bounds,_that.meshName,_that.centroid,_that.polygon,_that.properties,_that.isAccessible,_that.isEmergencyExit,_that.isAssemblyPoint);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String buildingId,  int floorIndex,  String name,  String number,  RoomCategory category,  RoomBounds3D bounds,  String meshName,  Vector3D centroid,  List<Vector3D> polygon,  Map<String, dynamic> properties,  bool isAccessible,  bool isEmergencyExit,  bool isAssemblyPoint)?  $default,) {final _that = this;
switch (_that) {
case _Room3D() when $default != null:
return $default(_that.id,_that.buildingId,_that.floorIndex,_that.name,_that.number,_that.category,_that.bounds,_that.meshName,_that.centroid,_that.polygon,_that.properties,_that.isAccessible,_that.isEmergencyExit,_that.isAssemblyPoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Room3D extends Room3D {
  const _Room3D({required this.id, required this.buildingId, required this.floorIndex, required this.name, required this.number, required this.category, required this.bounds, required this.meshName, required this.centroid, required  List<Vector3D> polygon, required  Map<String, dynamic> properties, required this.isAccessible, required this.isEmergencyExit, required this.isAssemblyPoint}): _polygon = polygon,_properties = properties,super._();
  factory _Room3D.fromJson(Map<String, dynamic> json) => _$Room3DFromJson(json);

@override final  String id;
@override final  String buildingId;
@override final  int floorIndex;
@override final  String name;
@override final  String number;
@override final  RoomCategory category;
@override final  RoomBounds3D bounds;
@override final  String meshName;
@override final  Vector3D centroid;
 final  List<Vector3D> _polygon;
@override List<Vector3D> get polygon {
  if (_polygon is EqualUnmodifiableListView) return _polygon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_polygon);
}

 final  Map<String, dynamic> _properties;
@override Map<String, dynamic> get properties {
  if (_properties is EqualUnmodifiableMapView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_properties);
}

@override final  bool isAccessible;
@override final  bool isEmergencyExit;
@override final  bool isAssemblyPoint;

/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Room3DCopyWith<_Room3D> get copyWith => __$Room3DCopyWithImpl<_Room3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Room3DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Room3D&&(identical(other.id, id) || other.id == id)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorIndex, floorIndex) || other.floorIndex == floorIndex)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.category, category) || other.category == category)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.meshName, meshName) || other.meshName == meshName)&&(identical(other.centroid, centroid) || other.centroid == centroid)&&const DeepCollectionEquality().equals(other.polygon, _polygon)&&const DeepCollectionEquality().equals(other.properties, _properties)&&(identical(other.isAccessible, isAccessible) || other.isAccessible == isAccessible)&&(identical(other.isEmergencyExit, isEmergencyExit) || other.isEmergencyExit == isEmergencyExit)&&(identical(other.isAssemblyPoint, isAssemblyPoint) || other.isAssemblyPoint == isAssemblyPoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,buildingId,floorIndex,name,number,category,bounds,meshName,centroid,const DeepCollectionEquality().hash(_polygon),const DeepCollectionEquality().hash(_properties),isAccessible,isEmergencyExit,isAssemblyPoint);
}

@override
String toString() {
    return 'Room3D(id: $id, buildingId: $buildingId, floorIndex: $floorIndex, name: $name, number: $number, category: $category, bounds: $bounds, meshName: $meshName, centroid: $centroid, polygon: $polygon, properties: $properties, isAccessible: $isAccessible, isEmergencyExit: $isEmergencyExit, isAssemblyPoint: $isAssemblyPoint)';
}


}

/// @nodoc
abstract mixin class _$Room3DCopyWith<$Res> implements $Room3DCopyWith<$Res> {
  factory _$Room3DCopyWith(_Room3D value, $Res Function(_Room3D) _then) = __$Room3DCopyWithImpl;
@override @useResult
$Res call({
 String id, String buildingId, int floorIndex, String name, String number, RoomCategory category, RoomBounds3D bounds, String meshName, Vector3D centroid, List<Vector3D> polygon, Map<String, dynamic> properties, bool isAccessible, bool isEmergencyExit, bool isAssemblyPoint
});


@override $RoomCategoryCopyWith<$Res> get category;@override $RoomBounds3DCopyWith<$Res> get bounds;@override $Vector3DCopyWith<$Res> get centroid;

}
/// @nodoc
class __$Room3DCopyWithImpl<$Res>
    implements _$Room3DCopyWith<$Res> {
  __$Room3DCopyWithImpl(this._self, this._then);

  final _Room3D _self;
  final $Res Function(_Room3D) _then;

/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? buildingId = null,Object? floorIndex = null,Object? name = null,Object? number = null,Object? category = null,Object? bounds = null,Object? meshName = null,Object? centroid = null,Object? polygon = null,Object? properties = null,Object? isAccessible = null,Object? isEmergencyExit = null,Object? isAssemblyPoint = null,}) {
  return _then(_Room3D(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorIndex: null == floorIndex ? _self.floorIndex : floorIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoomCategory,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as RoomBounds3D,meshName: null == meshName ? _self.meshName : meshName // ignore: cast_nullable_to_non_nullable
as String,centroid: null == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Vector3D,polygon: null == polygon ? _self._polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<Vector3D>,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isAccessible: null == isAccessible ? _self.isAccessible : isAccessible // ignore: cast_nullable_to_non_nullable
as bool,isEmergencyExit: null == isEmergencyExit ? _self.isEmergencyExit : isEmergencyExit // ignore: cast_nullable_to_non_nullable
as bool,isAssemblyPoint: null == isAssemblyPoint ? _self.isAssemblyPoint : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCategoryCopyWith<$Res> get category {
  
  return $RoomCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomBounds3DCopyWith<$Res> get bounds {
  
  return $RoomBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of Room3D
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get centroid {
  
  return $Vector3DCopyWith<$Res>(_self.centroid, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}
}

RoomCategory _$RoomCategoryFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'classroom':
          return Classroom.fromJson(
            json
          );
                case 'laboratory':
          return Laboratory.fromJson(
            json
          );
                case 'office':
          return Office.fromJson(
            json
          );
                case 'library':
          return Library.fromJson(
            json
          );
                case 'auditorium':
          return Auditorium.fromJson(
            json
          );
                case 'gymnasium':
          return Gymnasium.fromJson(
            json
          );
                case 'cafeteria':
          return Cafeteria.fromJson(
            json
          );
                case 'restroom':
          return Restroom.fromJson(
            json
          );
                case 'corridor':
          return Corridor.fromJson(
            json
          );
                case 'stairs':
          return Stairs.fromJson(
            json
          );
                case 'elevator':
          return Elevator.fromJson(
            json
          );
                case 'utility':
          return Utility.fromJson(
            json
          );
                case 'storage':
          return Storage.fromJson(
            json
          );
                case 'other':
          return Other.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'RoomCategory',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$RoomCategory {



  /// Serializes this RoomCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomCategory);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory()';
}


}

/// @nodoc
class $RoomCategoryCopyWith<$Res>  {
$RoomCategoryCopyWith(RoomCategory _, $Res Function(RoomCategory) __);
}


/// Adds pattern-matching-related methods to [RoomCategory].
extension RoomCategoryPatterns on RoomCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Classroom value)?  classroom,TResult Function( Laboratory value)?  laboratory,TResult Function( Office value)?  office,TResult Function( Library value)?  library,TResult Function( Auditorium value)?  auditorium,TResult Function( Gymnasium value)?  gymnasium,TResult Function( Cafeteria value)?  cafeteria,TResult Function( Restroom value)?  restroom,TResult Function( Corridor value)?  corridor,TResult Function( Stairs value)?  stairs,TResult Function( Elevator value)?  elevator,TResult Function( Utility value)?  utility,TResult Function( Storage value)?  storage,TResult Function( Other value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Classroom() when classroom != null:
return classroom(_that);case Laboratory() when laboratory != null:
return laboratory(_that);case Office() when office != null:
return office(_that);case Library() when library != null:
return library(_that);case Auditorium() when auditorium != null:
return auditorium(_that);case Gymnasium() when gymnasium != null:
return gymnasium(_that);case Cafeteria() when cafeteria != null:
return cafeteria(_that);case Restroom() when restroom != null:
return restroom(_that);case Corridor() when corridor != null:
return corridor(_that);case Stairs() when stairs != null:
return stairs(_that);case Elevator() when elevator != null:
return elevator(_that);case Utility() when utility != null:
return utility(_that);case Storage() when storage != null:
return storage(_that);case Other() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Classroom value)  classroom,required TResult Function( Laboratory value)  laboratory,required TResult Function( Office value)  office,required TResult Function( Library value)  library,required TResult Function( Auditorium value)  auditorium,required TResult Function( Gymnasium value)  gymnasium,required TResult Function( Cafeteria value)  cafeteria,required TResult Function( Restroom value)  restroom,required TResult Function( Corridor value)  corridor,required TResult Function( Stairs value)  stairs,required TResult Function( Elevator value)  elevator,required TResult Function( Utility value)  utility,required TResult Function( Storage value)  storage,required TResult Function( Other value)  other,}){
final _that = this;
switch (_that) {
case Classroom():
return classroom(_that);case Laboratory():
return laboratory(_that);case Office():
return office(_that);case Library():
return library(_that);case Auditorium():
return auditorium(_that);case Gymnasium():
return gymnasium(_that);case Cafeteria():
return cafeteria(_that);case Restroom():
return restroom(_that);case Corridor():
return corridor(_that);case Stairs():
return stairs(_that);case Elevator():
return elevator(_that);case Utility():
return utility(_that);case Storage():
return storage(_that);case Other():
return other(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Classroom value)?  classroom,TResult? Function( Laboratory value)?  laboratory,TResult? Function( Office value)?  office,TResult? Function( Library value)?  library,TResult? Function( Auditorium value)?  auditorium,TResult? Function( Gymnasium value)?  gymnasium,TResult? Function( Cafeteria value)?  cafeteria,TResult? Function( Restroom value)?  restroom,TResult? Function( Corridor value)?  corridor,TResult? Function( Stairs value)?  stairs,TResult? Function( Elevator value)?  elevator,TResult? Function( Utility value)?  utility,TResult? Function( Storage value)?  storage,TResult? Function( Other value)?  other,}){
final _that = this;
switch (_that) {
case Classroom() when classroom != null:
return classroom(_that);case Laboratory() when laboratory != null:
return laboratory(_that);case Office() when office != null:
return office(_that);case Library() when library != null:
return library(_that);case Auditorium() when auditorium != null:
return auditorium(_that);case Gymnasium() when gymnasium != null:
return gymnasium(_that);case Cafeteria() when cafeteria != null:
return cafeteria(_that);case Restroom() when restroom != null:
return restroom(_that);case Corridor() when corridor != null:
return corridor(_that);case Stairs() when stairs != null:
return stairs(_that);case Elevator() when elevator != null:
return elevator(_that);case Utility() when utility != null:
return utility(_that);case Storage() when storage != null:
return storage(_that);case Other() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  classroom,TResult Function()?  laboratory,TResult Function()?  office,TResult Function()?  library,TResult Function()?  auditorium,TResult Function()?  gymnasium,TResult Function()?  cafeteria,TResult Function()?  restroom,TResult Function()?  corridor,TResult Function()?  stairs,TResult Function()?  elevator,TResult Function()?  utility,TResult Function()?  storage,TResult Function( String label)?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Classroom() when classroom != null:
return classroom();case Laboratory() when laboratory != null:
return laboratory();case Office() when office != null:
return office();case Library() when library != null:
return library();case Auditorium() when auditorium != null:
return auditorium();case Gymnasium() when gymnasium != null:
return gymnasium();case Cafeteria() when cafeteria != null:
return cafeteria();case Restroom() when restroom != null:
return restroom();case Corridor() when corridor != null:
return corridor();case Stairs() when stairs != null:
return stairs();case Elevator() when elevator != null:
return elevator();case Utility() when utility != null:
return utility();case Storage() when storage != null:
return storage();case Other() when other != null:
return other(_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  classroom,required TResult Function()  laboratory,required TResult Function()  office,required TResult Function()  library,required TResult Function()  auditorium,required TResult Function()  gymnasium,required TResult Function()  cafeteria,required TResult Function()  restroom,required TResult Function()  corridor,required TResult Function()  stairs,required TResult Function()  elevator,required TResult Function()  utility,required TResult Function()  storage,required TResult Function( String label)  other,}) {final _that = this;
switch (_that) {
case Classroom():
return classroom();case Laboratory():
return laboratory();case Office():
return office();case Library():
return library();case Auditorium():
return auditorium();case Gymnasium():
return gymnasium();case Cafeteria():
return cafeteria();case Restroom():
return restroom();case Corridor():
return corridor();case Stairs():
return stairs();case Elevator():
return elevator();case Utility():
return utility();case Storage():
return storage();case Other():
return other(_that.label);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  classroom,TResult? Function()?  laboratory,TResult? Function()?  office,TResult? Function()?  library,TResult? Function()?  auditorium,TResult? Function()?  gymnasium,TResult? Function()?  cafeteria,TResult? Function()?  restroom,TResult? Function()?  corridor,TResult? Function()?  stairs,TResult? Function()?  elevator,TResult? Function()?  utility,TResult? Function()?  storage,TResult? Function( String label)?  other,}) {final _that = this;
switch (_that) {
case Classroom() when classroom != null:
return classroom();case Laboratory() when laboratory != null:
return laboratory();case Office() when office != null:
return office();case Library() when library != null:
return library();case Auditorium() when auditorium != null:
return auditorium();case Gymnasium() when gymnasium != null:
return gymnasium();case Cafeteria() when cafeteria != null:
return cafeteria();case Restroom() when restroom != null:
return restroom();case Corridor() when corridor != null:
return corridor();case Stairs() when stairs != null:
return stairs();case Elevator() when elevator != null:
return elevator();case Utility() when utility != null:
return utility();case Storage() when storage != null:
return storage();case Other() when other != null:
return other(_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class Classroom extends RoomCategory {
  const Classroom({ String? $type}): $type = $type ?? 'classroom',super._();
  factory Classroom.fromJson(Map<String, dynamic> json) => _$ClassroomFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$ClassroomToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Classroom);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.classroom()';
}


}




/// @nodoc
@JsonSerializable()

class Laboratory extends RoomCategory {
  const Laboratory({ String? $type}): $type = $type ?? 'laboratory',super._();
  factory Laboratory.fromJson(Map<String, dynamic> json) => _$LaboratoryFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LaboratoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Laboratory);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.laboratory()';
}


}




/// @nodoc
@JsonSerializable()

class Office extends RoomCategory {
  const Office({ String? $type}): $type = $type ?? 'office',super._();
  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$OfficeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Office);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.office()';
}


}




/// @nodoc
@JsonSerializable()

class Library extends RoomCategory {
  const Library({ String? $type}): $type = $type ?? 'library',super._();
  factory Library.fromJson(Map<String, dynamic> json) => _$LibraryFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LibraryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Library);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.library()';
}


}




/// @nodoc
@JsonSerializable()

class Auditorium extends RoomCategory {
  const Auditorium({ String? $type}): $type = $type ?? 'auditorium',super._();
  factory Auditorium.fromJson(Map<String, dynamic> json) => _$AuditoriumFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$AuditoriumToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Auditorium);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.auditorium()';
}


}




/// @nodoc
@JsonSerializable()

class Gymnasium extends RoomCategory {
  const Gymnasium({ String? $type}): $type = $type ?? 'gymnasium',super._();
  factory Gymnasium.fromJson(Map<String, dynamic> json) => _$GymnasiumFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$GymnasiumToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Gymnasium);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.gymnasium()';
}


}




/// @nodoc
@JsonSerializable()

class Cafeteria extends RoomCategory {
  const Cafeteria({ String? $type}): $type = $type ?? 'cafeteria',super._();
  factory Cafeteria.fromJson(Map<String, dynamic> json) => _$CafeteriaFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CafeteriaToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Cafeteria);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.cafeteria()';
}


}




/// @nodoc
@JsonSerializable()

class Restroom extends RoomCategory {
  const Restroom({ String? $type}): $type = $type ?? 'restroom',super._();
  factory Restroom.fromJson(Map<String, dynamic> json) => _$RestroomFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$RestroomToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Restroom);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.restroom()';
}


}




/// @nodoc
@JsonSerializable()

class Corridor extends RoomCategory {
  const Corridor({ String? $type}): $type = $type ?? 'corridor',super._();
  factory Corridor.fromJson(Map<String, dynamic> json) => _$CorridorFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$CorridorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Corridor);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.corridor()';
}


}




/// @nodoc
@JsonSerializable()

class Stairs extends RoomCategory {
  const Stairs({ String? $type}): $type = $type ?? 'stairs',super._();
  factory Stairs.fromJson(Map<String, dynamic> json) => _$StairsFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$StairsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Stairs);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.stairs()';
}


}




/// @nodoc
@JsonSerializable()

class Elevator extends RoomCategory {
  const Elevator({ String? $type}): $type = $type ?? 'elevator',super._();
  factory Elevator.fromJson(Map<String, dynamic> json) => _$ElevatorFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$ElevatorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Elevator);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.elevator()';
}


}




/// @nodoc
@JsonSerializable()

class Utility extends RoomCategory {
  const Utility({ String? $type}): $type = $type ?? 'utility',super._();
  factory Utility.fromJson(Map<String, dynamic> json) => _$UtilityFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$UtilityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Utility);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.utility()';
}


}




/// @nodoc
@JsonSerializable()

class Storage extends RoomCategory {
  const Storage({ String? $type}): $type = $type ?? 'storage',super._();
  factory Storage.fromJson(Map<String, dynamic> json) => _$StorageFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$StorageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Storage);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RoomCategory.storage()';
}


}




/// @nodoc
@JsonSerializable()

class Other extends RoomCategory {
  const Other(this.label, { String? $type}): $type = $type ?? 'other',super._();
  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

 final  String label;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of RoomCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherCopyWith<Other> get copyWith => _$OtherCopyWithImpl<Other>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtherToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Other&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label);
}

@override
String toString() {
    return 'RoomCategory.other(label: $label)';
}


}

/// @nodoc
abstract mixin class $OtherCopyWith<$Res> implements $RoomCategoryCopyWith<$Res> {
  factory $OtherCopyWith(Other value, $Res Function(Other) _then) = _$OtherCopyWithImpl;
@useResult
$Res call({
 String label
});




}
/// @nodoc
class _$OtherCopyWithImpl<$Res>
    implements $OtherCopyWith<$Res> {
  _$OtherCopyWithImpl(this._self, this._then);

  final Other _self;
  final $Res Function(Other) _then;

/// Create a copy of RoomCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? label = null,}) {
  return _then(Other(
null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RoomBounds3D {

 double get minX; double get minY; double get minZ; double get maxX; double get maxY; double get maxZ;
/// Create a copy of RoomBounds3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomBounds3DCopyWith<RoomBounds3D> get copyWith => _$RoomBounds3DCopyWithImpl<RoomBounds3D>(this as RoomBounds3D, _$identity);

  /// Serializes this RoomBounds3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoomBounds3D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomBounds3D&&(identical(other.minX, _this.minX) || other.minX == _this.minX)&&(identical(other.minY, _this.minY) || other.minY == _this.minY)&&(identical(other.minZ, _this.minZ) || other.minZ == _this.minZ)&&(identical(other.maxX, _this.maxX) || other.maxX == _this.maxX)&&(identical(other.maxY, _this.maxY) || other.maxY == _this.maxY)&&(identical(other.maxZ, _this.maxZ) || other.maxZ == _this.maxZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoomBounds3D;
  return Object.hash(runtimeType,_this.minX,_this.minY,_this.minZ,_this.maxX,_this.maxY,_this.maxZ);
}

@override
String toString() {
  final _this = this as RoomBounds3D;
  return 'RoomBounds3D(minX: ${_this.minX}, minY: ${_this.minY}, minZ: ${_this.minZ}, maxX: ${_this.maxX}, maxY: ${_this.maxY}, maxZ: ${_this.maxZ})';
}


}

/// @nodoc
abstract mixin class $RoomBounds3DCopyWith<$Res>  {
  factory $RoomBounds3DCopyWith(RoomBounds3D value, $Res Function(RoomBounds3D) _then) = _$RoomBounds3DCopyWithImpl;
@useResult
$Res call({
 double minX, double minY, double minZ, double maxX, double maxY, double maxZ
});




}
/// @nodoc
class _$RoomBounds3DCopyWithImpl<$Res>
    implements $RoomBounds3DCopyWith<$Res> {
  _$RoomBounds3DCopyWithImpl(this._self, this._then);

  final RoomBounds3D _self;
  final $Res Function(RoomBounds3D) _then;

/// Create a copy of RoomBounds3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minX = null,Object? minY = null,Object? minZ = null,Object? maxX = null,Object? maxY = null,Object? maxZ = null,}) {
  return _then(RoomBounds3D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,minZ: null == minZ ? _self.minZ : minZ // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,maxZ: null == maxZ ? _self.maxZ : maxZ // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomBounds3D].
extension RoomBounds3DPatterns on RoomBounds3D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomBounds3D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomBounds3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomBounds3D value)  $default,){
final _that = this;
switch (_that) {
case _RoomBounds3D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomBounds3D value)?  $default,){
final _that = this;
switch (_that) {
case _RoomBounds3D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minX,  double minY,  double minZ,  double maxX,  double maxY,  double maxZ)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomBounds3D() when $default != null:
return $default(_that.minX,_that.minY,_that.minZ,_that.maxX,_that.maxY,_that.maxZ);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minX,  double minY,  double minZ,  double maxX,  double maxY,  double maxZ)  $default,) {final _that = this;
switch (_that) {
case _RoomBounds3D():
return $default(_that.minX,_that.minY,_that.minZ,_that.maxX,_that.maxY,_that.maxZ);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minX,  double minY,  double minZ,  double maxX,  double maxY,  double maxZ)?  $default,) {final _that = this;
switch (_that) {
case _RoomBounds3D() when $default != null:
return $default(_that.minX,_that.minY,_that.minZ,_that.maxX,_that.maxY,_that.maxZ);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomBounds3D extends RoomBounds3D {
  const _RoomBounds3D({required this.minX, required this.minY, required this.minZ, required this.maxX, required this.maxY, required this.maxZ}): super._();
  factory _RoomBounds3D.fromJson(Map<String, dynamic> json) => _$RoomBounds3DFromJson(json);

@override final  double minX;
@override final  double minY;
@override final  double minZ;
@override final  double maxX;
@override final  double maxY;
@override final  double maxZ;

/// Create a copy of RoomBounds3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomBounds3DCopyWith<_RoomBounds3D> get copyWith => __$RoomBounds3DCopyWithImpl<_RoomBounds3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomBounds3DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomBounds3D&&(identical(other.minX, minX) || other.minX == minX)&&(identical(other.minY, minY) || other.minY == minY)&&(identical(other.minZ, minZ) || other.minZ == minZ)&&(identical(other.maxX, maxX) || other.maxX == maxX)&&(identical(other.maxY, maxY) || other.maxY == maxY)&&(identical(other.maxZ, maxZ) || other.maxZ == maxZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minX,minY,minZ,maxX,maxY,maxZ);
}

@override
String toString() {
    return 'RoomBounds3D(minX: $minX, minY: $minY, minZ: $minZ, maxX: $maxX, maxY: $maxY, maxZ: $maxZ)';
}


}

/// @nodoc
abstract mixin class _$RoomBounds3DCopyWith<$Res> implements $RoomBounds3DCopyWith<$Res> {
  factory _$RoomBounds3DCopyWith(_RoomBounds3D value, $Res Function(_RoomBounds3D) _then) = __$RoomBounds3DCopyWithImpl;
@override @useResult
$Res call({
 double minX, double minY, double minZ, double maxX, double maxY, double maxZ
});




}
/// @nodoc
class __$RoomBounds3DCopyWithImpl<$Res>
    implements _$RoomBounds3DCopyWith<$Res> {
  __$RoomBounds3DCopyWithImpl(this._self, this._then);

  final _RoomBounds3D _self;
  final $Res Function(_RoomBounds3D) _then;

/// Create a copy of RoomBounds3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minX = null,Object? minY = null,Object? minZ = null,Object? maxX = null,Object? maxY = null,Object? maxZ = null,}) {
  return _then(_RoomBounds3D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,minZ: null == minZ ? _self.minZ : minZ // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,maxZ: null == maxZ ? _self.maxZ : maxZ // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

DigitalTwinState _$DigitalTwinStateFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'loading':
          return _Loading.fromJson(
            json
          );
                case 'loaded':
          return _Loaded.fromJson(
            json
          );
                case 'error':
          return _Error.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DigitalTwinState',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DigitalTwinState {



  /// Serializes this DigitalTwinState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DigitalTwinState);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinState()';
}


}

/// @nodoc
class $DigitalTwinStateCopyWith<$Res>  {
$DigitalTwinStateCopyWith(DigitalTwinState _, $Res Function(DigitalTwinState) __);
}


/// Adds pattern-matching-related methods to [DigitalTwinState].
extension DigitalTwinStatePatterns on DigitalTwinState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( Building3D building,  int currentFloor,  Set<String> highlightedRooms,  String? selectedRoomId,  DigitalTwinTheme theme,  bool isExplodedView,  CameraState camera)?  loaded,TResult Function( String message,  Object? error, @JsonKey(includeFromJson: false, includeToJson: false)  StackTrace? stackTrace)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.building,_that.currentFloor,_that.highlightedRooms,_that.selectedRoomId,_that.theme,_that.isExplodedView,_that.camera);case _Error() when error != null:
return error(_that.message,_that.error,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( Building3D building,  int currentFloor,  Set<String> highlightedRooms,  String? selectedRoomId,  DigitalTwinTheme theme,  bool isExplodedView,  CameraState camera)  loaded,required TResult Function( String message,  Object? error, @JsonKey(includeFromJson: false, includeToJson: false)  StackTrace? stackTrace)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Loaded():
return loaded(_that.building,_that.currentFloor,_that.highlightedRooms,_that.selectedRoomId,_that.theme,_that.isExplodedView,_that.camera);case _Error():
return error(_that.message,_that.error,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( Building3D building,  int currentFloor,  Set<String> highlightedRooms,  String? selectedRoomId,  DigitalTwinTheme theme,  bool isExplodedView,  CameraState camera)?  loaded,TResult? Function( String message,  Object? error, @JsonKey(includeFromJson: false, includeToJson: false)  StackTrace? stackTrace)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.building,_that.currentFloor,_that.highlightedRooms,_that.selectedRoomId,_that.theme,_that.isExplodedView,_that.camera);case _Error() when error != null:
return error(_that.message,_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Loading implements DigitalTwinState {
  const _Loading({ String? $type}): $type = $type ?? 'loading';
  factory _Loading.fromJson(Map<String, dynamic> json) => _$LoadingFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LoadingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinState.loading()';
}


}




/// @nodoc
@JsonSerializable()

class _Loaded implements DigitalTwinState {
  const _Loaded({required this.building, required this.currentFloor, required  Set<String> highlightedRooms, required this.selectedRoomId, required this.theme, required this.isExplodedView, required this.camera,  String? $type}): _highlightedRooms = highlightedRooms,$type = $type ?? 'loaded';
  factory _Loaded.fromJson(Map<String, dynamic> json) => _$LoadedFromJson(json);

 final  Building3D building;
 final  int currentFloor;
 final  Set<String> _highlightedRooms;
 Set<String> get highlightedRooms {
  if (_highlightedRooms is EqualUnmodifiableSetView) return _highlightedRooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_highlightedRooms);
}

 final  String? selectedRoomId;
 final  DigitalTwinTheme theme;
 final  bool isExplodedView;
 final  CameraState camera;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoadedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.building, building) || other.building == building)&&(identical(other.currentFloor, currentFloor) || other.currentFloor == currentFloor)&&const DeepCollectionEquality().equals(other.highlightedRooms, _highlightedRooms)&&(identical(other.selectedRoomId, selectedRoomId) || other.selectedRoomId == selectedRoomId)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.isExplodedView, isExplodedView) || other.isExplodedView == isExplodedView)&&(identical(other.camera, camera) || other.camera == camera));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,building,currentFloor,const DeepCollectionEquality().hash(_highlightedRooms),selectedRoomId,theme,isExplodedView,camera);
}

@override
String toString() {
    return 'DigitalTwinState.loaded(building: $building, currentFloor: $currentFloor, highlightedRooms: $highlightedRooms, selectedRoomId: $selectedRoomId, theme: $theme, isExplodedView: $isExplodedView, camera: $camera)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DigitalTwinStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Building3D building, int currentFloor, Set<String> highlightedRooms, String? selectedRoomId, DigitalTwinTheme theme, bool isExplodedView, CameraState camera
});


$Building3DCopyWith<$Res> get building;$DigitalTwinThemeCopyWith<$Res> get theme;$CameraStateCopyWith<$Res> get camera;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DigitalTwinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? building = null,Object? currentFloor = null,Object? highlightedRooms = null,Object? selectedRoomId = freezed,Object? theme = null,Object? isExplodedView = null,Object? camera = null,}) {
  return _then(_Loaded(
building: null == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as Building3D,currentFloor: null == currentFloor ? _self.currentFloor : currentFloor // ignore: cast_nullable_to_non_nullable
as int,highlightedRooms: null == highlightedRooms ? _self._highlightedRooms : highlightedRooms // ignore: cast_nullable_to_non_nullable
as Set<String>,selectedRoomId: freezed == selectedRoomId ? _self.selectedRoomId : selectedRoomId // ignore: cast_nullable_to_non_nullable
as String?,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as DigitalTwinTheme,isExplodedView: null == isExplodedView ? _self.isExplodedView : isExplodedView // ignore: cast_nullable_to_non_nullable
as bool,camera: null == camera ? _self.camera : camera // ignore: cast_nullable_to_non_nullable
as CameraState,
  ));
}

/// Create a copy of DigitalTwinState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Building3DCopyWith<$Res> get building {
  
  return $Building3DCopyWith<$Res>(_self.building, (value) {
    return _then(_self.copyWith(building: value));
  });
}/// Create a copy of DigitalTwinState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitalTwinThemeCopyWith<$Res> get theme {
  
  return $DigitalTwinThemeCopyWith<$Res>(_self.theme, (value) {
    return _then(_self.copyWith(theme: value));
  });
}/// Create a copy of DigitalTwinState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CameraStateCopyWith<$Res> get camera {
  
  return $CameraStateCopyWith<$Res>(_self.camera, (value) {
    return _then(_self.copyWith(camera: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _Error implements DigitalTwinState {
  const _Error({required this.message, required this.error, @JsonKey(includeFromJson: false, includeToJson: false) this.stackTrace,  String? $type}): $type = $type ?? 'error';
  factory _Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

 final  String message;
 final  Object? error;
@JsonKey(includeFromJson: false, includeToJson: false) final  StackTrace? stackTrace;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,message,const DeepCollectionEquality().hash(error),stackTrace);
}

@override
String toString() {
    return 'DigitalTwinState.error(message: $message, error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DigitalTwinStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, Object? error,@JsonKey(includeFromJson: false, includeToJson: false) StackTrace? stackTrace
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of DigitalTwinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}


/// @nodoc
mixin _$CameraState {

 Vector3D get position; Vector3D get target; double get zoom; double get polarAngle; double get azimuthAngle;
/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraStateCopyWith<CameraState> get copyWith => _$CameraStateCopyWithImpl<CameraState>(this as CameraState, _$identity);

  /// Serializes this CameraState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CameraState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraState&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.zoom, _this.zoom) || other.zoom == _this.zoom)&&(identical(other.polarAngle, _this.polarAngle) || other.polarAngle == _this.polarAngle)&&(identical(other.azimuthAngle, _this.azimuthAngle) || other.azimuthAngle == _this.azimuthAngle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CameraState;
  return Object.hash(runtimeType,_this.position,_this.target,_this.zoom,_this.polarAngle,_this.azimuthAngle);
}

@override
String toString() {
  final _this = this as CameraState;
  return 'CameraState(position: ${_this.position}, target: ${_this.target}, zoom: ${_this.zoom}, polarAngle: ${_this.polarAngle}, azimuthAngle: ${_this.azimuthAngle})';
}


}

/// @nodoc
abstract mixin class $CameraStateCopyWith<$Res>  {
  factory $CameraStateCopyWith(CameraState value, $Res Function(CameraState) _then) = _$CameraStateCopyWithImpl;
@useResult
$Res call({
 Vector3D position, Vector3D target, double zoom, double polarAngle, double azimuthAngle
});


$Vector3DCopyWith<$Res> get position;$Vector3DCopyWith<$Res> get target;

}
/// @nodoc
class _$CameraStateCopyWithImpl<$Res>
    implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._self, this._then);

  final CameraState _self;
  final $Res Function(CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? target = null,Object? zoom = null,Object? polarAngle = null,Object? azimuthAngle = null,}) {
  return _then(CameraState(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Vector3D,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Vector3D,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,polarAngle: null == polarAngle ? _self.polarAngle : polarAngle // ignore: cast_nullable_to_non_nullable
as double,azimuthAngle: null == azimuthAngle ? _self.azimuthAngle : azimuthAngle // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get position {
  
  return $Vector3DCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get target {
  
  return $Vector3DCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [CameraState].
extension CameraStatePatterns on CameraState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CameraState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CameraState value)  $default,){
final _that = this;
switch (_that) {
case _CameraState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CameraState value)?  $default,){
final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Vector3D position,  Vector3D target,  double zoom,  double polarAngle,  double azimuthAngle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that.position,_that.target,_that.zoom,_that.polarAngle,_that.azimuthAngle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Vector3D position,  Vector3D target,  double zoom,  double polarAngle,  double azimuthAngle)  $default,) {final _that = this;
switch (_that) {
case _CameraState():
return $default(_that.position,_that.target,_that.zoom,_that.polarAngle,_that.azimuthAngle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Vector3D position,  Vector3D target,  double zoom,  double polarAngle,  double azimuthAngle)?  $default,) {final _that = this;
switch (_that) {
case _CameraState() when $default != null:
return $default(_that.position,_that.target,_that.zoom,_that.polarAngle,_that.azimuthAngle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CameraState extends CameraState {
  const _CameraState({required this.position, required this.target, required this.zoom, required this.polarAngle, required this.azimuthAngle}): super._();
  factory _CameraState.fromJson(Map<String, dynamic> json) => _$CameraStateFromJson(json);

@override final  Vector3D position;
@override final  Vector3D target;
@override final  double zoom;
@override final  double polarAngle;
@override final  double azimuthAngle;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraStateCopyWith<_CameraState> get copyWith => __$CameraStateCopyWithImpl<_CameraState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CameraStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraState&&(identical(other.position, position) || other.position == position)&&(identical(other.target, target) || other.target == target)&&(identical(other.zoom, zoom) || other.zoom == zoom)&&(identical(other.polarAngle, polarAngle) || other.polarAngle == polarAngle)&&(identical(other.azimuthAngle, azimuthAngle) || other.azimuthAngle == azimuthAngle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,position,target,zoom,polarAngle,azimuthAngle);
}

@override
String toString() {
    return 'CameraState(position: $position, target: $target, zoom: $zoom, polarAngle: $polarAngle, azimuthAngle: $azimuthAngle)';
}


}

/// @nodoc
abstract mixin class _$CameraStateCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory _$CameraStateCopyWith(_CameraState value, $Res Function(_CameraState) _then) = __$CameraStateCopyWithImpl;
@override @useResult
$Res call({
 Vector3D position, Vector3D target, double zoom, double polarAngle, double azimuthAngle
});


@override $Vector3DCopyWith<$Res> get position;@override $Vector3DCopyWith<$Res> get target;

}
/// @nodoc
class __$CameraStateCopyWithImpl<$Res>
    implements _$CameraStateCopyWith<$Res> {
  __$CameraStateCopyWithImpl(this._self, this._then);

  final _CameraState _self;
  final $Res Function(_CameraState) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? target = null,Object? zoom = null,Object? polarAngle = null,Object? azimuthAngle = null,}) {
  return _then(_CameraState(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Vector3D,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as Vector3D,zoom: null == zoom ? _self.zoom : zoom // ignore: cast_nullable_to_non_nullable
as double,polarAngle: null == polarAngle ? _self.polarAngle : polarAngle // ignore: cast_nullable_to_non_nullable
as double,azimuthAngle: null == azimuthAngle ? _self.azimuthAngle : azimuthAngle // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get position {
  
  return $Vector3DCopyWith<$Res>(_self.position, (value) {
    return _then(_self.copyWith(position: value));
  });
}/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get target {
  
  return $Vector3DCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

DigitalTwinTheme _$DigitalTwinThemeFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'light':
          return LightTheme.fromJson(
            json
          );
                case 'dark':
          return DarkTheme.fromJson(
            json
          );
                case 'emergency':
          return EmergencyTheme.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DigitalTwinTheme',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DigitalTwinTheme {



  /// Serializes this DigitalTwinTheme to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DigitalTwinTheme);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinTheme()';
}


}

/// @nodoc
class $DigitalTwinThemeCopyWith<$Res>  {
$DigitalTwinThemeCopyWith(DigitalTwinTheme _, $Res Function(DigitalTwinTheme) __);
}


/// Adds pattern-matching-related methods to [DigitalTwinTheme].
extension DigitalTwinThemePatterns on DigitalTwinTheme {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LightTheme value)?  light,TResult Function( DarkTheme value)?  dark,TResult Function( EmergencyTheme value)?  emergency,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LightTheme() when light != null:
return light(_that);case DarkTheme() when dark != null:
return dark(_that);case EmergencyTheme() when emergency != null:
return emergency(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LightTheme value)  light,required TResult Function( DarkTheme value)  dark,required TResult Function( EmergencyTheme value)  emergency,}){
final _that = this;
switch (_that) {
case LightTheme():
return light(_that);case DarkTheme():
return dark(_that);case EmergencyTheme():
return emergency(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LightTheme value)?  light,TResult? Function( DarkTheme value)?  dark,TResult? Function( EmergencyTheme value)?  emergency,}){
final _that = this;
switch (_that) {
case LightTheme() when light != null:
return light(_that);case DarkTheme() when dark != null:
return dark(_that);case EmergencyTheme() when emergency != null:
return emergency(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  light,TResult Function()?  dark,TResult Function()?  emergency,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LightTheme() when light != null:
return light();case DarkTheme() when dark != null:
return dark();case EmergencyTheme() when emergency != null:
return emergency();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  light,required TResult Function()  dark,required TResult Function()  emergency,}) {final _that = this;
switch (_that) {
case LightTheme():
return light();case DarkTheme():
return dark();case EmergencyTheme():
return emergency();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  light,TResult? Function()?  dark,TResult? Function()?  emergency,}) {final _that = this;
switch (_that) {
case LightTheme() when light != null:
return light();case DarkTheme() when dark != null:
return dark();case EmergencyTheme() when emergency != null:
return emergency();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class LightTheme extends DigitalTwinTheme {
  const LightTheme({ String? $type}): $type = $type ?? 'light',super._();
  factory LightTheme.fromJson(Map<String, dynamic> json) => _$LightThemeFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LightThemeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LightTheme);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinTheme.light()';
}


}




/// @nodoc
@JsonSerializable()

class DarkTheme extends DigitalTwinTheme {
  const DarkTheme({ String? $type}): $type = $type ?? 'dark',super._();
  factory DarkTheme.fromJson(Map<String, dynamic> json) => _$DarkThemeFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$DarkThemeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DarkTheme);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinTheme.dark()';
}


}




/// @nodoc
@JsonSerializable()

class EmergencyTheme extends DigitalTwinTheme {
  const EmergencyTheme({ String? $type}): $type = $type ?? 'emergency',super._();
  factory EmergencyTheme.fromJson(Map<String, dynamic> json) => _$EmergencyThemeFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$EmergencyThemeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyTheme);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinTheme.emergency()';
}


}





/// @nodoc
mixin _$RoomSearchResult {

 Room3D get room; double get relevanceScore; SearchMatchType get matchType; String get matchedField;
/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomSearchResultCopyWith<RoomSearchResult> get copyWith => _$RoomSearchResultCopyWithImpl<RoomSearchResult>(this as RoomSearchResult, _$identity);

  /// Serializes this RoomSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoomSearchResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomSearchResult&&(identical(other.room, _this.room) || other.room == _this.room)&&(identical(other.relevanceScore, _this.relevanceScore) || other.relevanceScore == _this.relevanceScore)&&(identical(other.matchType, _this.matchType) || other.matchType == _this.matchType)&&(identical(other.matchedField, _this.matchedField) || other.matchedField == _this.matchedField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoomSearchResult;
  return Object.hash(runtimeType,_this.room,_this.relevanceScore,_this.matchType,_this.matchedField);
}

@override
String toString() {
  final _this = this as RoomSearchResult;
  return 'RoomSearchResult(room: ${_this.room}, relevanceScore: ${_this.relevanceScore}, matchType: ${_this.matchType}, matchedField: ${_this.matchedField})';
}


}

/// @nodoc
abstract mixin class $RoomSearchResultCopyWith<$Res>  {
  factory $RoomSearchResultCopyWith(RoomSearchResult value, $Res Function(RoomSearchResult) _then) = _$RoomSearchResultCopyWithImpl;
@useResult
$Res call({
 Room3D room, double relevanceScore, SearchMatchType matchType, String matchedField
});


$Room3DCopyWith<$Res> get room;$SearchMatchTypeCopyWith<$Res> get matchType;

}
/// @nodoc
class _$RoomSearchResultCopyWithImpl<$Res>
    implements $RoomSearchResultCopyWith<$Res> {
  _$RoomSearchResultCopyWithImpl(this._self, this._then);

  final RoomSearchResult _self;
  final $Res Function(RoomSearchResult) _then;

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? room = null,Object? relevanceScore = null,Object? matchType = null,Object? matchedField = null,}) {
  return _then(RoomSearchResult(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room3D,relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as double,matchType: null == matchType ? _self.matchType : matchType // ignore: cast_nullable_to_non_nullable
as SearchMatchType,matchedField: null == matchedField ? _self.matchedField : matchedField // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Room3DCopyWith<$Res> get room {
  
  return $Room3DCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchMatchTypeCopyWith<$Res> get matchType {
  
  return $SearchMatchTypeCopyWith<$Res>(_self.matchType, (value) {
    return _then(_self.copyWith(matchType: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomSearchResult].
extension RoomSearchResultPatterns on RoomSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _RoomSearchResult():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Room3D room,  double relevanceScore,  SearchMatchType matchType,  String matchedField)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
return $default(_that.room,_that.relevanceScore,_that.matchType,_that.matchedField);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Room3D room,  double relevanceScore,  SearchMatchType matchType,  String matchedField)  $default,) {final _that = this;
switch (_that) {
case _RoomSearchResult():
return $default(_that.room,_that.relevanceScore,_that.matchType,_that.matchedField);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Room3D room,  double relevanceScore,  SearchMatchType matchType,  String matchedField)?  $default,) {final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
return $default(_that.room,_that.relevanceScore,_that.matchType,_that.matchedField);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomSearchResult implements RoomSearchResult {
  const _RoomSearchResult({required this.room, required this.relevanceScore, required this.matchType, required this.matchedField});
  factory _RoomSearchResult.fromJson(Map<String, dynamic> json) => _$RoomSearchResultFromJson(json);

@override final  Room3D room;
@override final  double relevanceScore;
@override final  SearchMatchType matchType;
@override final  String matchedField;

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomSearchResultCopyWith<_RoomSearchResult> get copyWith => __$RoomSearchResultCopyWithImpl<_RoomSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomSearchResult&&(identical(other.room, room) || other.room == room)&&(identical(other.relevanceScore, relevanceScore) || other.relevanceScore == relevanceScore)&&(identical(other.matchType, matchType) || other.matchType == matchType)&&(identical(other.matchedField, matchedField) || other.matchedField == matchedField));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,room,relevanceScore,matchType,matchedField);
}

@override
String toString() {
    return 'RoomSearchResult(room: $room, relevanceScore: $relevanceScore, matchType: $matchType, matchedField: $matchedField)';
}


}

/// @nodoc
abstract mixin class _$RoomSearchResultCopyWith<$Res> implements $RoomSearchResultCopyWith<$Res> {
  factory _$RoomSearchResultCopyWith(_RoomSearchResult value, $Res Function(_RoomSearchResult) _then) = __$RoomSearchResultCopyWithImpl;
@override @useResult
$Res call({
 Room3D room, double relevanceScore, SearchMatchType matchType, String matchedField
});


@override $Room3DCopyWith<$Res> get room;@override $SearchMatchTypeCopyWith<$Res> get matchType;

}
/// @nodoc
class __$RoomSearchResultCopyWithImpl<$Res>
    implements _$RoomSearchResultCopyWith<$Res> {
  __$RoomSearchResultCopyWithImpl(this._self, this._then);

  final _RoomSearchResult _self;
  final $Res Function(_RoomSearchResult) _then;

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? room = null,Object? relevanceScore = null,Object? matchType = null,Object? matchedField = null,}) {
  return _then(_RoomSearchResult(
room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as Room3D,relevanceScore: null == relevanceScore ? _self.relevanceScore : relevanceScore // ignore: cast_nullable_to_non_nullable
as double,matchType: null == matchType ? _self.matchType : matchType // ignore: cast_nullable_to_non_nullable
as SearchMatchType,matchedField: null == matchedField ? _self.matchedField : matchedField // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Room3DCopyWith<$Res> get room {
  
  return $Room3DCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchMatchTypeCopyWith<$Res> get matchType {
  
  return $SearchMatchTypeCopyWith<$Res>(_self.matchType, (value) {
    return _then(_self.copyWith(matchType: value));
  });
}
}

SearchMatchType _$SearchMatchTypeFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'exact':
          return ExactMatch.fromJson(
            json
          );
                case 'prefix':
          return PrefixMatch.fromJson(
            json
          );
                case 'contains':
          return ContainsMatch.fromJson(
            json
          );
                case 'fuzzy':
          return FuzzyMatch.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'SearchMatchType',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$SearchMatchType {



  /// Serializes this SearchMatchType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMatchType);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchMatchType()';
}


}

/// @nodoc
class $SearchMatchTypeCopyWith<$Res>  {
$SearchMatchTypeCopyWith(SearchMatchType _, $Res Function(SearchMatchType) __);
}


/// Adds pattern-matching-related methods to [SearchMatchType].
extension SearchMatchTypePatterns on SearchMatchType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExactMatch value)?  exact,TResult Function( PrefixMatch value)?  prefix,TResult Function( ContainsMatch value)?  contains,TResult Function( FuzzyMatch value)?  fuzzy,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExactMatch() when exact != null:
return exact(_that);case PrefixMatch() when prefix != null:
return prefix(_that);case ContainsMatch() when contains != null:
return contains(_that);case FuzzyMatch() when fuzzy != null:
return fuzzy(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExactMatch value)  exact,required TResult Function( PrefixMatch value)  prefix,required TResult Function( ContainsMatch value)  contains,required TResult Function( FuzzyMatch value)  fuzzy,}){
final _that = this;
switch (_that) {
case ExactMatch():
return exact(_that);case PrefixMatch():
return prefix(_that);case ContainsMatch():
return contains(_that);case FuzzyMatch():
return fuzzy(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExactMatch value)?  exact,TResult? Function( PrefixMatch value)?  prefix,TResult? Function( ContainsMatch value)?  contains,TResult? Function( FuzzyMatch value)?  fuzzy,}){
final _that = this;
switch (_that) {
case ExactMatch() when exact != null:
return exact(_that);case PrefixMatch() when prefix != null:
return prefix(_that);case ContainsMatch() when contains != null:
return contains(_that);case FuzzyMatch() when fuzzy != null:
return fuzzy(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  exact,TResult Function()?  prefix,TResult Function()?  contains,TResult Function()?  fuzzy,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExactMatch() when exact != null:
return exact();case PrefixMatch() when prefix != null:
return prefix();case ContainsMatch() when contains != null:
return contains();case FuzzyMatch() when fuzzy != null:
return fuzzy();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  exact,required TResult Function()  prefix,required TResult Function()  contains,required TResult Function()  fuzzy,}) {final _that = this;
switch (_that) {
case ExactMatch():
return exact();case PrefixMatch():
return prefix();case ContainsMatch():
return contains();case FuzzyMatch():
return fuzzy();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  exact,TResult? Function()?  prefix,TResult? Function()?  contains,TResult? Function()?  fuzzy,}) {final _that = this;
switch (_that) {
case ExactMatch() when exact != null:
return exact();case PrefixMatch() when prefix != null:
return prefix();case ContainsMatch() when contains != null:
return contains();case FuzzyMatch() when fuzzy != null:
return fuzzy();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ExactMatch implements SearchMatchType {
  const ExactMatch({ String? $type}): $type = $type ?? 'exact';
  factory ExactMatch.fromJson(Map<String, dynamic> json) => _$ExactMatchFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$ExactMatchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ExactMatch);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchMatchType.exact()';
}


}




/// @nodoc
@JsonSerializable()

class PrefixMatch implements SearchMatchType {
  const PrefixMatch({ String? $type}): $type = $type ?? 'prefix';
  factory PrefixMatch.fromJson(Map<String, dynamic> json) => _$PrefixMatchFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$PrefixMatchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PrefixMatch);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchMatchType.prefix()';
}


}




/// @nodoc
@JsonSerializable()

class ContainsMatch implements SearchMatchType {
  const ContainsMatch({ String? $type}): $type = $type ?? 'contains';
  factory ContainsMatch.fromJson(Map<String, dynamic> json) => _$ContainsMatchFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$ContainsMatchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ContainsMatch);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchMatchType.contains()';
}


}




/// @nodoc
@JsonSerializable()

class FuzzyMatch implements SearchMatchType {
  const FuzzyMatch({ String? $type}): $type = $type ?? 'fuzzy';
  factory FuzzyMatch.fromJson(Map<String, dynamic> json) => _$FuzzyMatchFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$FuzzyMatchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FuzzyMatch);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SearchMatchType.fuzzy()';
}


}




DigitalTwinMessage _$DigitalTwinMessageFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'loadBuilding':
          return _LoadBuilding.fromJson(
            json
          );
                case 'showFloor':
          return _ShowFloor.fromJson(
            json
          );
                case 'setFloorVisibility':
          return _SetFloorVisibility.fromJson(
            json
          );
                case 'highlightRoom':
          return _HighlightRoom.fromJson(
            json
          );
                case 'clearHighlight':
          return _ClearHighlight.fromJson(
            json
          );
                case 'flyToRoom':
          return _FlyToRoom.fromJson(
            json
          );
                case 'setTheme':
          return _SetTheme.fromJson(
            json
          );
                case 'setExplodedView':
          return _SetExplodedView.fromJson(
            json
          );
                case 'setCameraPosition':
          return _SetCameraPosition.fromJson(
            json
          );
                case 'requestState':
          return _RequestState.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DigitalTwinMessage',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DigitalTwinMessage {



  /// Serializes this DigitalTwinMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DigitalTwinMessage);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinMessage()';
}


}

/// @nodoc
class $DigitalTwinMessageCopyWith<$Res>  {
$DigitalTwinMessageCopyWith(DigitalTwinMessage _, $Res Function(DigitalTwinMessage) __);
}


/// Adds pattern-matching-related methods to [DigitalTwinMessage].
extension DigitalTwinMessagePatterns on DigitalTwinMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadBuilding value)?  loadBuilding,TResult Function( _ShowFloor value)?  showFloor,TResult Function( _SetFloorVisibility value)?  setFloorVisibility,TResult Function( _HighlightRoom value)?  highlightRoom,TResult Function( _ClearHighlight value)?  clearHighlight,TResult Function( _FlyToRoom value)?  flyToRoom,TResult Function( _SetTheme value)?  setTheme,TResult Function( _SetExplodedView value)?  setExplodedView,TResult Function( _SetCameraPosition value)?  setCameraPosition,TResult Function( _RequestState value)?  requestState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadBuilding() when loadBuilding != null:
return loadBuilding(_that);case _ShowFloor() when showFloor != null:
return showFloor(_that);case _SetFloorVisibility() when setFloorVisibility != null:
return setFloorVisibility(_that);case _HighlightRoom() when highlightRoom != null:
return highlightRoom(_that);case _ClearHighlight() when clearHighlight != null:
return clearHighlight(_that);case _FlyToRoom() when flyToRoom != null:
return flyToRoom(_that);case _SetTheme() when setTheme != null:
return setTheme(_that);case _SetExplodedView() when setExplodedView != null:
return setExplodedView(_that);case _SetCameraPosition() when setCameraPosition != null:
return setCameraPosition(_that);case _RequestState() when requestState != null:
return requestState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadBuilding value)  loadBuilding,required TResult Function( _ShowFloor value)  showFloor,required TResult Function( _SetFloorVisibility value)  setFloorVisibility,required TResult Function( _HighlightRoom value)  highlightRoom,required TResult Function( _ClearHighlight value)  clearHighlight,required TResult Function( _FlyToRoom value)  flyToRoom,required TResult Function( _SetTheme value)  setTheme,required TResult Function( _SetExplodedView value)  setExplodedView,required TResult Function( _SetCameraPosition value)  setCameraPosition,required TResult Function( _RequestState value)  requestState,}){
final _that = this;
switch (_that) {
case _LoadBuilding():
return loadBuilding(_that);case _ShowFloor():
return showFloor(_that);case _SetFloorVisibility():
return setFloorVisibility(_that);case _HighlightRoom():
return highlightRoom(_that);case _ClearHighlight():
return clearHighlight(_that);case _FlyToRoom():
return flyToRoom(_that);case _SetTheme():
return setTheme(_that);case _SetExplodedView():
return setExplodedView(_that);case _SetCameraPosition():
return setCameraPosition(_that);case _RequestState():
return requestState(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadBuilding value)?  loadBuilding,TResult? Function( _ShowFloor value)?  showFloor,TResult? Function( _SetFloorVisibility value)?  setFloorVisibility,TResult? Function( _HighlightRoom value)?  highlightRoom,TResult? Function( _ClearHighlight value)?  clearHighlight,TResult? Function( _FlyToRoom value)?  flyToRoom,TResult? Function( _SetTheme value)?  setTheme,TResult? Function( _SetExplodedView value)?  setExplodedView,TResult? Function( _SetCameraPosition value)?  setCameraPosition,TResult? Function( _RequestState value)?  requestState,}){
final _that = this;
switch (_that) {
case _LoadBuilding() when loadBuilding != null:
return loadBuilding(_that);case _ShowFloor() when showFloor != null:
return showFloor(_that);case _SetFloorVisibility() when setFloorVisibility != null:
return setFloorVisibility(_that);case _HighlightRoom() when highlightRoom != null:
return highlightRoom(_that);case _ClearHighlight() when clearHighlight != null:
return clearHighlight(_that);case _FlyToRoom() when flyToRoom != null:
return flyToRoom(_that);case _SetTheme() when setTheme != null:
return setTheme(_that);case _SetExplodedView() when setExplodedView != null:
return setExplodedView(_that);case _SetCameraPosition() when setCameraPosition != null:
return setCameraPosition(_that);case _RequestState() when requestState != null:
return requestState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String buildingId)?  loadBuilding,TResult Function( int floorIndex)?  showFloor,TResult Function( int floorIndex,  bool visible,  double opacity)?  setFloorVisibility,TResult Function( String roomId,  int? color)?  highlightRoom,TResult Function( String roomId)?  clearHighlight,TResult Function( String roomId,  int duration)?  flyToRoom,TResult Function( String theme)?  setTheme,TResult Function( bool enabled,  double separation)?  setExplodedView,TResult Function( double x,  double y,  double z)?  setCameraPosition,TResult Function()?  requestState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadBuilding() when loadBuilding != null:
return loadBuilding(_that.buildingId);case _ShowFloor() when showFloor != null:
return showFloor(_that.floorIndex);case _SetFloorVisibility() when setFloorVisibility != null:
return setFloorVisibility(_that.floorIndex,_that.visible,_that.opacity);case _HighlightRoom() when highlightRoom != null:
return highlightRoom(_that.roomId,_that.color);case _ClearHighlight() when clearHighlight != null:
return clearHighlight(_that.roomId);case _FlyToRoom() when flyToRoom != null:
return flyToRoom(_that.roomId,_that.duration);case _SetTheme() when setTheme != null:
return setTheme(_that.theme);case _SetExplodedView() when setExplodedView != null:
return setExplodedView(_that.enabled,_that.separation);case _SetCameraPosition() when setCameraPosition != null:
return setCameraPosition(_that.x,_that.y,_that.z);case _RequestState() when requestState != null:
return requestState();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String buildingId)  loadBuilding,required TResult Function( int floorIndex)  showFloor,required TResult Function( int floorIndex,  bool visible,  double opacity)  setFloorVisibility,required TResult Function( String roomId,  int? color)  highlightRoom,required TResult Function( String roomId)  clearHighlight,required TResult Function( String roomId,  int duration)  flyToRoom,required TResult Function( String theme)  setTheme,required TResult Function( bool enabled,  double separation)  setExplodedView,required TResult Function( double x,  double y,  double z)  setCameraPosition,required TResult Function()  requestState,}) {final _that = this;
switch (_that) {
case _LoadBuilding():
return loadBuilding(_that.buildingId);case _ShowFloor():
return showFloor(_that.floorIndex);case _SetFloorVisibility():
return setFloorVisibility(_that.floorIndex,_that.visible,_that.opacity);case _HighlightRoom():
return highlightRoom(_that.roomId,_that.color);case _ClearHighlight():
return clearHighlight(_that.roomId);case _FlyToRoom():
return flyToRoom(_that.roomId,_that.duration);case _SetTheme():
return setTheme(_that.theme);case _SetExplodedView():
return setExplodedView(_that.enabled,_that.separation);case _SetCameraPosition():
return setCameraPosition(_that.x,_that.y,_that.z);case _RequestState():
return requestState();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String buildingId)?  loadBuilding,TResult? Function( int floorIndex)?  showFloor,TResult? Function( int floorIndex,  bool visible,  double opacity)?  setFloorVisibility,TResult? Function( String roomId,  int? color)?  highlightRoom,TResult? Function( String roomId)?  clearHighlight,TResult? Function( String roomId,  int duration)?  flyToRoom,TResult? Function( String theme)?  setTheme,TResult? Function( bool enabled,  double separation)?  setExplodedView,TResult? Function( double x,  double y,  double z)?  setCameraPosition,TResult? Function()?  requestState,}) {final _that = this;
switch (_that) {
case _LoadBuilding() when loadBuilding != null:
return loadBuilding(_that.buildingId);case _ShowFloor() when showFloor != null:
return showFloor(_that.floorIndex);case _SetFloorVisibility() when setFloorVisibility != null:
return setFloorVisibility(_that.floorIndex,_that.visible,_that.opacity);case _HighlightRoom() when highlightRoom != null:
return highlightRoom(_that.roomId,_that.color);case _ClearHighlight() when clearHighlight != null:
return clearHighlight(_that.roomId);case _FlyToRoom() when flyToRoom != null:
return flyToRoom(_that.roomId,_that.duration);case _SetTheme() when setTheme != null:
return setTheme(_that.theme);case _SetExplodedView() when setExplodedView != null:
return setExplodedView(_that.enabled,_that.separation);case _SetCameraPosition() when setCameraPosition != null:
return setCameraPosition(_that.x,_that.y,_that.z);case _RequestState() when requestState != null:
return requestState();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoadBuilding implements DigitalTwinMessage {
  const _LoadBuilding({required this.buildingId,  String? $type}): $type = $type ?? 'loadBuilding';
  factory _LoadBuilding.fromJson(Map<String, dynamic> json) => _$LoadBuildingFromJson(json);

 final  String buildingId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadBuildingCopyWith<_LoadBuilding> get copyWith => __$LoadBuildingCopyWithImpl<_LoadBuilding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoadBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadBuilding&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId);
}

@override
String toString() {
    return 'DigitalTwinMessage.loadBuilding(buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class _$LoadBuildingCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$LoadBuildingCopyWith(_LoadBuilding value, $Res Function(_LoadBuilding) _then) = __$LoadBuildingCopyWithImpl;
@useResult
$Res call({
 String buildingId
});




}
/// @nodoc
class __$LoadBuildingCopyWithImpl<$Res>
    implements _$LoadBuildingCopyWith<$Res> {
  __$LoadBuildingCopyWithImpl(this._self, this._then);

  final _LoadBuilding _self;
  final $Res Function(_LoadBuilding) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,}) {
  return _then(_LoadBuilding(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ShowFloor implements DigitalTwinMessage {
  const _ShowFloor({required this.floorIndex,  String? $type}): $type = $type ?? 'showFloor';
  factory _ShowFloor.fromJson(Map<String, dynamic> json) => _$ShowFloorFromJson(json);

 final  int floorIndex;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowFloorCopyWith<_ShowFloor> get copyWith => __$ShowFloorCopyWithImpl<_ShowFloor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShowFloorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowFloor&&(identical(other.floorIndex, floorIndex) || other.floorIndex == floorIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,floorIndex);
}

@override
String toString() {
    return 'DigitalTwinMessage.showFloor(floorIndex: $floorIndex)';
}


}

/// @nodoc
abstract mixin class _$ShowFloorCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$ShowFloorCopyWith(_ShowFloor value, $Res Function(_ShowFloor) _then) = __$ShowFloorCopyWithImpl;
@useResult
$Res call({
 int floorIndex
});




}
/// @nodoc
class __$ShowFloorCopyWithImpl<$Res>
    implements _$ShowFloorCopyWith<$Res> {
  __$ShowFloorCopyWithImpl(this._self, this._then);

  final _ShowFloor _self;
  final $Res Function(_ShowFloor) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? floorIndex = null,}) {
  return _then(_ShowFloor(
floorIndex: null == floorIndex ? _self.floorIndex : floorIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _SetFloorVisibility implements DigitalTwinMessage {
  const _SetFloorVisibility({required this.floorIndex, required this.visible, this.opacity = 1.0,  String? $type}): $type = $type ?? 'setFloorVisibility';
  factory _SetFloorVisibility.fromJson(Map<String, dynamic> json) => _$SetFloorVisibilityFromJson(json);

 final  int floorIndex;
 final  bool visible;
@JsonKey() final  double opacity;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetFloorVisibilityCopyWith<_SetFloorVisibility> get copyWith => __$SetFloorVisibilityCopyWithImpl<_SetFloorVisibility>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetFloorVisibilityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetFloorVisibility&&(identical(other.floorIndex, floorIndex) || other.floorIndex == floorIndex)&&(identical(other.visible, visible) || other.visible == visible)&&(identical(other.opacity, opacity) || other.opacity == opacity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,floorIndex,visible,opacity);
}

@override
String toString() {
    return 'DigitalTwinMessage.setFloorVisibility(floorIndex: $floorIndex, visible: $visible, opacity: $opacity)';
}


}

/// @nodoc
abstract mixin class _$SetFloorVisibilityCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$SetFloorVisibilityCopyWith(_SetFloorVisibility value, $Res Function(_SetFloorVisibility) _then) = __$SetFloorVisibilityCopyWithImpl;
@useResult
$Res call({
 int floorIndex, bool visible, double opacity
});




}
/// @nodoc
class __$SetFloorVisibilityCopyWithImpl<$Res>
    implements _$SetFloorVisibilityCopyWith<$Res> {
  __$SetFloorVisibilityCopyWithImpl(this._self, this._then);

  final _SetFloorVisibility _self;
  final $Res Function(_SetFloorVisibility) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? floorIndex = null,Object? visible = null,Object? opacity = null,}) {
  return _then(_SetFloorVisibility(
floorIndex: null == floorIndex ? _self.floorIndex : floorIndex // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _HighlightRoom implements DigitalTwinMessage {
  const _HighlightRoom({required this.roomId, this.color,  String? $type}): $type = $type ?? 'highlightRoom';
  factory _HighlightRoom.fromJson(Map<String, dynamic> json) => _$HighlightRoomFromJson(json);

 final  String roomId;
 final  int? color;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HighlightRoomCopyWith<_HighlightRoom> get copyWith => __$HighlightRoomCopyWithImpl<_HighlightRoom>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HighlightRoomToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HighlightRoom&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,roomId,color);
}

@override
String toString() {
    return 'DigitalTwinMessage.highlightRoom(roomId: $roomId, color: $color)';
}


}

/// @nodoc
abstract mixin class _$HighlightRoomCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$HighlightRoomCopyWith(_HighlightRoom value, $Res Function(_HighlightRoom) _then) = __$HighlightRoomCopyWithImpl;
@useResult
$Res call({
 String roomId, int? color
});




}
/// @nodoc
class __$HighlightRoomCopyWithImpl<$Res>
    implements _$HighlightRoomCopyWith<$Res> {
  __$HighlightRoomCopyWithImpl(this._self, this._then);

  final _HighlightRoom _self;
  final $Res Function(_HighlightRoom) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? color = freezed,}) {
  return _then(_HighlightRoom(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _ClearHighlight implements DigitalTwinMessage {
  const _ClearHighlight({required this.roomId,  String? $type}): $type = $type ?? 'clearHighlight';
  factory _ClearHighlight.fromJson(Map<String, dynamic> json) => _$ClearHighlightFromJson(json);

 final  String roomId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClearHighlightCopyWith<_ClearHighlight> get copyWith => __$ClearHighlightCopyWithImpl<_ClearHighlight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClearHighlightToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearHighlight&&(identical(other.roomId, roomId) || other.roomId == roomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,roomId);
}

@override
String toString() {
    return 'DigitalTwinMessage.clearHighlight(roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$ClearHighlightCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$ClearHighlightCopyWith(_ClearHighlight value, $Res Function(_ClearHighlight) _then) = __$ClearHighlightCopyWithImpl;
@useResult
$Res call({
 String roomId
});




}
/// @nodoc
class __$ClearHighlightCopyWithImpl<$Res>
    implements _$ClearHighlightCopyWith<$Res> {
  __$ClearHighlightCopyWithImpl(this._self, this._then);

  final _ClearHighlight _self;
  final $Res Function(_ClearHighlight) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,}) {
  return _then(_ClearHighlight(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _FlyToRoom implements DigitalTwinMessage {
  const _FlyToRoom({required this.roomId, this.duration = 1000,  String? $type}): $type = $type ?? 'flyToRoom';
  factory _FlyToRoom.fromJson(Map<String, dynamic> json) => _$FlyToRoomFromJson(json);

 final  String roomId;
@JsonKey() final  int duration;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlyToRoomCopyWith<_FlyToRoom> get copyWith => __$FlyToRoomCopyWithImpl<_FlyToRoom>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlyToRoomToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlyToRoom&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,roomId,duration);
}

@override
String toString() {
    return 'DigitalTwinMessage.flyToRoom(roomId: $roomId, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$FlyToRoomCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$FlyToRoomCopyWith(_FlyToRoom value, $Res Function(_FlyToRoom) _then) = __$FlyToRoomCopyWithImpl;
@useResult
$Res call({
 String roomId, int duration
});




}
/// @nodoc
class __$FlyToRoomCopyWithImpl<$Res>
    implements _$FlyToRoomCopyWith<$Res> {
  __$FlyToRoomCopyWithImpl(this._self, this._then);

  final _FlyToRoom _self;
  final $Res Function(_FlyToRoom) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? duration = null,}) {
  return _then(_FlyToRoom(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _SetTheme implements DigitalTwinMessage {
  const _SetTheme({required this.theme,  String? $type}): $type = $type ?? 'setTheme';
  factory _SetTheme.fromJson(Map<String, dynamic> json) => _$SetThemeFromJson(json);

 final  String theme;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetThemeCopyWith<_SetTheme> get copyWith => __$SetThemeCopyWithImpl<_SetTheme>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetThemeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetTheme&&(identical(other.theme, theme) || other.theme == theme));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,theme);
}

@override
String toString() {
    return 'DigitalTwinMessage.setTheme(theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$SetThemeCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$SetThemeCopyWith(_SetTheme value, $Res Function(_SetTheme) _then) = __$SetThemeCopyWithImpl;
@useResult
$Res call({
 String theme
});




}
/// @nodoc
class __$SetThemeCopyWithImpl<$Res>
    implements _$SetThemeCopyWith<$Res> {
  __$SetThemeCopyWithImpl(this._self, this._then);

  final _SetTheme _self;
  final $Res Function(_SetTheme) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? theme = null,}) {
  return _then(_SetTheme(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _SetExplodedView implements DigitalTwinMessage {
  const _SetExplodedView({required this.enabled, this.separation = 5.0,  String? $type}): $type = $type ?? 'setExplodedView';
  factory _SetExplodedView.fromJson(Map<String, dynamic> json) => _$SetExplodedViewFromJson(json);

 final  bool enabled;
@JsonKey() final  double separation;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetExplodedViewCopyWith<_SetExplodedView> get copyWith => __$SetExplodedViewCopyWithImpl<_SetExplodedView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetExplodedViewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetExplodedView&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.separation, separation) || other.separation == separation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,enabled,separation);
}

@override
String toString() {
    return 'DigitalTwinMessage.setExplodedView(enabled: $enabled, separation: $separation)';
}


}

/// @nodoc
abstract mixin class _$SetExplodedViewCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$SetExplodedViewCopyWith(_SetExplodedView value, $Res Function(_SetExplodedView) _then) = __$SetExplodedViewCopyWithImpl;
@useResult
$Res call({
 bool enabled, double separation
});




}
/// @nodoc
class __$SetExplodedViewCopyWithImpl<$Res>
    implements _$SetExplodedViewCopyWith<$Res> {
  __$SetExplodedViewCopyWithImpl(this._self, this._then);

  final _SetExplodedView _self;
  final $Res Function(_SetExplodedView) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? separation = null,}) {
  return _then(_SetExplodedView(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,separation: null == separation ? _self.separation : separation // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _SetCameraPosition implements DigitalTwinMessage {
  const _SetCameraPosition({required this.x, required this.y, required this.z,  String? $type}): $type = $type ?? 'setCameraPosition';
  factory _SetCameraPosition.fromJson(Map<String, dynamic> json) => _$SetCameraPositionFromJson(json);

 final  double x;
 final  double y;
 final  double z;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCameraPositionCopyWith<_SetCameraPosition> get copyWith => __$SetCameraPositionCopyWithImpl<_SetCameraPosition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetCameraPositionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCameraPosition&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y,z);
}

@override
String toString() {
    return 'DigitalTwinMessage.setCameraPosition(x: $x, y: $y, z: $z)';
}


}

/// @nodoc
abstract mixin class _$SetCameraPositionCopyWith<$Res> implements $DigitalTwinMessageCopyWith<$Res> {
  factory _$SetCameraPositionCopyWith(_SetCameraPosition value, $Res Function(_SetCameraPosition) _then) = __$SetCameraPositionCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z
});




}
/// @nodoc
class __$SetCameraPositionCopyWithImpl<$Res>
    implements _$SetCameraPositionCopyWith<$Res> {
  __$SetCameraPositionCopyWithImpl(this._self, this._then);

  final _SetCameraPosition _self;
  final $Res Function(_SetCameraPosition) _then;

/// Create a copy of DigitalTwinMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,}) {
  return _then(_SetCameraPosition(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _RequestState implements DigitalTwinMessage {
  const _RequestState({ String? $type}): $type = $type ?? 'requestState';
  factory _RequestState.fromJson(Map<String, dynamic> json) => _$RequestStateFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$RequestStateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestState);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DigitalTwinMessage.requestState()';
}


}




ThreeJsEvent _$ThreeJsEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'modelLoaded':
          return _ModelLoaded.fromJson(
            json
          );
                case 'floorChanged':
          return _FloorChanged.fromJson(
            json
          );
                case 'roomHovered':
          return _RoomHovered.fromJson(
            json
          );
                case 'roomSelected':
          return _RoomSelected.fromJson(
            json
          );
                case 'cameraChanged':
          return _CameraChanged.fromJson(
            json
          );
                case 'threeJsError':
          return _ThreeJsError.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ThreeJsEvent',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ThreeJsEvent {



  /// Serializes this ThreeJsEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreeJsEvent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ThreeJsEvent()';
}


}

/// @nodoc
class $ThreeJsEventCopyWith<$Res>  {
$ThreeJsEventCopyWith(ThreeJsEvent _, $Res Function(ThreeJsEvent) __);
}


/// Adds pattern-matching-related methods to [ThreeJsEvent].
extension ThreeJsEventPatterns on ThreeJsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ModelLoaded value)?  modelLoaded,TResult Function( _FloorChanged value)?  floorChanged,TResult Function( _RoomHovered value)?  roomHovered,TResult Function( _RoomSelected value)?  roomSelected,TResult Function( _CameraChanged value)?  cameraChanged,TResult Function( _ThreeJsError value)?  threeJsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelLoaded() when modelLoaded != null:
return modelLoaded(_that);case _FloorChanged() when floorChanged != null:
return floorChanged(_that);case _RoomHovered() when roomHovered != null:
return roomHovered(_that);case _RoomSelected() when roomSelected != null:
return roomSelected(_that);case _CameraChanged() when cameraChanged != null:
return cameraChanged(_that);case _ThreeJsError() when threeJsError != null:
return threeJsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ModelLoaded value)  modelLoaded,required TResult Function( _FloorChanged value)  floorChanged,required TResult Function( _RoomHovered value)  roomHovered,required TResult Function( _RoomSelected value)  roomSelected,required TResult Function( _CameraChanged value)  cameraChanged,required TResult Function( _ThreeJsError value)  threeJsError,}){
final _that = this;
switch (_that) {
case _ModelLoaded():
return modelLoaded(_that);case _FloorChanged():
return floorChanged(_that);case _RoomHovered():
return roomHovered(_that);case _RoomSelected():
return roomSelected(_that);case _CameraChanged():
return cameraChanged(_that);case _ThreeJsError():
return threeJsError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ModelLoaded value)?  modelLoaded,TResult? Function( _FloorChanged value)?  floorChanged,TResult? Function( _RoomHovered value)?  roomHovered,TResult? Function( _RoomSelected value)?  roomSelected,TResult? Function( _CameraChanged value)?  cameraChanged,TResult? Function( _ThreeJsError value)?  threeJsError,}){
final _that = this;
switch (_that) {
case _ModelLoaded() when modelLoaded != null:
return modelLoaded(_that);case _FloorChanged() when floorChanged != null:
return floorChanged(_that);case _RoomHovered() when roomHovered != null:
return roomHovered(_that);case _RoomSelected() when roomSelected != null:
return roomSelected(_that);case _CameraChanged() when cameraChanged != null:
return cameraChanged(_that);case _ThreeJsError() when threeJsError != null:
return threeJsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String buildingId)?  modelLoaded,TResult Function( int floorIndex)?  floorChanged,TResult Function( String roomId)?  roomHovered,TResult Function( String roomId)?  roomSelected,TResult Function( CameraState camera)?  cameraChanged,TResult Function( String message)?  threeJsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelLoaded() when modelLoaded != null:
return modelLoaded(_that.buildingId);case _FloorChanged() when floorChanged != null:
return floorChanged(_that.floorIndex);case _RoomHovered() when roomHovered != null:
return roomHovered(_that.roomId);case _RoomSelected() when roomSelected != null:
return roomSelected(_that.roomId);case _CameraChanged() when cameraChanged != null:
return cameraChanged(_that.camera);case _ThreeJsError() when threeJsError != null:
return threeJsError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String buildingId)  modelLoaded,required TResult Function( int floorIndex)  floorChanged,required TResult Function( String roomId)  roomHovered,required TResult Function( String roomId)  roomSelected,required TResult Function( CameraState camera)  cameraChanged,required TResult Function( String message)  threeJsError,}) {final _that = this;
switch (_that) {
case _ModelLoaded():
return modelLoaded(_that.buildingId);case _FloorChanged():
return floorChanged(_that.floorIndex);case _RoomHovered():
return roomHovered(_that.roomId);case _RoomSelected():
return roomSelected(_that.roomId);case _CameraChanged():
return cameraChanged(_that.camera);case _ThreeJsError():
return threeJsError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String buildingId)?  modelLoaded,TResult? Function( int floorIndex)?  floorChanged,TResult? Function( String roomId)?  roomHovered,TResult? Function( String roomId)?  roomSelected,TResult? Function( CameraState camera)?  cameraChanged,TResult? Function( String message)?  threeJsError,}) {final _that = this;
switch (_that) {
case _ModelLoaded() when modelLoaded != null:
return modelLoaded(_that.buildingId);case _FloorChanged() when floorChanged != null:
return floorChanged(_that.floorIndex);case _RoomHovered() when roomHovered != null:
return roomHovered(_that.roomId);case _RoomSelected() when roomSelected != null:
return roomSelected(_that.roomId);case _CameraChanged() when cameraChanged != null:
return cameraChanged(_that.camera);case _ThreeJsError() when threeJsError != null:
return threeJsError(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelLoaded implements ThreeJsEvent {
  const _ModelLoaded({required this.buildingId,  String? $type}): $type = $type ?? 'modelLoaded';
  factory _ModelLoaded.fromJson(Map<String, dynamic> json) => _$ModelLoadedFromJson(json);

 final  String buildingId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelLoadedCopyWith<_ModelLoaded> get copyWith => __$ModelLoadedCopyWithImpl<_ModelLoaded>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelLoadedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelLoaded&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId);
}

@override
String toString() {
    return 'ThreeJsEvent.modelLoaded(buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class _$ModelLoadedCopyWith<$Res> implements $ThreeJsEventCopyWith<$Res> {
  factory _$ModelLoadedCopyWith(_ModelLoaded value, $Res Function(_ModelLoaded) _then) = __$ModelLoadedCopyWithImpl;
@useResult
$Res call({
 String buildingId
});




}
/// @nodoc
class __$ModelLoadedCopyWithImpl<$Res>
    implements _$ModelLoadedCopyWith<$Res> {
  __$ModelLoadedCopyWithImpl(this._self, this._then);

  final _ModelLoaded _self;
  final $Res Function(_ModelLoaded) _then;

/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,}) {
  return _then(_ModelLoaded(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _FloorChanged implements ThreeJsEvent {
  const _FloorChanged({required this.floorIndex,  String? $type}): $type = $type ?? 'floorChanged';
  factory _FloorChanged.fromJson(Map<String, dynamic> json) => _$FloorChangedFromJson(json);

 final  int floorIndex;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorChangedCopyWith<_FloorChanged> get copyWith => __$FloorChangedCopyWithImpl<_FloorChanged>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FloorChangedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloorChanged&&(identical(other.floorIndex, floorIndex) || other.floorIndex == floorIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,floorIndex);
}

@override
String toString() {
    return 'ThreeJsEvent.floorChanged(floorIndex: $floorIndex)';
}


}

/// @nodoc
abstract mixin class _$FloorChangedCopyWith<$Res> implements $ThreeJsEventCopyWith<$Res> {
  factory _$FloorChangedCopyWith(_FloorChanged value, $Res Function(_FloorChanged) _then) = __$FloorChangedCopyWithImpl;
@useResult
$Res call({
 int floorIndex
});




}
/// @nodoc
class __$FloorChangedCopyWithImpl<$Res>
    implements _$FloorChangedCopyWith<$Res> {
  __$FloorChangedCopyWithImpl(this._self, this._then);

  final _FloorChanged _self;
  final $Res Function(_FloorChanged) _then;

/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? floorIndex = null,}) {
  return _then(_FloorChanged(
floorIndex: null == floorIndex ? _self.floorIndex : floorIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _RoomHovered implements ThreeJsEvent {
  const _RoomHovered({required this.roomId,  String? $type}): $type = $type ?? 'roomHovered';
  factory _RoomHovered.fromJson(Map<String, dynamic> json) => _$RoomHoveredFromJson(json);

 final  String roomId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomHoveredCopyWith<_RoomHovered> get copyWith => __$RoomHoveredCopyWithImpl<_RoomHovered>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomHoveredToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomHovered&&(identical(other.roomId, roomId) || other.roomId == roomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,roomId);
}

@override
String toString() {
    return 'ThreeJsEvent.roomHovered(roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$RoomHoveredCopyWith<$Res> implements $ThreeJsEventCopyWith<$Res> {
  factory _$RoomHoveredCopyWith(_RoomHovered value, $Res Function(_RoomHovered) _then) = __$RoomHoveredCopyWithImpl;
@useResult
$Res call({
 String roomId
});




}
/// @nodoc
class __$RoomHoveredCopyWithImpl<$Res>
    implements _$RoomHoveredCopyWith<$Res> {
  __$RoomHoveredCopyWithImpl(this._self, this._then);

  final _RoomHovered _self;
  final $Res Function(_RoomHovered) _then;

/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,}) {
  return _then(_RoomHovered(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _RoomSelected implements ThreeJsEvent {
  const _RoomSelected({required this.roomId,  String? $type}): $type = $type ?? 'roomSelected';
  factory _RoomSelected.fromJson(Map<String, dynamic> json) => _$RoomSelectedFromJson(json);

 final  String roomId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomSelectedCopyWith<_RoomSelected> get copyWith => __$RoomSelectedCopyWithImpl<_RoomSelected>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomSelectedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomSelected&&(identical(other.roomId, roomId) || other.roomId == roomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,roomId);
}

@override
String toString() {
    return 'ThreeJsEvent.roomSelected(roomId: $roomId)';
}


}

/// @nodoc
abstract mixin class _$RoomSelectedCopyWith<$Res> implements $ThreeJsEventCopyWith<$Res> {
  factory _$RoomSelectedCopyWith(_RoomSelected value, $Res Function(_RoomSelected) _then) = __$RoomSelectedCopyWithImpl;
@useResult
$Res call({
 String roomId
});




}
/// @nodoc
class __$RoomSelectedCopyWithImpl<$Res>
    implements _$RoomSelectedCopyWith<$Res> {
  __$RoomSelectedCopyWithImpl(this._self, this._then);

  final _RoomSelected _self;
  final $Res Function(_RoomSelected) _then;

/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roomId = null,}) {
  return _then(_RoomSelected(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _CameraChanged implements ThreeJsEvent {
  const _CameraChanged({required this.camera,  String? $type}): $type = $type ?? 'cameraChanged';
  factory _CameraChanged.fromJson(Map<String, dynamic> json) => _$CameraChangedFromJson(json);

 final  CameraState camera;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CameraChangedCopyWith<_CameraChanged> get copyWith => __$CameraChangedCopyWithImpl<_CameraChanged>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CameraChangedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CameraChanged&&(identical(other.camera, camera) || other.camera == camera));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,camera);
}

@override
String toString() {
    return 'ThreeJsEvent.cameraChanged(camera: $camera)';
}


}

/// @nodoc
abstract mixin class _$CameraChangedCopyWith<$Res> implements $ThreeJsEventCopyWith<$Res> {
  factory _$CameraChangedCopyWith(_CameraChanged value, $Res Function(_CameraChanged) _then) = __$CameraChangedCopyWithImpl;
@useResult
$Res call({
 CameraState camera
});


$CameraStateCopyWith<$Res> get camera;

}
/// @nodoc
class __$CameraChangedCopyWithImpl<$Res>
    implements _$CameraChangedCopyWith<$Res> {
  __$CameraChangedCopyWithImpl(this._self, this._then);

  final _CameraChanged _self;
  final $Res Function(_CameraChanged) _then;

/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? camera = null,}) {
  return _then(_CameraChanged(
camera: null == camera ? _self.camera : camera // ignore: cast_nullable_to_non_nullable
as CameraState,
  ));
}

/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CameraStateCopyWith<$Res> get camera {
  
  return $CameraStateCopyWith<$Res>(_self.camera, (value) {
    return _then(_self.copyWith(camera: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _ThreeJsError implements ThreeJsEvent {
  const _ThreeJsError({required this.message,  String? $type}): $type = $type ?? 'threeJsError';
  factory _ThreeJsError.fromJson(Map<String, dynamic> json) => _$ThreeJsErrorFromJson(json);

 final  String message;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreeJsErrorCopyWith<_ThreeJsError> get copyWith => __$ThreeJsErrorCopyWithImpl<_ThreeJsError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreeJsErrorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreeJsError&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'ThreeJsEvent.threeJsError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ThreeJsErrorCopyWith<$Res> implements $ThreeJsEventCopyWith<$Res> {
  factory _$ThreeJsErrorCopyWith(_ThreeJsError value, $Res Function(_ThreeJsError) _then) = __$ThreeJsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ThreeJsErrorCopyWithImpl<$Res>
    implements _$ThreeJsErrorCopyWith<$Res> {
  __$ThreeJsErrorCopyWithImpl(this._self, this._then);

  final _ThreeJsError _self;
  final $Res Function(_ThreeJsError) _then;

/// Create a copy of ThreeJsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ThreeJsError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CoordinateTransform {

 String get buildingId; String get sourceCrs; String get targetCrs; Matrix4x4 get transformMatrix; Vector3D get translation; Vector3D get scale; double get rotation; BoundingBox2D get sourceBounds; BoundingBox2D get targetBounds;
/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordinateTransformCopyWith<CoordinateTransform> get copyWith => _$CoordinateTransformCopyWithImpl<CoordinateTransform>(this as CoordinateTransform, _$identity);

  /// Serializes this CoordinateTransform to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CoordinateTransform;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoordinateTransform&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.sourceCrs, _this.sourceCrs) || other.sourceCrs == _this.sourceCrs)&&(identical(other.targetCrs, _this.targetCrs) || other.targetCrs == _this.targetCrs)&&(identical(other.transformMatrix, _this.transformMatrix) || other.transformMatrix == _this.transformMatrix)&&(identical(other.translation, _this.translation) || other.translation == _this.translation)&&(identical(other.scale, _this.scale) || other.scale == _this.scale)&&(identical(other.rotation, _this.rotation) || other.rotation == _this.rotation)&&(identical(other.sourceBounds, _this.sourceBounds) || other.sourceBounds == _this.sourceBounds)&&(identical(other.targetBounds, _this.targetBounds) || other.targetBounds == _this.targetBounds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CoordinateTransform;
  return Object.hash(runtimeType,_this.buildingId,_this.sourceCrs,_this.targetCrs,_this.transformMatrix,_this.translation,_this.scale,_this.rotation,_this.sourceBounds,_this.targetBounds);
}

@override
String toString() {
  final _this = this as CoordinateTransform;
  return 'CoordinateTransform(buildingId: ${_this.buildingId}, sourceCrs: ${_this.sourceCrs}, targetCrs: ${_this.targetCrs}, transformMatrix: ${_this.transformMatrix}, translation: ${_this.translation}, scale: ${_this.scale}, rotation: ${_this.rotation}, sourceBounds: ${_this.sourceBounds}, targetBounds: ${_this.targetBounds})';
}


}

/// @nodoc
abstract mixin class $CoordinateTransformCopyWith<$Res>  {
  factory $CoordinateTransformCopyWith(CoordinateTransform value, $Res Function(CoordinateTransform) _then) = _$CoordinateTransformCopyWithImpl;
@useResult
$Res call({
 String buildingId, String sourceCrs, String targetCrs, Matrix4x4 transformMatrix, Vector3D translation, Vector3D scale, double rotation, BoundingBox2D sourceBounds, BoundingBox2D targetBounds
});


$Matrix4x4CopyWith<$Res> get transformMatrix;$Vector3DCopyWith<$Res> get translation;$Vector3DCopyWith<$Res> get scale;$BoundingBox2DCopyWith<$Res> get sourceBounds;$BoundingBox2DCopyWith<$Res> get targetBounds;

}
/// @nodoc
class _$CoordinateTransformCopyWithImpl<$Res>
    implements $CoordinateTransformCopyWith<$Res> {
  _$CoordinateTransformCopyWithImpl(this._self, this._then);

  final CoordinateTransform _self;
  final $Res Function(CoordinateTransform) _then;

/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buildingId = null,Object? sourceCrs = null,Object? targetCrs = null,Object? transformMatrix = null,Object? translation = null,Object? scale = null,Object? rotation = null,Object? sourceBounds = null,Object? targetBounds = null,}) {
  return _then(CoordinateTransform(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,sourceCrs: null == sourceCrs ? _self.sourceCrs : sourceCrs // ignore: cast_nullable_to_non_nullable
as String,targetCrs: null == targetCrs ? _self.targetCrs : targetCrs // ignore: cast_nullable_to_non_nullable
as String,transformMatrix: null == transformMatrix ? _self.transformMatrix : transformMatrix // ignore: cast_nullable_to_non_nullable
as Matrix4x4,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as Vector3D,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as Vector3D,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,sourceBounds: null == sourceBounds ? _self.sourceBounds : sourceBounds // ignore: cast_nullable_to_non_nullable
as BoundingBox2D,targetBounds: null == targetBounds ? _self.targetBounds : targetBounds // ignore: cast_nullable_to_non_nullable
as BoundingBox2D,
  ));
}
/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Matrix4x4CopyWith<$Res> get transformMatrix {
  
  return $Matrix4x4CopyWith<$Res>(_self.transformMatrix, (value) {
    return _then(_self.copyWith(transformMatrix: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get translation {
  
  return $Vector3DCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get scale {
  
  return $Vector3DCopyWith<$Res>(_self.scale, (value) {
    return _then(_self.copyWith(scale: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundingBox2DCopyWith<$Res> get sourceBounds {
  
  return $BoundingBox2DCopyWith<$Res>(_self.sourceBounds, (value) {
    return _then(_self.copyWith(sourceBounds: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundingBox2DCopyWith<$Res> get targetBounds {
  
  return $BoundingBox2DCopyWith<$Res>(_self.targetBounds, (value) {
    return _then(_self.copyWith(targetBounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoordinateTransform].
extension CoordinateTransformPatterns on CoordinateTransform {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoordinateTransform value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoordinateTransform() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoordinateTransform value)  $default,){
final _that = this;
switch (_that) {
case _CoordinateTransform():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoordinateTransform value)?  $default,){
final _that = this;
switch (_that) {
case _CoordinateTransform() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String buildingId,  String sourceCrs,  String targetCrs,  Matrix4x4 transformMatrix,  Vector3D translation,  Vector3D scale,  double rotation,  BoundingBox2D sourceBounds,  BoundingBox2D targetBounds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoordinateTransform() when $default != null:
return $default(_that.buildingId,_that.sourceCrs,_that.targetCrs,_that.transformMatrix,_that.translation,_that.scale,_that.rotation,_that.sourceBounds,_that.targetBounds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String buildingId,  String sourceCrs,  String targetCrs,  Matrix4x4 transformMatrix,  Vector3D translation,  Vector3D scale,  double rotation,  BoundingBox2D sourceBounds,  BoundingBox2D targetBounds)  $default,) {final _that = this;
switch (_that) {
case _CoordinateTransform():
return $default(_that.buildingId,_that.sourceCrs,_that.targetCrs,_that.transformMatrix,_that.translation,_that.scale,_that.rotation,_that.sourceBounds,_that.targetBounds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String buildingId,  String sourceCrs,  String targetCrs,  Matrix4x4 transformMatrix,  Vector3D translation,  Vector3D scale,  double rotation,  BoundingBox2D sourceBounds,  BoundingBox2D targetBounds)?  $default,) {final _that = this;
switch (_that) {
case _CoordinateTransform() when $default != null:
return $default(_that.buildingId,_that.sourceCrs,_that.targetCrs,_that.transformMatrix,_that.translation,_that.scale,_that.rotation,_that.sourceBounds,_that.targetBounds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoordinateTransform implements CoordinateTransform {
  const _CoordinateTransform({required this.buildingId, required this.sourceCrs, required this.targetCrs, required this.transformMatrix, required this.translation, required this.scale, required this.rotation, required this.sourceBounds, required this.targetBounds});
  factory _CoordinateTransform.fromJson(Map<String, dynamic> json) => _$CoordinateTransformFromJson(json);

@override final  String buildingId;
@override final  String sourceCrs;
@override final  String targetCrs;
@override final  Matrix4x4 transformMatrix;
@override final  Vector3D translation;
@override final  Vector3D scale;
@override final  double rotation;
@override final  BoundingBox2D sourceBounds;
@override final  BoundingBox2D targetBounds;

/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordinateTransformCopyWith<_CoordinateTransform> get copyWith => __$CoordinateTransformCopyWithImpl<_CoordinateTransform>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoordinateTransformToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoordinateTransform&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.sourceCrs, sourceCrs) || other.sourceCrs == sourceCrs)&&(identical(other.targetCrs, targetCrs) || other.targetCrs == targetCrs)&&(identical(other.transformMatrix, transformMatrix) || other.transformMatrix == transformMatrix)&&(identical(other.translation, translation) || other.translation == translation)&&(identical(other.scale, scale) || other.scale == scale)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.sourceBounds, sourceBounds) || other.sourceBounds == sourceBounds)&&(identical(other.targetBounds, targetBounds) || other.targetBounds == targetBounds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,sourceCrs,targetCrs,transformMatrix,translation,scale,rotation,sourceBounds,targetBounds);
}

@override
String toString() {
    return 'CoordinateTransform(buildingId: $buildingId, sourceCrs: $sourceCrs, targetCrs: $targetCrs, transformMatrix: $transformMatrix, translation: $translation, scale: $scale, rotation: $rotation, sourceBounds: $sourceBounds, targetBounds: $targetBounds)';
}


}

/// @nodoc
abstract mixin class _$CoordinateTransformCopyWith<$Res> implements $CoordinateTransformCopyWith<$Res> {
  factory _$CoordinateTransformCopyWith(_CoordinateTransform value, $Res Function(_CoordinateTransform) _then) = __$CoordinateTransformCopyWithImpl;
@override @useResult
$Res call({
 String buildingId, String sourceCrs, String targetCrs, Matrix4x4 transformMatrix, Vector3D translation, Vector3D scale, double rotation, BoundingBox2D sourceBounds, BoundingBox2D targetBounds
});


@override $Matrix4x4CopyWith<$Res> get transformMatrix;@override $Vector3DCopyWith<$Res> get translation;@override $Vector3DCopyWith<$Res> get scale;@override $BoundingBox2DCopyWith<$Res> get sourceBounds;@override $BoundingBox2DCopyWith<$Res> get targetBounds;

}
/// @nodoc
class __$CoordinateTransformCopyWithImpl<$Res>
    implements _$CoordinateTransformCopyWith<$Res> {
  __$CoordinateTransformCopyWithImpl(this._self, this._then);

  final _CoordinateTransform _self;
  final $Res Function(_CoordinateTransform) _then;

/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? sourceCrs = null,Object? targetCrs = null,Object? transformMatrix = null,Object? translation = null,Object? scale = null,Object? rotation = null,Object? sourceBounds = null,Object? targetBounds = null,}) {
  return _then(_CoordinateTransform(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,sourceCrs: null == sourceCrs ? _self.sourceCrs : sourceCrs // ignore: cast_nullable_to_non_nullable
as String,targetCrs: null == targetCrs ? _self.targetCrs : targetCrs // ignore: cast_nullable_to_non_nullable
as String,transformMatrix: null == transformMatrix ? _self.transformMatrix : transformMatrix // ignore: cast_nullable_to_non_nullable
as Matrix4x4,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as Vector3D,scale: null == scale ? _self.scale : scale // ignore: cast_nullable_to_non_nullable
as Vector3D,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,sourceBounds: null == sourceBounds ? _self.sourceBounds : sourceBounds // ignore: cast_nullable_to_non_nullable
as BoundingBox2D,targetBounds: null == targetBounds ? _self.targetBounds : targetBounds // ignore: cast_nullable_to_non_nullable
as BoundingBox2D,
  ));
}

/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Matrix4x4CopyWith<$Res> get transformMatrix {
  
  return $Matrix4x4CopyWith<$Res>(_self.transformMatrix, (value) {
    return _then(_self.copyWith(transformMatrix: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get translation {
  
  return $Vector3DCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get scale {
  
  return $Vector3DCopyWith<$Res>(_self.scale, (value) {
    return _then(_self.copyWith(scale: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundingBox2DCopyWith<$Res> get sourceBounds {
  
  return $BoundingBox2DCopyWith<$Res>(_self.sourceBounds, (value) {
    return _then(_self.copyWith(sourceBounds: value));
  });
}/// Create a copy of CoordinateTransform
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoundingBox2DCopyWith<$Res> get targetBounds {
  
  return $BoundingBox2DCopyWith<$Res>(_self.targetBounds, (value) {
    return _then(_self.copyWith(targetBounds: value));
  });
}
}


/// @nodoc
mixin _$Matrix4x4 {

 List<List<double>> get values;
/// Create a copy of Matrix4x4
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Matrix4x4CopyWith<Matrix4x4> get copyWith => _$Matrix4x4CopyWithImpl<Matrix4x4>(this as Matrix4x4, _$identity);

  /// Serializes this Matrix4x4 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Matrix4x4;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Matrix4x4&&const DeepCollectionEquality().equals(other.values, _this.values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Matrix4x4;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.values));
}

@override
String toString() {
  final _this = this as Matrix4x4;
  return 'Matrix4x4(values: ${_this.values})';
}


}

/// @nodoc
abstract mixin class $Matrix4x4CopyWith<$Res>  {
  factory $Matrix4x4CopyWith(Matrix4x4 value, $Res Function(Matrix4x4) _then) = _$Matrix4x4CopyWithImpl;
@useResult
$Res call({
 List<List<double>> values
});




}
/// @nodoc
class _$Matrix4x4CopyWithImpl<$Res>
    implements $Matrix4x4CopyWith<$Res> {
  _$Matrix4x4CopyWithImpl(this._self, this._then);

  final Matrix4x4 _self;
  final $Res Function(Matrix4x4) _then;

/// Create a copy of Matrix4x4
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? values = null,}) {
  return _then(Matrix4x4(
values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}

}


/// Adds pattern-matching-related methods to [Matrix4x4].
extension Matrix4x4Patterns on Matrix4x4 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Matrix4x4 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Matrix4x4() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Matrix4x4 value)  $default,){
final _that = this;
switch (_that) {
case _Matrix4x4():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Matrix4x4 value)?  $default,){
final _that = this;
switch (_that) {
case _Matrix4x4() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<List<double>> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Matrix4x4() when $default != null:
return $default(_that.values);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<List<double>> values)  $default,) {final _that = this;
switch (_that) {
case _Matrix4x4():
return $default(_that.values);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<List<double>> values)?  $default,) {final _that = this;
switch (_that) {
case _Matrix4x4() when $default != null:
return $default(_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Matrix4x4 extends Matrix4x4 {
  const _Matrix4x4({required  List<List<double>> values}): _values = values,super._();
  factory _Matrix4x4.fromJson(Map<String, dynamic> json) => _$Matrix4x4FromJson(json);

 final  List<List<double>> _values;
@override List<List<double>> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}


/// Create a copy of Matrix4x4
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Matrix4x4CopyWith<_Matrix4x4> get copyWith => __$Matrix4x4CopyWithImpl<_Matrix4x4>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Matrix4x4ToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Matrix4x4&&const DeepCollectionEquality().equals(other.values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_values));
}

@override
String toString() {
    return 'Matrix4x4(values: $values)';
}


}

/// @nodoc
abstract mixin class _$Matrix4x4CopyWith<$Res> implements $Matrix4x4CopyWith<$Res> {
  factory _$Matrix4x4CopyWith(_Matrix4x4 value, $Res Function(_Matrix4x4) _then) = __$Matrix4x4CopyWithImpl;
@override @useResult
$Res call({
 List<List<double>> values
});




}
/// @nodoc
class __$Matrix4x4CopyWithImpl<$Res>
    implements _$Matrix4x4CopyWith<$Res> {
  __$Matrix4x4CopyWithImpl(this._self, this._then);

  final _Matrix4x4 _self;
  final $Res Function(_Matrix4x4) _then;

/// Create a copy of Matrix4x4
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? values = null,}) {
  return _then(_Matrix4x4(
values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}


}


/// @nodoc
mixin _$BoundingBox2D {

 double get minX; double get minY; double get maxX; double get maxY;
/// Create a copy of BoundingBox2D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoundingBox2DCopyWith<BoundingBox2D> get copyWith => _$BoundingBox2DCopyWithImpl<BoundingBox2D>(this as BoundingBox2D, _$identity);

  /// Serializes this BoundingBox2D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BoundingBox2D;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoundingBox2D&&(identical(other.minX, _this.minX) || other.minX == _this.minX)&&(identical(other.minY, _this.minY) || other.minY == _this.minY)&&(identical(other.maxX, _this.maxX) || other.maxX == _this.maxX)&&(identical(other.maxY, _this.maxY) || other.maxY == _this.maxY));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BoundingBox2D;
  return Object.hash(runtimeType,_this.minX,_this.minY,_this.maxX,_this.maxY);
}

@override
String toString() {
  final _this = this as BoundingBox2D;
  return 'BoundingBox2D(minX: ${_this.minX}, minY: ${_this.minY}, maxX: ${_this.maxX}, maxY: ${_this.maxY})';
}


}

/// @nodoc
abstract mixin class $BoundingBox2DCopyWith<$Res>  {
  factory $BoundingBox2DCopyWith(BoundingBox2D value, $Res Function(BoundingBox2D) _then) = _$BoundingBox2DCopyWithImpl;
@useResult
$Res call({
 double minX, double minY, double maxX, double maxY
});




}
/// @nodoc
class _$BoundingBox2DCopyWithImpl<$Res>
    implements $BoundingBox2DCopyWith<$Res> {
  _$BoundingBox2DCopyWithImpl(this._self, this._then);

  final BoundingBox2D _self;
  final $Res Function(BoundingBox2D) _then;

/// Create a copy of BoundingBox2D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minX = null,Object? minY = null,Object? maxX = null,Object? maxY = null,}) {
  return _then(BoundingBox2D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BoundingBox2D].
extension BoundingBox2DPatterns on BoundingBox2D {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoundingBox2D value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoundingBox2D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoundingBox2D value)  $default,){
final _that = this;
switch (_that) {
case _BoundingBox2D():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoundingBox2D value)?  $default,){
final _that = this;
switch (_that) {
case _BoundingBox2D() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minX,  double minY,  double maxX,  double maxY)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoundingBox2D() when $default != null:
return $default(_that.minX,_that.minY,_that.maxX,_that.maxY);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minX,  double minY,  double maxX,  double maxY)  $default,) {final _that = this;
switch (_that) {
case _BoundingBox2D():
return $default(_that.minX,_that.minY,_that.maxX,_that.maxY);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minX,  double minY,  double maxX,  double maxY)?  $default,) {final _that = this;
switch (_that) {
case _BoundingBox2D() when $default != null:
return $default(_that.minX,_that.minY,_that.maxX,_that.maxY);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoundingBox2D extends BoundingBox2D {
  const _BoundingBox2D({required this.minX, required this.minY, required this.maxX, required this.maxY}): super._();
  factory _BoundingBox2D.fromJson(Map<String, dynamic> json) => _$BoundingBox2DFromJson(json);

@override final  double minX;
@override final  double minY;
@override final  double maxX;
@override final  double maxY;

/// Create a copy of BoundingBox2D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoundingBox2DCopyWith<_BoundingBox2D> get copyWith => __$BoundingBox2DCopyWithImpl<_BoundingBox2D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoundingBox2DToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoundingBox2D&&(identical(other.minX, minX) || other.minX == minX)&&(identical(other.minY, minY) || other.minY == minY)&&(identical(other.maxX, maxX) || other.maxX == maxX)&&(identical(other.maxY, maxY) || other.maxY == maxY));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minX,minY,maxX,maxY);
}

@override
String toString() {
    return 'BoundingBox2D(minX: $minX, minY: $minY, maxX: $maxX, maxY: $maxY)';
}


}

/// @nodoc
abstract mixin class _$BoundingBox2DCopyWith<$Res> implements $BoundingBox2DCopyWith<$Res> {
  factory _$BoundingBox2DCopyWith(_BoundingBox2D value, $Res Function(_BoundingBox2D) _then) = __$BoundingBox2DCopyWithImpl;
@override @useResult
$Res call({
 double minX, double minY, double maxX, double maxY
});




}
/// @nodoc
class __$BoundingBox2DCopyWithImpl<$Res>
    implements _$BoundingBox2DCopyWith<$Res> {
  __$BoundingBox2DCopyWithImpl(this._self, this._then);

  final _BoundingBox2D _self;
  final $Res Function(_BoundingBox2D) _then;

/// Create a copy of BoundingBox2D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minX = null,Object? minY = null,Object? maxX = null,Object? maxY = null,}) {
  return _then(_BoundingBox2D(
minX: null == minX ? _self.minX : minX // ignore: cast_nullable_to_non_nullable
as double,minY: null == minY ? _self.minY : minY // ignore: cast_nullable_to_non_nullable
as double,maxX: null == maxX ? _self.maxX : maxX // ignore: cast_nullable_to_non_nullable
as double,maxY: null == maxY ? _self.maxY : maxY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ModelMetadata {

 String get buildingId; String get version; DateTime get generatedAt; String get sourceDataHash; CoordinateTransform get coordinateTransform; Map<String, RoomMetadata> get rooms; Map<int, FloorMetadata> get floors; BuildingBounds3D get bounds; Map<String, dynamic> get exportSettings;
/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelMetadataCopyWith<ModelMetadata> get copyWith => _$ModelMetadataCopyWithImpl<ModelMetadata>(this as ModelMetadata, _$identity);

  /// Serializes this ModelMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ModelMetadata;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelMetadata&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt)&&(identical(other.sourceDataHash, _this.sourceDataHash) || other.sourceDataHash == _this.sourceDataHash)&&(identical(other.coordinateTransform, _this.coordinateTransform) || other.coordinateTransform == _this.coordinateTransform)&&const DeepCollectionEquality().equals(other.rooms, _this.rooms)&&const DeepCollectionEquality().equals(other.floors, _this.floors)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds)&&const DeepCollectionEquality().equals(other.exportSettings, _this.exportSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ModelMetadata;
  return Object.hash(runtimeType,_this.buildingId,_this.version,_this.generatedAt,_this.sourceDataHash,_this.coordinateTransform,const DeepCollectionEquality().hash(_this.rooms),const DeepCollectionEquality().hash(_this.floors),_this.bounds,const DeepCollectionEquality().hash(_this.exportSettings));
}

@override
String toString() {
  final _this = this as ModelMetadata;
  return 'ModelMetadata(buildingId: ${_this.buildingId}, version: ${_this.version}, generatedAt: ${_this.generatedAt}, sourceDataHash: ${_this.sourceDataHash}, coordinateTransform: ${_this.coordinateTransform}, rooms: ${_this.rooms}, floors: ${_this.floors}, bounds: ${_this.bounds}, exportSettings: ${_this.exportSettings})';
}


}

/// @nodoc
abstract mixin class $ModelMetadataCopyWith<$Res>  {
  factory $ModelMetadataCopyWith(ModelMetadata value, $Res Function(ModelMetadata) _then) = _$ModelMetadataCopyWithImpl;
@useResult
$Res call({
 String buildingId, String version, DateTime generatedAt, String sourceDataHash, CoordinateTransform coordinateTransform, Map<String, RoomMetadata> rooms, Map<int, FloorMetadata> floors, BuildingBounds3D bounds, Map<String, dynamic> exportSettings
});


$CoordinateTransformCopyWith<$Res> get coordinateTransform;$BuildingBounds3DCopyWith<$Res> get bounds;

}
/// @nodoc
class _$ModelMetadataCopyWithImpl<$Res>
    implements $ModelMetadataCopyWith<$Res> {
  _$ModelMetadataCopyWithImpl(this._self, this._then);

  final ModelMetadata _self;
  final $Res Function(ModelMetadata) _then;

/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buildingId = null,Object? version = null,Object? generatedAt = null,Object? sourceDataHash = null,Object? coordinateTransform = null,Object? rooms = null,Object? floors = null,Object? bounds = null,Object? exportSettings = null,}) {
  return _then(ModelMetadata(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sourceDataHash: null == sourceDataHash ? _self.sourceDataHash : sourceDataHash // ignore: cast_nullable_to_non_nullable
as String,coordinateTransform: null == coordinateTransform ? _self.coordinateTransform : coordinateTransform // ignore: cast_nullable_to_non_nullable
as CoordinateTransform,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as Map<String, RoomMetadata>,floors: null == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as Map<int, FloorMetadata>,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as BuildingBounds3D,exportSettings: null == exportSettings ? _self.exportSettings : exportSettings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinateTransformCopyWith<$Res> get coordinateTransform {
  
  return $CoordinateTransformCopyWith<$Res>(_self.coordinateTransform, (value) {
    return _then(_self.copyWith(coordinateTransform: value));
  });
}/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingBounds3DCopyWith<$Res> get bounds {
  
  return $BuildingBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModelMetadata].
extension ModelMetadataPatterns on ModelMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelMetadata() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ModelMetadata():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ModelMetadata() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String buildingId,  String version,  DateTime generatedAt,  String sourceDataHash,  CoordinateTransform coordinateTransform,  Map<String, RoomMetadata> rooms,  Map<int, FloorMetadata> floors,  BuildingBounds3D bounds,  Map<String, dynamic> exportSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelMetadata() when $default != null:
return $default(_that.buildingId,_that.version,_that.generatedAt,_that.sourceDataHash,_that.coordinateTransform,_that.rooms,_that.floors,_that.bounds,_that.exportSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String buildingId,  String version,  DateTime generatedAt,  String sourceDataHash,  CoordinateTransform coordinateTransform,  Map<String, RoomMetadata> rooms,  Map<int, FloorMetadata> floors,  BuildingBounds3D bounds,  Map<String, dynamic> exportSettings)  $default,) {final _that = this;
switch (_that) {
case _ModelMetadata():
return $default(_that.buildingId,_that.version,_that.generatedAt,_that.sourceDataHash,_that.coordinateTransform,_that.rooms,_that.floors,_that.bounds,_that.exportSettings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String buildingId,  String version,  DateTime generatedAt,  String sourceDataHash,  CoordinateTransform coordinateTransform,  Map<String, RoomMetadata> rooms,  Map<int, FloorMetadata> floors,  BuildingBounds3D bounds,  Map<String, dynamic> exportSettings)?  $default,) {final _that = this;
switch (_that) {
case _ModelMetadata() when $default != null:
return $default(_that.buildingId,_that.version,_that.generatedAt,_that.sourceDataHash,_that.coordinateTransform,_that.rooms,_that.floors,_that.bounds,_that.exportSettings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModelMetadata implements ModelMetadata {
  const _ModelMetadata({required this.buildingId, required this.version, required this.generatedAt, required this.sourceDataHash, required this.coordinateTransform, required  Map<String, RoomMetadata> rooms, required  Map<int, FloorMetadata> floors, required this.bounds, required  Map<String, dynamic> exportSettings}): _rooms = rooms,_floors = floors,_exportSettings = exportSettings;
  factory _ModelMetadata.fromJson(Map<String, dynamic> json) => _$ModelMetadataFromJson(json);

@override final  String buildingId;
@override final  String version;
@override final  DateTime generatedAt;
@override final  String sourceDataHash;
@override final  CoordinateTransform coordinateTransform;
 final  Map<String, RoomMetadata> _rooms;
@override Map<String, RoomMetadata> get rooms {
  if (_rooms is EqualUnmodifiableMapView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rooms);
}

 final  Map<int, FloorMetadata> _floors;
@override Map<int, FloorMetadata> get floors {
  if (_floors is EqualUnmodifiableMapView) return _floors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_floors);
}

@override final  BuildingBounds3D bounds;
 final  Map<String, dynamic> _exportSettings;
@override Map<String, dynamic> get exportSettings {
  if (_exportSettings is EqualUnmodifiableMapView) return _exportSettings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_exportSettings);
}


/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelMetadataCopyWith<_ModelMetadata> get copyWith => __$ModelMetadataCopyWithImpl<_ModelMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModelMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelMetadata&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.version, version) || other.version == version)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.sourceDataHash, sourceDataHash) || other.sourceDataHash == sourceDataHash)&&(identical(other.coordinateTransform, coordinateTransform) || other.coordinateTransform == coordinateTransform)&&const DeepCollectionEquality().equals(other.rooms, _rooms)&&const DeepCollectionEquality().equals(other.floors, _floors)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&const DeepCollectionEquality().equals(other.exportSettings, _exportSettings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,version,generatedAt,sourceDataHash,coordinateTransform,const DeepCollectionEquality().hash(_rooms),const DeepCollectionEquality().hash(_floors),bounds,const DeepCollectionEquality().hash(_exportSettings));
}

@override
String toString() {
    return 'ModelMetadata(buildingId: $buildingId, version: $version, generatedAt: $generatedAt, sourceDataHash: $sourceDataHash, coordinateTransform: $coordinateTransform, rooms: $rooms, floors: $floors, bounds: $bounds, exportSettings: $exportSettings)';
}


}

/// @nodoc
abstract mixin class _$ModelMetadataCopyWith<$Res> implements $ModelMetadataCopyWith<$Res> {
  factory _$ModelMetadataCopyWith(_ModelMetadata value, $Res Function(_ModelMetadata) _then) = __$ModelMetadataCopyWithImpl;
@override @useResult
$Res call({
 String buildingId, String version, DateTime generatedAt, String sourceDataHash, CoordinateTransform coordinateTransform, Map<String, RoomMetadata> rooms, Map<int, FloorMetadata> floors, BuildingBounds3D bounds, Map<String, dynamic> exportSettings
});


@override $CoordinateTransformCopyWith<$Res> get coordinateTransform;@override $BuildingBounds3DCopyWith<$Res> get bounds;

}
/// @nodoc
class __$ModelMetadataCopyWithImpl<$Res>
    implements _$ModelMetadataCopyWith<$Res> {
  __$ModelMetadataCopyWithImpl(this._self, this._then);

  final _ModelMetadata _self;
  final $Res Function(_ModelMetadata) _then;

/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? version = null,Object? generatedAt = null,Object? sourceDataHash = null,Object? coordinateTransform = null,Object? rooms = null,Object? floors = null,Object? bounds = null,Object? exportSettings = null,}) {
  return _then(_ModelMetadata(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sourceDataHash: null == sourceDataHash ? _self.sourceDataHash : sourceDataHash // ignore: cast_nullable_to_non_nullable
as String,coordinateTransform: null == coordinateTransform ? _self.coordinateTransform : coordinateTransform // ignore: cast_nullable_to_non_nullable
as CoordinateTransform,rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as Map<String, RoomMetadata>,floors: null == floors ? _self._floors : floors // ignore: cast_nullable_to_non_nullable
as Map<int, FloorMetadata>,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as BuildingBounds3D,exportSettings: null == exportSettings ? _self._exportSettings : exportSettings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinateTransformCopyWith<$Res> get coordinateTransform {
  
  return $CoordinateTransformCopyWith<$Res>(_self.coordinateTransform, (value) {
    return _then(_self.copyWith(coordinateTransform: value));
  });
}/// Create a copy of ModelMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingBounds3DCopyWith<$Res> get bounds {
  
  return $BuildingBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// @nodoc
mixin _$RoomMetadata {

 String get roomId; String get meshName; int get floorIndex; String get name; String get number; String get category; RoomBounds3D get bounds; Vector3D get centroid; List<Vector3D> get polygon; Map<String, dynamic> get properties;
/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomMetadataCopyWith<RoomMetadata> get copyWith => _$RoomMetadataCopyWithImpl<RoomMetadata>(this as RoomMetadata, _$identity);

  /// Serializes this RoomMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoomMetadata;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomMetadata&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.meshName, _this.meshName) || other.meshName == _this.meshName)&&(identical(other.floorIndex, _this.floorIndex) || other.floorIndex == _this.floorIndex)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds)&&(identical(other.centroid, _this.centroid) || other.centroid == _this.centroid)&&const DeepCollectionEquality().equals(other.polygon, _this.polygon)&&const DeepCollectionEquality().equals(other.properties, _this.properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoomMetadata;
  return Object.hash(runtimeType,_this.roomId,_this.meshName,_this.floorIndex,_this.name,_this.number,_this.category,_this.bounds,_this.centroid,const DeepCollectionEquality().hash(_this.polygon),const DeepCollectionEquality().hash(_this.properties));
}

@override
String toString() {
  final _this = this as RoomMetadata;
  return 'RoomMetadata(roomId: ${_this.roomId}, meshName: ${_this.meshName}, floorIndex: ${_this.floorIndex}, name: ${_this.name}, number: ${_this.number}, category: ${_this.category}, bounds: ${_this.bounds}, centroid: ${_this.centroid}, polygon: ${_this.polygon}, properties: ${_this.properties})';
}


}

/// @nodoc
abstract mixin class $RoomMetadataCopyWith<$Res>  {
  factory $RoomMetadataCopyWith(RoomMetadata value, $Res Function(RoomMetadata) _then) = _$RoomMetadataCopyWithImpl;
@useResult
$Res call({
 String roomId, String meshName, int floorIndex, String name, String number, String category, RoomBounds3D bounds, Vector3D centroid, List<Vector3D> polygon, Map<String, dynamic> properties
});


$RoomBounds3DCopyWith<$Res> get bounds;$Vector3DCopyWith<$Res> get centroid;

}
/// @nodoc
class _$RoomMetadataCopyWithImpl<$Res>
    implements $RoomMetadataCopyWith<$Res> {
  _$RoomMetadataCopyWithImpl(this._self, this._then);

  final RoomMetadata _self;
  final $Res Function(RoomMetadata) _then;

/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? meshName = null,Object? floorIndex = null,Object? name = null,Object? number = null,Object? category = null,Object? bounds = null,Object? centroid = null,Object? polygon = null,Object? properties = null,}) {
  return _then(RoomMetadata(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,meshName: null == meshName ? _self.meshName : meshName // ignore: cast_nullable_to_non_nullable
as String,floorIndex: null == floorIndex ? _self.floorIndex : floorIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as RoomBounds3D,centroid: null == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Vector3D,polygon: null == polygon ? _self.polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<Vector3D>,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomBounds3DCopyWith<$Res> get bounds {
  
  return $RoomBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get centroid {
  
  return $Vector3DCopyWith<$Res>(_self.centroid, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomMetadata].
extension RoomMetadataPatterns on RoomMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomMetadata() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomMetadata value)  $default,){
final _that = this;
switch (_that) {
case _RoomMetadata():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _RoomMetadata() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomId,  String meshName,  int floorIndex,  String name,  String number,  String category,  RoomBounds3D bounds,  Vector3D centroid,  List<Vector3D> polygon,  Map<String, dynamic> properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomMetadata() when $default != null:
return $default(_that.roomId,_that.meshName,_that.floorIndex,_that.name,_that.number,_that.category,_that.bounds,_that.centroid,_that.polygon,_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomId,  String meshName,  int floorIndex,  String name,  String number,  String category,  RoomBounds3D bounds,  Vector3D centroid,  List<Vector3D> polygon,  Map<String, dynamic> properties)  $default,) {final _that = this;
switch (_that) {
case _RoomMetadata():
return $default(_that.roomId,_that.meshName,_that.floorIndex,_that.name,_that.number,_that.category,_that.bounds,_that.centroid,_that.polygon,_that.properties);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomId,  String meshName,  int floorIndex,  String name,  String number,  String category,  RoomBounds3D bounds,  Vector3D centroid,  List<Vector3D> polygon,  Map<String, dynamic> properties)?  $default,) {final _that = this;
switch (_that) {
case _RoomMetadata() when $default != null:
return $default(_that.roomId,_that.meshName,_that.floorIndex,_that.name,_that.number,_that.category,_that.bounds,_that.centroid,_that.polygon,_that.properties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomMetadata implements RoomMetadata {
  const _RoomMetadata({required this.roomId, required this.meshName, required this.floorIndex, required this.name, required this.number, required this.category, required this.bounds, required this.centroid, required  List<Vector3D> polygon, required  Map<String, dynamic> properties}): _polygon = polygon,_properties = properties;
  factory _RoomMetadata.fromJson(Map<String, dynamic> json) => _$RoomMetadataFromJson(json);

@override final  String roomId;
@override final  String meshName;
@override final  int floorIndex;
@override final  String name;
@override final  String number;
@override final  String category;
@override final  RoomBounds3D bounds;
@override final  Vector3D centroid;
 final  List<Vector3D> _polygon;
@override List<Vector3D> get polygon {
  if (_polygon is EqualUnmodifiableListView) return _polygon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_polygon);
}

 final  Map<String, dynamic> _properties;
@override Map<String, dynamic> get properties {
  if (_properties is EqualUnmodifiableMapView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_properties);
}


/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomMetadataCopyWith<_RoomMetadata> get copyWith => __$RoomMetadataCopyWithImpl<_RoomMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomMetadata&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.meshName, meshName) || other.meshName == meshName)&&(identical(other.floorIndex, floorIndex) || other.floorIndex == floorIndex)&&(identical(other.name, name) || other.name == name)&&(identical(other.number, number) || other.number == number)&&(identical(other.category, category) || other.category == category)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.centroid, centroid) || other.centroid == centroid)&&const DeepCollectionEquality().equals(other.polygon, _polygon)&&const DeepCollectionEquality().equals(other.properties, _properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,roomId,meshName,floorIndex,name,number,category,bounds,centroid,const DeepCollectionEquality().hash(_polygon),const DeepCollectionEquality().hash(_properties));
}

@override
String toString() {
    return 'RoomMetadata(roomId: $roomId, meshName: $meshName, floorIndex: $floorIndex, name: $name, number: $number, category: $category, bounds: $bounds, centroid: $centroid, polygon: $polygon, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$RoomMetadataCopyWith<$Res> implements $RoomMetadataCopyWith<$Res> {
  factory _$RoomMetadataCopyWith(_RoomMetadata value, $Res Function(_RoomMetadata) _then) = __$RoomMetadataCopyWithImpl;
@override @useResult
$Res call({
 String roomId, String meshName, int floorIndex, String name, String number, String category, RoomBounds3D bounds, Vector3D centroid, List<Vector3D> polygon, Map<String, dynamic> properties
});


@override $RoomBounds3DCopyWith<$Res> get bounds;@override $Vector3DCopyWith<$Res> get centroid;

}
/// @nodoc
class __$RoomMetadataCopyWithImpl<$Res>
    implements _$RoomMetadataCopyWith<$Res> {
  __$RoomMetadataCopyWithImpl(this._self, this._then);

  final _RoomMetadata _self;
  final $Res Function(_RoomMetadata) _then;

/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? meshName = null,Object? floorIndex = null,Object? name = null,Object? number = null,Object? category = null,Object? bounds = null,Object? centroid = null,Object? polygon = null,Object? properties = null,}) {
  return _then(_RoomMetadata(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,meshName: null == meshName ? _self.meshName : meshName // ignore: cast_nullable_to_non_nullable
as String,floorIndex: null == floorIndex ? _self.floorIndex : floorIndex // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as RoomBounds3D,centroid: null == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Vector3D,polygon: null == polygon ? _self._polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<Vector3D>,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomBounds3DCopyWith<$Res> get bounds {
  
  return $RoomBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}/// Create a copy of RoomMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Vector3DCopyWith<$Res> get centroid {
  
  return $Vector3DCopyWith<$Res>(_self.centroid, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}
}


/// @nodoc
mixin _$FloorMetadata {

 int get index; String get name; double get elevation; double get height; FloorBounds3D get bounds; String get nodeName; int get roomCount;
/// Create a copy of FloorMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorMetadataCopyWith<FloorMetadata> get copyWith => _$FloorMetadataCopyWithImpl<FloorMetadata>(this as FloorMetadata, _$identity);

  /// Serializes this FloorMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FloorMetadata;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FloorMetadata&&(identical(other.index, _this.index) || other.index == _this.index)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.elevation, _this.elevation) || other.elevation == _this.elevation)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.bounds, _this.bounds) || other.bounds == _this.bounds)&&(identical(other.nodeName, _this.nodeName) || other.nodeName == _this.nodeName)&&(identical(other.roomCount, _this.roomCount) || other.roomCount == _this.roomCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FloorMetadata;
  return Object.hash(runtimeType,_this.index,_this.name,_this.elevation,_this.height,_this.bounds,_this.nodeName,_this.roomCount);
}

@override
String toString() {
  final _this = this as FloorMetadata;
  return 'FloorMetadata(index: ${_this.index}, name: ${_this.name}, elevation: ${_this.elevation}, height: ${_this.height}, bounds: ${_this.bounds}, nodeName: ${_this.nodeName}, roomCount: ${_this.roomCount})';
}


}

/// @nodoc
abstract mixin class $FloorMetadataCopyWith<$Res>  {
  factory $FloorMetadataCopyWith(FloorMetadata value, $Res Function(FloorMetadata) _then) = _$FloorMetadataCopyWithImpl;
@useResult
$Res call({
 int index, String name, double elevation, double height, FloorBounds3D bounds, String nodeName, int roomCount
});


$FloorBounds3DCopyWith<$Res> get bounds;

}
/// @nodoc
class _$FloorMetadataCopyWithImpl<$Res>
    implements $FloorMetadataCopyWith<$Res> {
  _$FloorMetadataCopyWithImpl(this._self, this._then);

  final FloorMetadata _self;
  final $Res Function(FloorMetadata) _then;

/// Create a copy of FloorMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? name = null,Object? elevation = null,Object? height = null,Object? bounds = null,Object? nodeName = null,Object? roomCount = null,}) {
  return _then(FloorMetadata(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as FloorBounds3D,nodeName: null == nodeName ? _self.nodeName : nodeName // ignore: cast_nullable_to_non_nullable
as String,roomCount: null == roomCount ? _self.roomCount : roomCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of FloorMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FloorBounds3DCopyWith<$Res> get bounds {
  
  return $FloorBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}


/// Adds pattern-matching-related methods to [FloorMetadata].
extension FloorMetadataPatterns on FloorMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FloorMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FloorMetadata() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FloorMetadata value)  $default,){
final _that = this;
switch (_that) {
case _FloorMetadata():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FloorMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _FloorMetadata() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String name,  double elevation,  double height,  FloorBounds3D bounds,  String nodeName,  int roomCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FloorMetadata() when $default != null:
return $default(_that.index,_that.name,_that.elevation,_that.height,_that.bounds,_that.nodeName,_that.roomCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String name,  double elevation,  double height,  FloorBounds3D bounds,  String nodeName,  int roomCount)  $default,) {final _that = this;
switch (_that) {
case _FloorMetadata():
return $default(_that.index,_that.name,_that.elevation,_that.height,_that.bounds,_that.nodeName,_that.roomCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String name,  double elevation,  double height,  FloorBounds3D bounds,  String nodeName,  int roomCount)?  $default,) {final _that = this;
switch (_that) {
case _FloorMetadata() when $default != null:
return $default(_that.index,_that.name,_that.elevation,_that.height,_that.bounds,_that.nodeName,_that.roomCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FloorMetadata implements FloorMetadata {
  const _FloorMetadata({required this.index, required this.name, required this.elevation, required this.height, required this.bounds, required this.nodeName, required this.roomCount});
  factory _FloorMetadata.fromJson(Map<String, dynamic> json) => _$FloorMetadataFromJson(json);

@override final  int index;
@override final  String name;
@override final  double elevation;
@override final  double height;
@override final  FloorBounds3D bounds;
@override final  String nodeName;
@override final  int roomCount;

/// Create a copy of FloorMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorMetadataCopyWith<_FloorMetadata> get copyWith => __$FloorMetadataCopyWithImpl<_FloorMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FloorMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FloorMetadata&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.height, height) || other.height == height)&&(identical(other.bounds, bounds) || other.bounds == bounds)&&(identical(other.nodeName, nodeName) || other.nodeName == nodeName)&&(identical(other.roomCount, roomCount) || other.roomCount == roomCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,index,name,elevation,height,bounds,nodeName,roomCount);
}

@override
String toString() {
    return 'FloorMetadata(index: $index, name: $name, elevation: $elevation, height: $height, bounds: $bounds, nodeName: $nodeName, roomCount: $roomCount)';
}


}

/// @nodoc
abstract mixin class _$FloorMetadataCopyWith<$Res> implements $FloorMetadataCopyWith<$Res> {
  factory _$FloorMetadataCopyWith(_FloorMetadata value, $Res Function(_FloorMetadata) _then) = __$FloorMetadataCopyWithImpl;
@override @useResult
$Res call({
 int index, String name, double elevation, double height, FloorBounds3D bounds, String nodeName, int roomCount
});


@override $FloorBounds3DCopyWith<$Res> get bounds;

}
/// @nodoc
class __$FloorMetadataCopyWithImpl<$Res>
    implements _$FloorMetadataCopyWith<$Res> {
  __$FloorMetadataCopyWithImpl(this._self, this._then);

  final _FloorMetadata _self;
  final $Res Function(_FloorMetadata) _then;

/// Create a copy of FloorMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? name = null,Object? elevation = null,Object? height = null,Object? bounds = null,Object? nodeName = null,Object? roomCount = null,}) {
  return _then(_FloorMetadata(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,bounds: null == bounds ? _self.bounds : bounds // ignore: cast_nullable_to_non_nullable
as FloorBounds3D,nodeName: null == nodeName ? _self.nodeName : nodeName // ignore: cast_nullable_to_non_nullable
as String,roomCount: null == roomCount ? _self.roomCount : roomCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FloorMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FloorBounds3DCopyWith<$Res> get bounds {
  
  return $FloorBounds3DCopyWith<$Res>(_self.bounds, (value) {
    return _then(_self.copyWith(bounds: value));
  });
}
}

// dart format on
