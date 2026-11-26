// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmergencyType {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyType()';
}


}

/// @nodoc
class $EmergencyTypeCopyWith<$Res>  {
$EmergencyTypeCopyWith(EmergencyType _, $Res Function(EmergencyType) __);
}


/// Adds pattern-matching-related methods to [EmergencyType].
extension EmergencyTypePatterns on EmergencyType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fire value)?  fire,TResult Function( _Medical value)?  medical,TResult Function( _Security value)?  security,TResult Function( _Other value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fire() when fire != null:
return fire(_that);case _Medical() when medical != null:
return medical(_that);case _Security() when security != null:
return security(_that);case _Other() when other != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fire value)  fire,required TResult Function( _Medical value)  medical,required TResult Function( _Security value)  security,required TResult Function( _Other value)  other,}){
final _that = this;
switch (_that) {
case _Fire():
return fire(_that);case _Medical():
return medical(_that);case _Security():
return security(_that);case _Other():
return other(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fire value)?  fire,TResult? Function( _Medical value)?  medical,TResult? Function( _Security value)?  security,TResult? Function( _Other value)?  other,}){
final _that = this;
switch (_that) {
case _Fire() when fire != null:
return fire(_that);case _Medical() when medical != null:
return medical(_that);case _Security() when security != null:
return security(_that);case _Other() when other != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fire,TResult Function()?  medical,TResult Function()?  security,TResult Function()?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fire() when fire != null:
return fire();case _Medical() when medical != null:
return medical();case _Security() when security != null:
return security();case _Other() when other != null:
return other();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fire,required TResult Function()  medical,required TResult Function()  security,required TResult Function()  other,}) {final _that = this;
switch (_that) {
case _Fire():
return fire();case _Medical():
return medical();case _Security():
return security();case _Other():
return other();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fire,TResult? Function()?  medical,TResult? Function()?  security,TResult? Function()?  other,}) {final _that = this;
switch (_that) {
case _Fire() when fire != null:
return fire();case _Medical() when medical != null:
return medical();case _Security() when security != null:
return security();case _Other() when other != null:
return other();case _:
  return null;

}
}

}

/// @nodoc


class _Fire extends EmergencyType {
  const _Fire(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fire);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyType.fire()';
}


}




/// @nodoc


class _Medical extends EmergencyType {
  const _Medical(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Medical);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyType.medical()';
}


}




/// @nodoc


class _Security extends EmergencyType {
  const _Security(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Security);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyType.security()';
}


}




/// @nodoc


class _Other extends EmergencyType {
  const _Other(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Other);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyType.other()';
}


}




/// @nodoc
mixin _$EmergencyStatus {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus()';
}


}

/// @nodoc
class $EmergencyStatusCopyWith<$Res>  {
$EmergencyStatusCopyWith(EmergencyStatus _, $Res Function(EmergencyStatus) __);
}


/// Adds pattern-matching-related methods to [EmergencyStatus].
extension EmergencyStatusPatterns on EmergencyStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Pending value)?  pending,TResult Function( _Connecting value)?  connecting,TResult Function( _Acknowledged value)?  acknowledged,TResult Function( _Dispatched value)?  dispatched,TResult Function( _Arrived value)?  arrived,TResult Function( _Resolved value)?  resolved,TResult Function( _Cancelled value)?  cancelled,TResult Function( _Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pending() when pending != null:
return pending(_that);case _Connecting() when connecting != null:
return connecting(_that);case _Acknowledged() when acknowledged != null:
return acknowledged(_that);case _Dispatched() when dispatched != null:
return dispatched(_that);case _Arrived() when arrived != null:
return arrived(_that);case _Resolved() when resolved != null:
return resolved(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Pending value)  pending,required TResult Function( _Connecting value)  connecting,required TResult Function( _Acknowledged value)  acknowledged,required TResult Function( _Dispatched value)  dispatched,required TResult Function( _Arrived value)  arrived,required TResult Function( _Resolved value)  resolved,required TResult Function( _Cancelled value)  cancelled,required TResult Function( _Failed value)  failed,}){
final _that = this;
switch (_that) {
case _Pending():
return pending(_that);case _Connecting():
return connecting(_that);case _Acknowledged():
return acknowledged(_that);case _Dispatched():
return dispatched(_that);case _Arrived():
return arrived(_that);case _Resolved():
return resolved(_that);case _Cancelled():
return cancelled(_that);case _Failed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Pending value)?  pending,TResult? Function( _Connecting value)?  connecting,TResult? Function( _Acknowledged value)?  acknowledged,TResult? Function( _Dispatched value)?  dispatched,TResult? Function( _Arrived value)?  arrived,TResult? Function( _Resolved value)?  resolved,TResult? Function( _Cancelled value)?  cancelled,TResult? Function( _Failed value)?  failed,}){
final _that = this;
switch (_that) {
case _Pending() when pending != null:
return pending(_that);case _Connecting() when connecting != null:
return connecting(_that);case _Acknowledged() when acknowledged != null:
return acknowledged(_that);case _Dispatched() when dispatched != null:
return dispatched(_that);case _Arrived() when arrived != null:
return arrived(_that);case _Resolved() when resolved != null:
return resolved(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pending,TResult Function()?  connecting,TResult Function()?  acknowledged,TResult Function()?  dispatched,TResult Function()?  arrived,TResult Function()?  resolved,TResult Function()?  cancelled,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pending() when pending != null:
return pending();case _Connecting() when connecting != null:
return connecting();case _Acknowledged() when acknowledged != null:
return acknowledged();case _Dispatched() when dispatched != null:
return dispatched();case _Arrived() when arrived != null:
return arrived();case _Resolved() when resolved != null:
return resolved();case _Cancelled() when cancelled != null:
return cancelled();case _Failed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pending,required TResult Function()  connecting,required TResult Function()  acknowledged,required TResult Function()  dispatched,required TResult Function()  arrived,required TResult Function()  resolved,required TResult Function()  cancelled,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case _Pending():
return pending();case _Connecting():
return connecting();case _Acknowledged():
return acknowledged();case _Dispatched():
return dispatched();case _Arrived():
return arrived();case _Resolved():
return resolved();case _Cancelled():
return cancelled();case _Failed():
return failed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pending,TResult? Function()?  connecting,TResult? Function()?  acknowledged,TResult? Function()?  dispatched,TResult? Function()?  arrived,TResult? Function()?  resolved,TResult? Function()?  cancelled,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case _Pending() when pending != null:
return pending();case _Connecting() when connecting != null:
return connecting();case _Acknowledged() when acknowledged != null:
return acknowledged();case _Dispatched() when dispatched != null:
return dispatched();case _Arrived() when arrived != null:
return arrived();case _Resolved() when resolved != null:
return resolved();case _Cancelled() when cancelled != null:
return cancelled();case _Failed() when failed != null:
return failed();case _:
  return null;

}
}

}

/// @nodoc


class _Pending extends EmergencyStatus {
  const _Pending(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.pending()';
}


}




/// @nodoc


class _Connecting extends EmergencyStatus {
  const _Connecting(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connecting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.connecting()';
}


}




/// @nodoc


class _Acknowledged extends EmergencyStatus {
  const _Acknowledged(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Acknowledged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.acknowledged()';
}


}




/// @nodoc


class _Dispatched extends EmergencyStatus {
  const _Dispatched(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dispatched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.dispatched()';
}


}




/// @nodoc


class _Arrived extends EmergencyStatus {
  const _Arrived(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Arrived);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.arrived()';
}


}




/// @nodoc


class _Resolved extends EmergencyStatus {
  const _Resolved(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resolved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.resolved()';
}


}




/// @nodoc


class _Cancelled extends EmergencyStatus {
  const _Cancelled(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.cancelled()';
}


}




/// @nodoc


class _Failed extends EmergencyStatus {
  const _Failed(): super._();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyStatus.failed()';
}


}





/// @nodoc
mixin _$ResponderInfo {

 String get id; String get name; String get role; String get phone; String? get vehicleId; String? get vehicleType; double? get latitude; double? get longitude; int? get etaMinutes; String? get notes; DateTime get assignedAt; DateTime? get arrivedAt;
/// Create a copy of ResponderInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponderInfoCopyWith<ResponderInfo> get copyWith => _$ResponderInfoCopyWithImpl<ResponderInfo>(this as ResponderInfo, _$identity);

  /// Serializes this ResponderInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResponderInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponderInfo&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.vehicleId, _this.vehicleId) || other.vehicleId == _this.vehicleId)&&(identical(other.vehicleType, _this.vehicleType) || other.vehicleType == _this.vehicleType)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.etaMinutes, _this.etaMinutes) || other.etaMinutes == _this.etaMinutes)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.assignedAt, _this.assignedAt) || other.assignedAt == _this.assignedAt)&&(identical(other.arrivedAt, _this.arrivedAt) || other.arrivedAt == _this.arrivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResponderInfo;
  return Object.hash(runtimeType,_this.id,_this.name,_this.role,_this.phone,_this.vehicleId,_this.vehicleType,_this.latitude,_this.longitude,_this.etaMinutes,_this.notes,_this.assignedAt,_this.arrivedAt);
}

@override
String toString() {
  final _this = this as ResponderInfo;
  return 'ResponderInfo(id: ${_this.id}, name: ${_this.name}, role: ${_this.role}, phone: ${_this.phone}, vehicleId: ${_this.vehicleId}, vehicleType: ${_this.vehicleType}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, etaMinutes: ${_this.etaMinutes}, notes: ${_this.notes}, assignedAt: ${_this.assignedAt}, arrivedAt: ${_this.arrivedAt})';
}


}

/// @nodoc
abstract mixin class $ResponderInfoCopyWith<$Res>  {
  factory $ResponderInfoCopyWith(ResponderInfo value, $Res Function(ResponderInfo) _then) = _$ResponderInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String role, String phone, String? vehicleId, String? vehicleType, double? latitude, double? longitude, int? etaMinutes, String? notes, DateTime assignedAt, DateTime? arrivedAt
});




}
/// @nodoc
class _$ResponderInfoCopyWithImpl<$Res>
    implements $ResponderInfoCopyWith<$Res> {
  _$ResponderInfoCopyWithImpl(this._self, this._then);

  final ResponderInfo _self;
  final $Res Function(ResponderInfo) _then;

/// Create a copy of ResponderInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,Object? phone = null,Object? vehicleId = freezed,Object? vehicleType = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? etaMinutes = freezed,Object? notes = freezed,Object? assignedAt = null,Object? arrivedAt = freezed,}) {
  return _then(ResponderInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,etaMinutes: freezed == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponderInfo].
extension ResponderInfoPatterns on ResponderInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponderInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponderInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponderInfo value)  $default,){
final _that = this;
switch (_that) {
case _ResponderInfo():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponderInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ResponderInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String phone,  String? vehicleId,  String? vehicleType,  double? latitude,  double? longitude,  int? etaMinutes,  String? notes,  DateTime assignedAt,  DateTime? arrivedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponderInfo() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.phone,_that.vehicleId,_that.vehicleType,_that.latitude,_that.longitude,_that.etaMinutes,_that.notes,_that.assignedAt,_that.arrivedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String role,  String phone,  String? vehicleId,  String? vehicleType,  double? latitude,  double? longitude,  int? etaMinutes,  String? notes,  DateTime assignedAt,  DateTime? arrivedAt)  $default,) {final _that = this;
switch (_that) {
case _ResponderInfo():
return $default(_that.id,_that.name,_that.role,_that.phone,_that.vehicleId,_that.vehicleType,_that.latitude,_that.longitude,_that.etaMinutes,_that.notes,_that.assignedAt,_that.arrivedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String role,  String phone,  String? vehicleId,  String? vehicleType,  double? latitude,  double? longitude,  int? etaMinutes,  String? notes,  DateTime assignedAt,  DateTime? arrivedAt)?  $default,) {final _that = this;
switch (_that) {
case _ResponderInfo() when $default != null:
return $default(_that.id,_that.name,_that.role,_that.phone,_that.vehicleId,_that.vehicleType,_that.latitude,_that.longitude,_that.etaMinutes,_that.notes,_that.assignedAt,_that.arrivedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResponderInfo extends ResponderInfo {
  const _ResponderInfo({required this.id, required this.name, required this.role, required this.phone, this.vehicleId, this.vehicleType, this.latitude, this.longitude, this.etaMinutes, this.notes, required this.assignedAt, this.arrivedAt}): super._();
  factory _ResponderInfo.fromJson(Map<String, dynamic> json) => _$ResponderInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String role;
@override final  String phone;
@override final  String? vehicleId;
@override final  String? vehicleType;
@override final  double? latitude;
@override final  double? longitude;
@override final  int? etaMinutes;
@override final  String? notes;
@override final  DateTime assignedAt;
@override final  DateTime? arrivedAt;

/// Create a copy of ResponderInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponderInfoCopyWith<_ResponderInfo> get copyWith => __$ResponderInfoCopyWithImpl<_ResponderInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponderInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponderInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.vehicleId, vehicleId) || other.vehicleId == vehicleId)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,role,phone,vehicleId,vehicleType,latitude,longitude,etaMinutes,notes,assignedAt,arrivedAt);
}

@override
String toString() {
    return 'ResponderInfo(id: $id, name: $name, role: $role, phone: $phone, vehicleId: $vehicleId, vehicleType: $vehicleType, latitude: $latitude, longitude: $longitude, etaMinutes: $etaMinutes, notes: $notes, assignedAt: $assignedAt, arrivedAt: $arrivedAt)';
}


}

/// @nodoc
abstract mixin class _$ResponderInfoCopyWith<$Res> implements $ResponderInfoCopyWith<$Res> {
  factory _$ResponderInfoCopyWith(_ResponderInfo value, $Res Function(_ResponderInfo) _then) = __$ResponderInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String role, String phone, String? vehicleId, String? vehicleType, double? latitude, double? longitude, int? etaMinutes, String? notes, DateTime assignedAt, DateTime? arrivedAt
});




}
/// @nodoc
class __$ResponderInfoCopyWithImpl<$Res>
    implements _$ResponderInfoCopyWith<$Res> {
  __$ResponderInfoCopyWithImpl(this._self, this._then);

  final _ResponderInfo _self;
  final $Res Function(_ResponderInfo) _then;

/// Create a copy of ResponderInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,Object? phone = null,Object? vehicleId = freezed,Object? vehicleType = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? etaMinutes = freezed,Object? notes = freezed,Object? assignedAt = null,Object? arrivedAt = freezed,}) {
  return _then(_ResponderInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,vehicleId: freezed == vehicleId ? _self.vehicleId : vehicleId // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,etaMinutes: freezed == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,assignedAt: null == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$EmergencyLocation {

 double get latitude; double get longitude; double? get altitude; double? get accuracy; double? get heading; double? get speed; String? get address; String? get buildingId; String? get floorId; String? get roomId; bool get isIndoor; DateTime get timestamp;
/// Create a copy of EmergencyLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyLocationCopyWith<EmergencyLocation> get copyWith => _$EmergencyLocationCopyWithImpl<EmergencyLocation>(this as EmergencyLocation, _$identity);

  /// Serializes this EmergencyLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmergencyLocation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyLocation&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.altitude, _this.altitude) || other.altitude == _this.altitude)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.heading, _this.heading) || other.heading == _this.heading)&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.isIndoor, _this.isIndoor) || other.isIndoor == _this.isIndoor)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmergencyLocation;
  return Object.hash(runtimeType,_this.latitude,_this.longitude,_this.altitude,_this.accuracy,_this.heading,_this.speed,_this.address,_this.buildingId,_this.floorId,_this.roomId,_this.isIndoor,_this.timestamp);
}

@override
String toString() {
  final _this = this as EmergencyLocation;
  return 'EmergencyLocation(latitude: ${_this.latitude}, longitude: ${_this.longitude}, altitude: ${_this.altitude}, accuracy: ${_this.accuracy}, heading: ${_this.heading}, speed: ${_this.speed}, address: ${_this.address}, buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, roomId: ${_this.roomId}, isIndoor: ${_this.isIndoor}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $EmergencyLocationCopyWith<$Res>  {
  factory $EmergencyLocationCopyWith(EmergencyLocation value, $Res Function(EmergencyLocation) _then) = _$EmergencyLocationCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, double? altitude, double? accuracy, double? heading, double? speed, String? address, String? buildingId, String? floorId, String? roomId, bool isIndoor, DateTime timestamp
});




}
/// @nodoc
class _$EmergencyLocationCopyWithImpl<$Res>
    implements $EmergencyLocationCopyWith<$Res> {
  _$EmergencyLocationCopyWithImpl(this._self, this._then);

  final EmergencyLocation _self;
  final $Res Function(EmergencyLocation) _then;

/// Create a copy of EmergencyLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? altitude = freezed,Object? accuracy = freezed,Object? heading = freezed,Object? speed = freezed,Object? address = freezed,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? isIndoor = null,Object? timestamp = null,}) {
  return _then(EmergencyLocation(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,isIndoor: null == isIndoor ? _self.isIndoor : isIndoor // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [EmergencyLocation].
extension EmergencyLocationPatterns on EmergencyLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyLocation value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyLocation():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyLocation value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? altitude,  double? accuracy,  double? heading,  double? speed,  String? address,  String? buildingId,  String? floorId,  String? roomId,  bool isIndoor,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyLocation() when $default != null:
return $default(_that.latitude,_that.longitude,_that.altitude,_that.accuracy,_that.heading,_that.speed,_that.address,_that.buildingId,_that.floorId,_that.roomId,_that.isIndoor,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? altitude,  double? accuracy,  double? heading,  double? speed,  String? address,  String? buildingId,  String? floorId,  String? roomId,  bool isIndoor,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _EmergencyLocation():
return $default(_that.latitude,_that.longitude,_that.altitude,_that.accuracy,_that.heading,_that.speed,_that.address,_that.buildingId,_that.floorId,_that.roomId,_that.isIndoor,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  double? altitude,  double? accuracy,  double? heading,  double? speed,  String? address,  String? buildingId,  String? floorId,  String? roomId,  bool isIndoor,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyLocation() when $default != null:
return $default(_that.latitude,_that.longitude,_that.altitude,_that.accuracy,_that.heading,_that.speed,_that.address,_that.buildingId,_that.floorId,_that.roomId,_that.isIndoor,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyLocation extends EmergencyLocation {
  const _EmergencyLocation({required this.latitude, required this.longitude, this.altitude, this.accuracy, this.heading, this.speed, this.address, this.buildingId, this.floorId, this.roomId, this.isIndoor = false, required this.timestamp}): super._();
  factory _EmergencyLocation.fromJson(Map<String, dynamic> json) => _$EmergencyLocationFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  double? altitude;
@override final  double? accuracy;
@override final  double? heading;
@override final  double? speed;
@override final  String? address;
@override final  String? buildingId;
@override final  String? floorId;
@override final  String? roomId;
@override@JsonKey() final  bool isIndoor;
@override final  DateTime timestamp;

/// Create a copy of EmergencyLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyLocationCopyWith<_EmergencyLocation> get copyWith => __$EmergencyLocationCopyWithImpl<_EmergencyLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyLocationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyLocation&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.address, address) || other.address == address)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.isIndoor, isIndoor) || other.isIndoor == isIndoor)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,latitude,longitude,altitude,accuracy,heading,speed,address,buildingId,floorId,roomId,isIndoor,timestamp);
}

@override
String toString() {
    return 'EmergencyLocation(latitude: $latitude, longitude: $longitude, altitude: $altitude, accuracy: $accuracy, heading: $heading, speed: $speed, address: $address, buildingId: $buildingId, floorId: $floorId, roomId: $roomId, isIndoor: $isIndoor, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$EmergencyLocationCopyWith<$Res> implements $EmergencyLocationCopyWith<$Res> {
  factory _$EmergencyLocationCopyWith(_EmergencyLocation value, $Res Function(_EmergencyLocation) _then) = __$EmergencyLocationCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, double? altitude, double? accuracy, double? heading, double? speed, String? address, String? buildingId, String? floorId, String? roomId, bool isIndoor, DateTime timestamp
});




}
/// @nodoc
class __$EmergencyLocationCopyWithImpl<$Res>
    implements _$EmergencyLocationCopyWith<$Res> {
  __$EmergencyLocationCopyWithImpl(this._self, this._then);

  final _EmergencyLocation _self;
  final $Res Function(_EmergencyLocation) _then;

/// Create a copy of EmergencyLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? altitude = freezed,Object? accuracy = freezed,Object? heading = freezed,Object? speed = freezed,Object? address = freezed,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? isIndoor = null,Object? timestamp = null,}) {
  return _then(_EmergencyLocation(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,isIndoor: null == isIndoor ? _self.isIndoor : isIndoor // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$EmergencyReport {

 String get id; String get userId; String get userName; String get userPhone; EmergencyLocation get userLocation;@emergencyTypeConverter EmergencyType get type;@emergencyStatusConverter EmergencyStatus get status; String? get description; ResponderInfo? get responder; List<String>? get notes; DateTime get createdAt; DateTime get updatedAt; DateTime? get acknowledgedAt; DateTime? get dispatchedAt; DateTime? get arrivedAt; DateTime? get resolvedAt; DateTime? get cancelledAt; Map<String, dynamic>? get metadata;
/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyReportCopyWith<EmergencyReport> get copyWith => _$EmergencyReportCopyWithImpl<EmergencyReport>(this as EmergencyReport, _$identity);

  /// Serializes this EmergencyReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmergencyReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyReport&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.userName, _this.userName) || other.userName == _this.userName)&&(identical(other.userPhone, _this.userPhone) || other.userPhone == _this.userPhone)&&(identical(other.userLocation, _this.userLocation) || other.userLocation == _this.userLocation)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.responder, _this.responder) || other.responder == _this.responder)&&const DeepCollectionEquality().equals(other.notes, _this.notes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.acknowledgedAt, _this.acknowledgedAt) || other.acknowledgedAt == _this.acknowledgedAt)&&(identical(other.dispatchedAt, _this.dispatchedAt) || other.dispatchedAt == _this.dispatchedAt)&&(identical(other.arrivedAt, _this.arrivedAt) || other.arrivedAt == _this.arrivedAt)&&(identical(other.resolvedAt, _this.resolvedAt) || other.resolvedAt == _this.resolvedAt)&&(identical(other.cancelledAt, _this.cancelledAt) || other.cancelledAt == _this.cancelledAt)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmergencyReport;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.userName,_this.userPhone,_this.userLocation,_this.type,_this.status,_this.description,_this.responder,const DeepCollectionEquality().hash(_this.notes),_this.createdAt,_this.updatedAt,_this.acknowledgedAt,_this.dispatchedAt,_this.arrivedAt,_this.resolvedAt,_this.cancelledAt,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as EmergencyReport;
  return 'EmergencyReport(id: ${_this.id}, userId: ${_this.userId}, userName: ${_this.userName}, userPhone: ${_this.userPhone}, userLocation: ${_this.userLocation}, type: ${_this.type}, status: ${_this.status}, description: ${_this.description}, responder: ${_this.responder}, notes: ${_this.notes}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, acknowledgedAt: ${_this.acknowledgedAt}, dispatchedAt: ${_this.dispatchedAt}, arrivedAt: ${_this.arrivedAt}, resolvedAt: ${_this.resolvedAt}, cancelledAt: ${_this.cancelledAt}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $EmergencyReportCopyWith<$Res>  {
  factory $EmergencyReportCopyWith(EmergencyReport value, $Res Function(EmergencyReport) _then) = _$EmergencyReportCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String userName, String userPhone, EmergencyLocation userLocation,@emergencyTypeConverter EmergencyType type,@emergencyStatusConverter EmergencyStatus status, String? description, ResponderInfo? responder, List<String>? notes, DateTime createdAt, DateTime updatedAt, DateTime? acknowledgedAt, DateTime? dispatchedAt, DateTime? arrivedAt, DateTime? resolvedAt, DateTime? cancelledAt, Map<String, dynamic>? metadata
});


$EmergencyLocationCopyWith<$Res> get userLocation;$EmergencyTypeCopyWith<$Res> get type;$EmergencyStatusCopyWith<$Res> get status;$ResponderInfoCopyWith<$Res>? get responder;

}
/// @nodoc
class _$EmergencyReportCopyWithImpl<$Res>
    implements $EmergencyReportCopyWith<$Res> {
  _$EmergencyReportCopyWithImpl(this._self, this._then);

  final EmergencyReport _self;
  final $Res Function(EmergencyReport) _then;

/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? userPhone = null,Object? userLocation = null,Object? type = null,Object? status = null,Object? description = freezed,Object? responder = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? acknowledgedAt = freezed,Object? dispatchedAt = freezed,Object? arrivedAt = freezed,Object? resolvedAt = freezed,Object? cancelledAt = freezed,Object? metadata = freezed,}) {
  return _then(EmergencyReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userPhone: null == userPhone ? _self.userPhone : userPhone // ignore: cast_nullable_to_non_nullable
as String,userLocation: null == userLocation ? _self.userLocation : userLocation // ignore: cast_nullable_to_non_nullable
as EmergencyLocation,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EmergencyType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EmergencyStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,responder: freezed == responder ? _self.responder : responder // ignore: cast_nullable_to_non_nullable
as ResponderInfo?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,acknowledgedAt: freezed == acknowledgedAt ? _self.acknowledgedAt : acknowledgedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dispatchedAt: freezed == dispatchedAt ? _self.dispatchedAt : dispatchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyLocationCopyWith<$Res> get userLocation {
  
  return $EmergencyLocationCopyWith<$Res>(_self.userLocation, (value) {
    return _then(_self.copyWith(userLocation: value));
  });
}/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyTypeCopyWith<$Res> get type {
  
  return $EmergencyTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyStatusCopyWith<$Res> get status {
  
  return $EmergencyStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponderInfoCopyWith<$Res>? get responder {
    if (_self.responder == null) {
    return null;
  }

  return $ResponderInfoCopyWith<$Res>(_self.responder!, (value) {
    return _then(_self.copyWith(responder: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmergencyReport].
extension EmergencyReportPatterns on EmergencyReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyReport value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyReport():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyReport value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String userPhone,  EmergencyLocation userLocation, @emergencyTypeConverter  EmergencyType type, @emergencyStatusConverter  EmergencyStatus status,  String? description,  ResponderInfo? responder,  List<String>? notes,  DateTime createdAt,  DateTime updatedAt,  DateTime? acknowledgedAt,  DateTime? dispatchedAt,  DateTime? arrivedAt,  DateTime? resolvedAt,  DateTime? cancelledAt,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyReport() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.userPhone,_that.userLocation,_that.type,_that.status,_that.description,_that.responder,_that.notes,_that.createdAt,_that.updatedAt,_that.acknowledgedAt,_that.dispatchedAt,_that.arrivedAt,_that.resolvedAt,_that.cancelledAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String userName,  String userPhone,  EmergencyLocation userLocation, @emergencyTypeConverter  EmergencyType type, @emergencyStatusConverter  EmergencyStatus status,  String? description,  ResponderInfo? responder,  List<String>? notes,  DateTime createdAt,  DateTime updatedAt,  DateTime? acknowledgedAt,  DateTime? dispatchedAt,  DateTime? arrivedAt,  DateTime? resolvedAt,  DateTime? cancelledAt,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _EmergencyReport():
return $default(_that.id,_that.userId,_that.userName,_that.userPhone,_that.userLocation,_that.type,_that.status,_that.description,_that.responder,_that.notes,_that.createdAt,_that.updatedAt,_that.acknowledgedAt,_that.dispatchedAt,_that.arrivedAt,_that.resolvedAt,_that.cancelledAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String userName,  String userPhone,  EmergencyLocation userLocation, @emergencyTypeConverter  EmergencyType type, @emergencyStatusConverter  EmergencyStatus status,  String? description,  ResponderInfo? responder,  List<String>? notes,  DateTime createdAt,  DateTime updatedAt,  DateTime? acknowledgedAt,  DateTime? dispatchedAt,  DateTime? arrivedAt,  DateTime? resolvedAt,  DateTime? cancelledAt,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyReport() when $default != null:
return $default(_that.id,_that.userId,_that.userName,_that.userPhone,_that.userLocation,_that.type,_that.status,_that.description,_that.responder,_that.notes,_that.createdAt,_that.updatedAt,_that.acknowledgedAt,_that.dispatchedAt,_that.arrivedAt,_that.resolvedAt,_that.cancelledAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyReport extends EmergencyReport {
  const _EmergencyReport({required this.id, required this.userId, required this.userName, required this.userPhone, required this.userLocation, @emergencyTypeConverter required this.type, @emergencyStatusConverter required this.status, this.description, this.responder,  List<String>? notes, required this.createdAt, required this.updatedAt, this.acknowledgedAt, this.dispatchedAt, this.arrivedAt, this.resolvedAt, this.cancelledAt,  Map<String, dynamic>? metadata}): _notes = notes,_metadata = metadata,super._();
  factory _EmergencyReport.fromJson(Map<String, dynamic> json) => _$EmergencyReportFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String userName;
@override final  String userPhone;
@override final  EmergencyLocation userLocation;
@override@emergencyTypeConverter final  EmergencyType type;
@override@emergencyStatusConverter final  EmergencyStatus status;
@override final  String? description;
@override final  ResponderInfo? responder;
 final  List<String>? _notes;
@override List<String>? get notes {
  final value = _notes;
  if (value == null) return null;
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? acknowledgedAt;
@override final  DateTime? dispatchedAt;
@override final  DateTime? arrivedAt;
@override final  DateTime? resolvedAt;
@override final  DateTime? cancelledAt;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyReportCopyWith<_EmergencyReport> get copyWith => __$EmergencyReportCopyWithImpl<_EmergencyReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyReportToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyReport&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPhone, userPhone) || other.userPhone == userPhone)&&(identical(other.userLocation, userLocation) || other.userLocation == userLocation)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.responder, responder) || other.responder == responder)&&const DeepCollectionEquality().equals(other.notes, _notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.acknowledgedAt, acknowledgedAt) || other.acknowledgedAt == acknowledgedAt)&&(identical(other.dispatchedAt, dispatchedAt) || other.dispatchedAt == dispatchedAt)&&(identical(other.arrivedAt, arrivedAt) || other.arrivedAt == arrivedAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,userName,userPhone,userLocation,type,status,description,responder,const DeepCollectionEquality().hash(_notes),createdAt,updatedAt,acknowledgedAt,dispatchedAt,arrivedAt,resolvedAt,cancelledAt,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'EmergencyReport(id: $id, userId: $userId, userName: $userName, userPhone: $userPhone, userLocation: $userLocation, type: $type, status: $status, description: $description, responder: $responder, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, acknowledgedAt: $acknowledgedAt, dispatchedAt: $dispatchedAt, arrivedAt: $arrivedAt, resolvedAt: $resolvedAt, cancelledAt: $cancelledAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$EmergencyReportCopyWith<$Res> implements $EmergencyReportCopyWith<$Res> {
  factory _$EmergencyReportCopyWith(_EmergencyReport value, $Res Function(_EmergencyReport) _then) = __$EmergencyReportCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String userName, String userPhone, EmergencyLocation userLocation,@emergencyTypeConverter EmergencyType type,@emergencyStatusConverter EmergencyStatus status, String? description, ResponderInfo? responder, List<String>? notes, DateTime createdAt, DateTime updatedAt, DateTime? acknowledgedAt, DateTime? dispatchedAt, DateTime? arrivedAt, DateTime? resolvedAt, DateTime? cancelledAt, Map<String, dynamic>? metadata
});


@override $EmergencyLocationCopyWith<$Res> get userLocation;@override $EmergencyTypeCopyWith<$Res> get type;@override $EmergencyStatusCopyWith<$Res> get status;@override $ResponderInfoCopyWith<$Res>? get responder;

}
/// @nodoc
class __$EmergencyReportCopyWithImpl<$Res>
    implements _$EmergencyReportCopyWith<$Res> {
  __$EmergencyReportCopyWithImpl(this._self, this._then);

  final _EmergencyReport _self;
  final $Res Function(_EmergencyReport) _then;

/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userName = null,Object? userPhone = null,Object? userLocation = null,Object? type = null,Object? status = null,Object? description = freezed,Object? responder = freezed,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,Object? acknowledgedAt = freezed,Object? dispatchedAt = freezed,Object? arrivedAt = freezed,Object? resolvedAt = freezed,Object? cancelledAt = freezed,Object? metadata = freezed,}) {
  return _then(_EmergencyReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userPhone: null == userPhone ? _self.userPhone : userPhone // ignore: cast_nullable_to_non_nullable
as String,userLocation: null == userLocation ? _self.userLocation : userLocation // ignore: cast_nullable_to_non_nullable
as EmergencyLocation,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EmergencyType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EmergencyStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,responder: freezed == responder ? _self.responder : responder // ignore: cast_nullable_to_non_nullable
as ResponderInfo?,notes: freezed == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,acknowledgedAt: freezed == acknowledgedAt ? _self.acknowledgedAt : acknowledgedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dispatchedAt: freezed == dispatchedAt ? _self.dispatchedAt : dispatchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivedAt: freezed == arrivedAt ? _self.arrivedAt : arrivedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyLocationCopyWith<$Res> get userLocation {
  
  return $EmergencyLocationCopyWith<$Res>(_self.userLocation, (value) {
    return _then(_self.copyWith(userLocation: value));
  });
}/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyTypeCopyWith<$Res> get type {
  
  return $EmergencyTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyStatusCopyWith<$Res> get status {
  
  return $EmergencyStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of EmergencyReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponderInfoCopyWith<$Res>? get responder {
    if (_self.responder == null) {
    return null;
  }

  return $ResponderInfoCopyWith<$Res>(_self.responder!, (value) {
    return _then(_self.copyWith(responder: value));
  });
}
}


/// @nodoc
mixin _$CampusEmergencyContact {

 String get id; String get name; String get phone; String get role; String get department; String? get location; String? get hours; int get priority; bool get isActive; bool get isCampusSecurity; List<String>? get services; Map<String, dynamic>? get metadata; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of CampusEmergencyContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampusEmergencyContactCopyWith<CampusEmergencyContact> get copyWith => _$CampusEmergencyContactCopyWithImpl<CampusEmergencyContact>(this as CampusEmergencyContact, _$identity);

  /// Serializes this CampusEmergencyContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CampusEmergencyContact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampusEmergencyContact&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.department, _this.department) || other.department == _this.department)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.hours, _this.hours) || other.hours == _this.hours)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.isCampusSecurity, _this.isCampusSecurity) || other.isCampusSecurity == _this.isCampusSecurity)&&const DeepCollectionEquality().equals(other.services, _this.services)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CampusEmergencyContact;
  return Object.hash(runtimeType,_this.id,_this.name,_this.phone,_this.role,_this.department,_this.location,_this.hours,_this.priority,_this.isActive,_this.isCampusSecurity,const DeepCollectionEquality().hash(_this.services),const DeepCollectionEquality().hash(_this.metadata),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as CampusEmergencyContact;
  return 'CampusEmergencyContact(id: ${_this.id}, name: ${_this.name}, phone: ${_this.phone}, role: ${_this.role}, department: ${_this.department}, location: ${_this.location}, hours: ${_this.hours}, priority: ${_this.priority}, isActive: ${_this.isActive}, isCampusSecurity: ${_this.isCampusSecurity}, services: ${_this.services}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $CampusEmergencyContactCopyWith<$Res>  {
  factory $CampusEmergencyContactCopyWith(CampusEmergencyContact value, $Res Function(CampusEmergencyContact) _then) = _$CampusEmergencyContactCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone, String role, String department, String? location, String? hours, int priority, bool isActive, bool isCampusSecurity, List<String>? services, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$CampusEmergencyContactCopyWithImpl<$Res>
    implements $CampusEmergencyContactCopyWith<$Res> {
  _$CampusEmergencyContactCopyWithImpl(this._self, this._then);

  final CampusEmergencyContact _self;
  final $Res Function(CampusEmergencyContact) _then;

/// Create a copy of CampusEmergencyContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? role = null,Object? department = null,Object? location = freezed,Object? hours = freezed,Object? priority = null,Object? isActive = null,Object? isCampusSecurity = null,Object? services = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(CampusEmergencyContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,hours: freezed == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isCampusSecurity: null == isCampusSecurity ? _self.isCampusSecurity : isCampusSecurity // ignore: cast_nullable_to_non_nullable
as bool,services: freezed == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CampusEmergencyContact].
extension CampusEmergencyContactPatterns on CampusEmergencyContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampusEmergencyContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampusEmergencyContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampusEmergencyContact value)  $default,){
final _that = this;
switch (_that) {
case _CampusEmergencyContact():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampusEmergencyContact value)?  $default,){
final _that = this;
switch (_that) {
case _CampusEmergencyContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String role,  String department,  String? location,  String? hours,  int priority,  bool isActive,  bool isCampusSecurity,  List<String>? services,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampusEmergencyContact() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.role,_that.department,_that.location,_that.hours,_that.priority,_that.isActive,_that.isCampusSecurity,_that.services,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String role,  String department,  String? location,  String? hours,  int priority,  bool isActive,  bool isCampusSecurity,  List<String>? services,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CampusEmergencyContact():
return $default(_that.id,_that.name,_that.phone,_that.role,_that.department,_that.location,_that.hours,_that.priority,_that.isActive,_that.isCampusSecurity,_that.services,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone,  String role,  String department,  String? location,  String? hours,  int priority,  bool isActive,  bool isCampusSecurity,  List<String>? services,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CampusEmergencyContact() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.role,_that.department,_that.location,_that.hours,_that.priority,_that.isActive,_that.isCampusSecurity,_that.services,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampusEmergencyContact implements CampusEmergencyContact {
  const _CampusEmergencyContact({required this.id, required this.name, required this.phone, required this.role, required this.department, this.location, this.hours, this.priority = 0, this.isActive = true, this.isCampusSecurity = true,  List<String>? services,  Map<String, dynamic>? metadata, required this.createdAt, required this.updatedAt}): _services = services,_metadata = metadata;
  factory _CampusEmergencyContact.fromJson(Map<String, dynamic> json) => _$CampusEmergencyContactFromJson(json);

@override final  String id;
@override final  String name;
@override final  String phone;
@override final  String role;
@override final  String department;
@override final  String? location;
@override final  String? hours;
@override@JsonKey() final  int priority;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  bool isCampusSecurity;
 final  List<String>? _services;
@override List<String>? get services {
  final value = _services;
  if (value == null) return null;
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of CampusEmergencyContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampusEmergencyContactCopyWith<_CampusEmergencyContact> get copyWith => __$CampusEmergencyContactCopyWithImpl<_CampusEmergencyContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampusEmergencyContactToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampusEmergencyContact&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.department, department) || other.department == department)&&(identical(other.location, location) || other.location == location)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isCampusSecurity, isCampusSecurity) || other.isCampusSecurity == isCampusSecurity)&&const DeepCollectionEquality().equals(other.services, _services)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,phone,role,department,location,hours,priority,isActive,isCampusSecurity,const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_metadata),createdAt,updatedAt);
}

@override
String toString() {
    return 'CampusEmergencyContact(id: $id, name: $name, phone: $phone, role: $role, department: $department, location: $location, hours: $hours, priority: $priority, isActive: $isActive, isCampusSecurity: $isCampusSecurity, services: $services, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CampusEmergencyContactCopyWith<$Res> implements $CampusEmergencyContactCopyWith<$Res> {
  factory _$CampusEmergencyContactCopyWith(_CampusEmergencyContact value, $Res Function(_CampusEmergencyContact) _then) = __$CampusEmergencyContactCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone, String role, String department, String? location, String? hours, int priority, bool isActive, bool isCampusSecurity, List<String>? services, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$CampusEmergencyContactCopyWithImpl<$Res>
    implements _$CampusEmergencyContactCopyWith<$Res> {
  __$CampusEmergencyContactCopyWithImpl(this._self, this._then);

  final _CampusEmergencyContact _self;
  final $Res Function(_CampusEmergencyContact) _then;

/// Create a copy of CampusEmergencyContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? role = null,Object? department = null,Object? location = freezed,Object? hours = freezed,Object? priority = null,Object? isActive = null,Object? isCampusSecurity = null,Object? services = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CampusEmergencyContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,hours: freezed == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isCampusSecurity: null == isCampusSecurity ? _self.isCampusSecurity : isCampusSecurity // ignore: cast_nullable_to_non_nullable
as bool,services: freezed == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AssemblyPoint {

 String get id; String get name; double get latitude; double get longitude; String? get buildingId; int? get capacity; int get currentOccupancy; String? get description; List<String>? get accessibilityFeatures; bool get isActive; Map<String, dynamic>? get metadata; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of AssemblyPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssemblyPointCopyWith<AssemblyPoint> get copyWith => _$AssemblyPointCopyWithImpl<AssemblyPoint>(this as AssemblyPoint, _$identity);

  /// Serializes this AssemblyPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AssemblyPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssemblyPoint&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.currentOccupancy, _this.currentOccupancy) || other.currentOccupancy == _this.currentOccupancy)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.accessibilityFeatures, _this.accessibilityFeatures)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AssemblyPoint;
  return Object.hash(runtimeType,_this.id,_this.name,_this.latitude,_this.longitude,_this.buildingId,_this.capacity,_this.currentOccupancy,_this.description,const DeepCollectionEquality().hash(_this.accessibilityFeatures),_this.isActive,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as AssemblyPoint;
  return 'AssemblyPoint(id: ${_this.id}, name: ${_this.name}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, buildingId: ${_this.buildingId}, capacity: ${_this.capacity}, currentOccupancy: ${_this.currentOccupancy}, description: ${_this.description}, accessibilityFeatures: ${_this.accessibilityFeatures}, isActive: ${_this.isActive}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $AssemblyPointCopyWith<$Res>  {
  factory $AssemblyPointCopyWith(AssemblyPoint value, $Res Function(AssemblyPoint) _then) = _$AssemblyPointCopyWithImpl;
@useResult
$Res call({
 String id, String name, double latitude, double longitude, String? buildingId, int? capacity, int currentOccupancy, String? description, List<String>? accessibilityFeatures, bool isActive, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$AssemblyPointCopyWithImpl<$Res>
    implements $AssemblyPointCopyWith<$Res> {
  _$AssemblyPointCopyWithImpl(this._self, this._then);

  final AssemblyPoint _self;
  final $Res Function(AssemblyPoint) _then;

/// Create a copy of AssemblyPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? buildingId = freezed,Object? capacity = freezed,Object? currentOccupancy = null,Object? description = freezed,Object? accessibilityFeatures = freezed,Object? isActive = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(AssemblyPoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupancy: null == currentOccupancy ? _self.currentOccupancy : currentOccupancy // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,accessibilityFeatures: freezed == accessibilityFeatures ? _self.accessibilityFeatures : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
as List<String>?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AssemblyPoint].
extension AssemblyPointPatterns on AssemblyPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssemblyPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssemblyPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssemblyPoint value)  $default,){
final _that = this;
switch (_that) {
case _AssemblyPoint():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssemblyPoint value)?  $default,){
final _that = this;
switch (_that) {
case _AssemblyPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double latitude,  double longitude,  String? buildingId,  int? capacity,  int currentOccupancy,  String? description,  List<String>? accessibilityFeatures,  bool isActive,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssemblyPoint() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.buildingId,_that.capacity,_that.currentOccupancy,_that.description,_that.accessibilityFeatures,_that.isActive,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double latitude,  double longitude,  String? buildingId,  int? capacity,  int currentOccupancy,  String? description,  List<String>? accessibilityFeatures,  bool isActive,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AssemblyPoint():
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.buildingId,_that.capacity,_that.currentOccupancy,_that.description,_that.accessibilityFeatures,_that.isActive,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double latitude,  double longitude,  String? buildingId,  int? capacity,  int currentOccupancy,  String? description,  List<String>? accessibilityFeatures,  bool isActive,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AssemblyPoint() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.buildingId,_that.capacity,_that.currentOccupancy,_that.description,_that.accessibilityFeatures,_that.isActive,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssemblyPoint extends AssemblyPoint {
  const _AssemblyPoint({required this.id, required this.name, required this.latitude, required this.longitude, this.buildingId, this.capacity, this.currentOccupancy = 0, this.description,  List<String>? accessibilityFeatures, this.isActive = true,  Map<String, dynamic>? metadata, required this.createdAt, required this.updatedAt}): _accessibilityFeatures = accessibilityFeatures,_metadata = metadata,super._();
  factory _AssemblyPoint.fromJson(Map<String, dynamic> json) => _$AssemblyPointFromJson(json);

@override final  String id;
@override final  String name;
@override final  double latitude;
@override final  double longitude;
@override final  String? buildingId;
@override final  int? capacity;
@override@JsonKey() final  int currentOccupancy;
@override final  String? description;
 final  List<String>? _accessibilityFeatures;
@override List<String>? get accessibilityFeatures {
  final value = _accessibilityFeatures;
  if (value == null) return null;
  if (_accessibilityFeatures is EqualUnmodifiableListView) return _accessibilityFeatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool isActive;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of AssemblyPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssemblyPointCopyWith<_AssemblyPoint> get copyWith => __$AssemblyPointCopyWithImpl<_AssemblyPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssemblyPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssemblyPoint&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.currentOccupancy, currentOccupancy) || other.currentOccupancy == currentOccupancy)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.accessibilityFeatures, _accessibilityFeatures)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,latitude,longitude,buildingId,capacity,currentOccupancy,description,const DeepCollectionEquality().hash(_accessibilityFeatures),isActive,const DeepCollectionEquality().hash(_metadata),createdAt,updatedAt);
}

@override
String toString() {
    return 'AssemblyPoint(id: $id, name: $name, latitude: $latitude, longitude: $longitude, buildingId: $buildingId, capacity: $capacity, currentOccupancy: $currentOccupancy, description: $description, accessibilityFeatures: $accessibilityFeatures, isActive: $isActive, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AssemblyPointCopyWith<$Res> implements $AssemblyPointCopyWith<$Res> {
  factory _$AssemblyPointCopyWith(_AssemblyPoint value, $Res Function(_AssemblyPoint) _then) = __$AssemblyPointCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double latitude, double longitude, String? buildingId, int? capacity, int currentOccupancy, String? description, List<String>? accessibilityFeatures, bool isActive, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$AssemblyPointCopyWithImpl<$Res>
    implements _$AssemblyPointCopyWith<$Res> {
  __$AssemblyPointCopyWithImpl(this._self, this._then);

  final _AssemblyPoint _self;
  final $Res Function(_AssemblyPoint) _then;

/// Create a copy of AssemblyPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? buildingId = freezed,Object? capacity = freezed,Object? currentOccupancy = null,Object? description = freezed,Object? accessibilityFeatures = freezed,Object? isActive = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AssemblyPoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,currentOccupancy: null == currentOccupancy ? _self.currentOccupancy : currentOccupancy // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,accessibilityFeatures: freezed == accessibilityFeatures ? _self._accessibilityFeatures : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
as List<String>?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$EvacuationRouteSummary {

 String get id; String get name; String get description; double get distanceMeters; int get estimatedTimeMinutes;@latLngListConverter List<LatLng> get pathCoordinates; String get assemblyPointId; String? get assemblyPointName; bool get isWheelchairAccessible; bool get isEmergencyRoute; List<String>? get hazards; Map<String, dynamic>? get metadata;
/// Create a copy of EvacuationRouteSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvacuationRouteSummaryCopyWith<EvacuationRouteSummary> get copyWith => _$EvacuationRouteSummaryCopyWithImpl<EvacuationRouteSummary>(this as EvacuationRouteSummary, _$identity);

  /// Serializes this EvacuationRouteSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EvacuationRouteSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EvacuationRouteSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.distanceMeters, _this.distanceMeters) || other.distanceMeters == _this.distanceMeters)&&(identical(other.estimatedTimeMinutes, _this.estimatedTimeMinutes) || other.estimatedTimeMinutes == _this.estimatedTimeMinutes)&&const DeepCollectionEquality().equals(other.pathCoordinates, _this.pathCoordinates)&&(identical(other.assemblyPointId, _this.assemblyPointId) || other.assemblyPointId == _this.assemblyPointId)&&(identical(other.assemblyPointName, _this.assemblyPointName) || other.assemblyPointName == _this.assemblyPointName)&&(identical(other.isWheelchairAccessible, _this.isWheelchairAccessible) || other.isWheelchairAccessible == _this.isWheelchairAccessible)&&(identical(other.isEmergencyRoute, _this.isEmergencyRoute) || other.isEmergencyRoute == _this.isEmergencyRoute)&&const DeepCollectionEquality().equals(other.hazards, _this.hazards)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EvacuationRouteSummary;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.distanceMeters,_this.estimatedTimeMinutes,const DeepCollectionEquality().hash(_this.pathCoordinates),_this.assemblyPointId,_this.assemblyPointName,_this.isWheelchairAccessible,_this.isEmergencyRoute,const DeepCollectionEquality().hash(_this.hazards),const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as EvacuationRouteSummary;
  return 'EvacuationRouteSummary(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, distanceMeters: ${_this.distanceMeters}, estimatedTimeMinutes: ${_this.estimatedTimeMinutes}, pathCoordinates: ${_this.pathCoordinates}, assemblyPointId: ${_this.assemblyPointId}, assemblyPointName: ${_this.assemblyPointName}, isWheelchairAccessible: ${_this.isWheelchairAccessible}, isEmergencyRoute: ${_this.isEmergencyRoute}, hazards: ${_this.hazards}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $EvacuationRouteSummaryCopyWith<$Res>  {
  factory $EvacuationRouteSummaryCopyWith(EvacuationRouteSummary value, $Res Function(EvacuationRouteSummary) _then) = _$EvacuationRouteSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double distanceMeters, int estimatedTimeMinutes,@latLngListConverter List<LatLng> pathCoordinates, String assemblyPointId, String? assemblyPointName, bool isWheelchairAccessible, bool isEmergencyRoute, List<String>? hazards, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$EvacuationRouteSummaryCopyWithImpl<$Res>
    implements $EvacuationRouteSummaryCopyWith<$Res> {
  _$EvacuationRouteSummaryCopyWithImpl(this._self, this._then);

  final EvacuationRouteSummary _self;
  final $Res Function(EvacuationRouteSummary) _then;

/// Create a copy of EvacuationRouteSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? distanceMeters = null,Object? estimatedTimeMinutes = null,Object? pathCoordinates = null,Object? assemblyPointId = null,Object? assemblyPointName = freezed,Object? isWheelchairAccessible = null,Object? isEmergencyRoute = null,Object? hazards = freezed,Object? metadata = freezed,}) {
  return _then(EvacuationRouteSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,estimatedTimeMinutes: null == estimatedTimeMinutes ? _self.estimatedTimeMinutes : estimatedTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,pathCoordinates: null == pathCoordinates ? _self.pathCoordinates : pathCoordinates // ignore: cast_nullable_to_non_nullable
as List<LatLng>,assemblyPointId: null == assemblyPointId ? _self.assemblyPointId : assemblyPointId // ignore: cast_nullable_to_non_nullable
as String,assemblyPointName: freezed == assemblyPointName ? _self.assemblyPointName : assemblyPointName // ignore: cast_nullable_to_non_nullable
as String?,isWheelchairAccessible: null == isWheelchairAccessible ? _self.isWheelchairAccessible : isWheelchairAccessible // ignore: cast_nullable_to_non_nullable
as bool,isEmergencyRoute: null == isEmergencyRoute ? _self.isEmergencyRoute : isEmergencyRoute // ignore: cast_nullable_to_non_nullable
as bool,hazards: freezed == hazards ? _self.hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [EvacuationRouteSummary].
extension EvacuationRouteSummaryPatterns on EvacuationRouteSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EvacuationRouteSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EvacuationRouteSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EvacuationRouteSummary value)  $default,){
final _that = this;
switch (_that) {
case _EvacuationRouteSummary():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EvacuationRouteSummary value)?  $default,){
final _that = this;
switch (_that) {
case _EvacuationRouteSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double distanceMeters,  int estimatedTimeMinutes, @latLngListConverter  List<LatLng> pathCoordinates,  String assemblyPointId,  String? assemblyPointName,  bool isWheelchairAccessible,  bool isEmergencyRoute,  List<String>? hazards,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvacuationRouteSummary() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.distanceMeters,_that.estimatedTimeMinutes,_that.pathCoordinates,_that.assemblyPointId,_that.assemblyPointName,_that.isWheelchairAccessible,_that.isEmergencyRoute,_that.hazards,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double distanceMeters,  int estimatedTimeMinutes, @latLngListConverter  List<LatLng> pathCoordinates,  String assemblyPointId,  String? assemblyPointName,  bool isWheelchairAccessible,  bool isEmergencyRoute,  List<String>? hazards,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _EvacuationRouteSummary():
return $default(_that.id,_that.name,_that.description,_that.distanceMeters,_that.estimatedTimeMinutes,_that.pathCoordinates,_that.assemblyPointId,_that.assemblyPointName,_that.isWheelchairAccessible,_that.isEmergencyRoute,_that.hazards,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double distanceMeters,  int estimatedTimeMinutes, @latLngListConverter  List<LatLng> pathCoordinates,  String assemblyPointId,  String? assemblyPointName,  bool isWheelchairAccessible,  bool isEmergencyRoute,  List<String>? hazards,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _EvacuationRouteSummary() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.distanceMeters,_that.estimatedTimeMinutes,_that.pathCoordinates,_that.assemblyPointId,_that.assemblyPointName,_that.isWheelchairAccessible,_that.isEmergencyRoute,_that.hazards,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EvacuationRouteSummary extends EvacuationRouteSummary {
  const _EvacuationRouteSummary({required this.id, required this.name, required this.description, required this.distanceMeters, required this.estimatedTimeMinutes, @latLngListConverter required  List<LatLng> pathCoordinates, required this.assemblyPointId, this.assemblyPointName, this.isWheelchairAccessible = true, this.isEmergencyRoute = false,  List<String>? hazards,  Map<String, dynamic>? metadata}): _pathCoordinates = pathCoordinates,_hazards = hazards,_metadata = metadata,super._();
  factory _EvacuationRouteSummary.fromJson(Map<String, dynamic> json) => _$EvacuationRouteSummaryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  double distanceMeters;
@override final  int estimatedTimeMinutes;
 final  List<LatLng> _pathCoordinates;
@override@latLngListConverter List<LatLng> get pathCoordinates {
  if (_pathCoordinates is EqualUnmodifiableListView) return _pathCoordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pathCoordinates);
}

@override final  String assemblyPointId;
@override final  String? assemblyPointName;
@override@JsonKey() final  bool isWheelchairAccessible;
@override@JsonKey() final  bool isEmergencyRoute;
 final  List<String>? _hazards;
@override List<String>? get hazards {
  final value = _hazards;
  if (value == null) return null;
  if (_hazards is EqualUnmodifiableListView) return _hazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of EvacuationRouteSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvacuationRouteSummaryCopyWith<_EvacuationRouteSummary> get copyWith => __$EvacuationRouteSummaryCopyWithImpl<_EvacuationRouteSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvacuationRouteSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EvacuationRouteSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters)&&(identical(other.estimatedTimeMinutes, estimatedTimeMinutes) || other.estimatedTimeMinutes == estimatedTimeMinutes)&&const DeepCollectionEquality().equals(other.pathCoordinates, _pathCoordinates)&&(identical(other.assemblyPointId, assemblyPointId) || other.assemblyPointId == assemblyPointId)&&(identical(other.assemblyPointName, assemblyPointName) || other.assemblyPointName == assemblyPointName)&&(identical(other.isWheelchairAccessible, isWheelchairAccessible) || other.isWheelchairAccessible == isWheelchairAccessible)&&(identical(other.isEmergencyRoute, isEmergencyRoute) || other.isEmergencyRoute == isEmergencyRoute)&&const DeepCollectionEquality().equals(other.hazards, _hazards)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,distanceMeters,estimatedTimeMinutes,const DeepCollectionEquality().hash(_pathCoordinates),assemblyPointId,assemblyPointName,isWheelchairAccessible,isEmergencyRoute,const DeepCollectionEquality().hash(_hazards),const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'EvacuationRouteSummary(id: $id, name: $name, description: $description, distanceMeters: $distanceMeters, estimatedTimeMinutes: $estimatedTimeMinutes, pathCoordinates: $pathCoordinates, assemblyPointId: $assemblyPointId, assemblyPointName: $assemblyPointName, isWheelchairAccessible: $isWheelchairAccessible, isEmergencyRoute: $isEmergencyRoute, hazards: $hazards, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$EvacuationRouteSummaryCopyWith<$Res> implements $EvacuationRouteSummaryCopyWith<$Res> {
  factory _$EvacuationRouteSummaryCopyWith(_EvacuationRouteSummary value, $Res Function(_EvacuationRouteSummary) _then) = __$EvacuationRouteSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double distanceMeters, int estimatedTimeMinutes,@latLngListConverter List<LatLng> pathCoordinates, String assemblyPointId, String? assemblyPointName, bool isWheelchairAccessible, bool isEmergencyRoute, List<String>? hazards, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$EvacuationRouteSummaryCopyWithImpl<$Res>
    implements _$EvacuationRouteSummaryCopyWith<$Res> {
  __$EvacuationRouteSummaryCopyWithImpl(this._self, this._then);

  final _EvacuationRouteSummary _self;
  final $Res Function(_EvacuationRouteSummary) _then;

/// Create a copy of EvacuationRouteSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? distanceMeters = null,Object? estimatedTimeMinutes = null,Object? pathCoordinates = null,Object? assemblyPointId = null,Object? assemblyPointName = freezed,Object? isWheelchairAccessible = null,Object? isEmergencyRoute = null,Object? hazards = freezed,Object? metadata = freezed,}) {
  return _then(_EvacuationRouteSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,distanceMeters: null == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double,estimatedTimeMinutes: null == estimatedTimeMinutes ? _self.estimatedTimeMinutes : estimatedTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,pathCoordinates: null == pathCoordinates ? _self._pathCoordinates : pathCoordinates // ignore: cast_nullable_to_non_nullable
as List<LatLng>,assemblyPointId: null == assemblyPointId ? _self.assemblyPointId : assemblyPointId // ignore: cast_nullable_to_non_nullable
as String,assemblyPointName: freezed == assemblyPointName ? _self.assemblyPointName : assemblyPointName // ignore: cast_nullable_to_non_nullable
as String?,isWheelchairAccessible: null == isWheelchairAccessible ? _self.isWheelchairAccessible : isWheelchairAccessible // ignore: cast_nullable_to_non_nullable
as bool,isEmergencyRoute: null == isEmergencyRoute ? _self.isEmergencyRoute : isEmergencyRoute // ignore: cast_nullable_to_non_nullable
as bool,hazards: freezed == hazards ? _self._hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<String>?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
