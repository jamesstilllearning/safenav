// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmergencyContactRelationship {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyContactRelationship);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship()';
}


}

/// @nodoc
class $EmergencyContactRelationshipCopyWith<$Res>  {
$EmergencyContactRelationshipCopyWith(EmergencyContactRelationship _, $Res Function(EmergencyContactRelationship) __);
}


/// Adds pattern-matching-related methods to [EmergencyContactRelationship].
extension EmergencyContactRelationshipPatterns on EmergencyContactRelationship {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Parent value)?  parent,TResult Function( _Spouse value)?  spouse,TResult Function( _Sibling value)?  sibling,TResult Function( _Child value)?  child,TResult Function( _Friend value)?  friend,TResult Function( _Guardian value)?  guardian,TResult Function( _Relative value)?  relative,TResult Function( _Coworker value)?  coworker,TResult Function( _Other value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Parent() when parent != null:
return parent(_that);case _Spouse() when spouse != null:
return spouse(_that);case _Sibling() when sibling != null:
return sibling(_that);case _Child() when child != null:
return child(_that);case _Friend() when friend != null:
return friend(_that);case _Guardian() when guardian != null:
return guardian(_that);case _Relative() when relative != null:
return relative(_that);case _Coworker() when coworker != null:
return coworker(_that);case _Other() when other != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Parent value)  parent,required TResult Function( _Spouse value)  spouse,required TResult Function( _Sibling value)  sibling,required TResult Function( _Child value)  child,required TResult Function( _Friend value)  friend,required TResult Function( _Guardian value)  guardian,required TResult Function( _Relative value)  relative,required TResult Function( _Coworker value)  coworker,required TResult Function( _Other value)  other,}){
final _that = this;
switch (_that) {
case _Parent():
return parent(_that);case _Spouse():
return spouse(_that);case _Sibling():
return sibling(_that);case _Child():
return child(_that);case _Friend():
return friend(_that);case _Guardian():
return guardian(_that);case _Relative():
return relative(_that);case _Coworker():
return coworker(_that);case _Other():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Parent value)?  parent,TResult? Function( _Spouse value)?  spouse,TResult? Function( _Sibling value)?  sibling,TResult? Function( _Child value)?  child,TResult? Function( _Friend value)?  friend,TResult? Function( _Guardian value)?  guardian,TResult? Function( _Relative value)?  relative,TResult? Function( _Coworker value)?  coworker,TResult? Function( _Other value)?  other,}){
final _that = this;
switch (_that) {
case _Parent() when parent != null:
return parent(_that);case _Spouse() when spouse != null:
return spouse(_that);case _Sibling() when sibling != null:
return sibling(_that);case _Child() when child != null:
return child(_that);case _Friend() when friend != null:
return friend(_that);case _Guardian() when guardian != null:
return guardian(_that);case _Relative() when relative != null:
return relative(_that);case _Coworker() when coworker != null:
return coworker(_that);case _Other() when other != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  parent,TResult Function()?  spouse,TResult Function()?  sibling,TResult Function()?  child,TResult Function()?  friend,TResult Function()?  guardian,TResult Function()?  relative,TResult Function()?  coworker,TResult Function()?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Parent() when parent != null:
return parent();case _Spouse() when spouse != null:
return spouse();case _Sibling() when sibling != null:
return sibling();case _Child() when child != null:
return child();case _Friend() when friend != null:
return friend();case _Guardian() when guardian != null:
return guardian();case _Relative() when relative != null:
return relative();case _Coworker() when coworker != null:
return coworker();case _Other() when other != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  parent,required TResult Function()  spouse,required TResult Function()  sibling,required TResult Function()  child,required TResult Function()  friend,required TResult Function()  guardian,required TResult Function()  relative,required TResult Function()  coworker,required TResult Function()  other,}) {final _that = this;
switch (_that) {
case _Parent():
return parent();case _Spouse():
return spouse();case _Sibling():
return sibling();case _Child():
return child();case _Friend():
return friend();case _Guardian():
return guardian();case _Relative():
return relative();case _Coworker():
return coworker();case _Other():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  parent,TResult? Function()?  spouse,TResult? Function()?  sibling,TResult? Function()?  child,TResult? Function()?  friend,TResult? Function()?  guardian,TResult? Function()?  relative,TResult? Function()?  coworker,TResult? Function()?  other,}) {final _that = this;
switch (_that) {
case _Parent() when parent != null:
return parent();case _Spouse() when spouse != null:
return spouse();case _Sibling() when sibling != null:
return sibling();case _Child() when child != null:
return child();case _Friend() when friend != null:
return friend();case _Guardian() when guardian != null:
return guardian();case _Relative() when relative != null:
return relative();case _Coworker() when coworker != null:
return coworker();case _Other() when other != null:
return other();case _:
  return null;

}
}

}

/// @nodoc


class _Parent implements EmergencyContactRelationship {
  const _Parent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Parent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.parent()';
}


}




/// @nodoc


class _Spouse implements EmergencyContactRelationship {
  const _Spouse();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Spouse);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.spouse()';
}


}




/// @nodoc


class _Sibling implements EmergencyContactRelationship {
  const _Sibling();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sibling);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.sibling()';
}


}




/// @nodoc


class _Child implements EmergencyContactRelationship {
  const _Child();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Child);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.child()';
}


}




/// @nodoc


class _Friend implements EmergencyContactRelationship {
  const _Friend();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Friend);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.friend()';
}


}




/// @nodoc


class _Guardian implements EmergencyContactRelationship {
  const _Guardian();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Guardian);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.guardian()';
}


}




/// @nodoc


class _Relative implements EmergencyContactRelationship {
  const _Relative();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Relative);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.relative()';
}


}




/// @nodoc


class _Coworker implements EmergencyContactRelationship {
  const _Coworker();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coworker);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.coworker()';
}


}




/// @nodoc


class _Other implements EmergencyContactRelationship {
  const _Other();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Other);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EmergencyContactRelationship.other()';
}


}





/// @nodoc
mixin _$EmergencyContact {

 String get id; String get userId; String get name;@EmergencyContactRelationshipConverter() EmergencyContactRelationship get relationship; String get phoneNumber; String? get email; String? get address; bool get isPrimary; bool get notifyOnEmergency; bool get notifyOnDrill; bool get canReceiveLocation; String? get notes; Map<String, dynamic>? get metadata; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of EmergencyContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyContactCopyWith<EmergencyContact> get copyWith => _$EmergencyContactCopyWithImpl<EmergencyContact>(this as EmergencyContact, _$identity);

  /// Serializes this EmergencyContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmergencyContact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyContact&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.relationship, _this.relationship) || other.relationship == _this.relationship)&&(identical(other.phoneNumber, _this.phoneNumber) || other.phoneNumber == _this.phoneNumber)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.isPrimary, _this.isPrimary) || other.isPrimary == _this.isPrimary)&&(identical(other.notifyOnEmergency, _this.notifyOnEmergency) || other.notifyOnEmergency == _this.notifyOnEmergency)&&(identical(other.notifyOnDrill, _this.notifyOnDrill) || other.notifyOnDrill == _this.notifyOnDrill)&&(identical(other.canReceiveLocation, _this.canReceiveLocation) || other.canReceiveLocation == _this.canReceiveLocation)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmergencyContact;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.name,_this.relationship,_this.phoneNumber,_this.email,_this.address,_this.isPrimary,_this.notifyOnEmergency,_this.notifyOnDrill,_this.canReceiveLocation,_this.notes,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as EmergencyContact;
  return 'EmergencyContact(id: ${_this.id}, userId: ${_this.userId}, name: ${_this.name}, relationship: ${_this.relationship}, phoneNumber: ${_this.phoneNumber}, email: ${_this.email}, address: ${_this.address}, isPrimary: ${_this.isPrimary}, notifyOnEmergency: ${_this.notifyOnEmergency}, notifyOnDrill: ${_this.notifyOnDrill}, canReceiveLocation: ${_this.canReceiveLocation}, notes: ${_this.notes}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $EmergencyContactCopyWith<$Res>  {
  factory $EmergencyContactCopyWith(EmergencyContact value, $Res Function(EmergencyContact) _then) = _$EmergencyContactCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name,@EmergencyContactRelationshipConverter() EmergencyContactRelationship relationship, String phoneNumber, String? email, String? address, bool isPrimary, bool notifyOnEmergency, bool notifyOnDrill, bool canReceiveLocation, String? notes, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});


$EmergencyContactRelationshipCopyWith<$Res> get relationship;

}
/// @nodoc
class _$EmergencyContactCopyWithImpl<$Res>
    implements $EmergencyContactCopyWith<$Res> {
  _$EmergencyContactCopyWithImpl(this._self, this._then);

  final EmergencyContact _self;
  final $Res Function(EmergencyContact) _then;

/// Create a copy of EmergencyContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? relationship = null,Object? phoneNumber = null,Object? email = freezed,Object? address = freezed,Object? isPrimary = null,Object? notifyOnEmergency = null,Object? notifyOnDrill = null,Object? canReceiveLocation = null,Object? notes = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(EmergencyContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as EmergencyContactRelationship,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,notifyOnEmergency: null == notifyOnEmergency ? _self.notifyOnEmergency : notifyOnEmergency // ignore: cast_nullable_to_non_nullable
as bool,notifyOnDrill: null == notifyOnDrill ? _self.notifyOnDrill : notifyOnDrill // ignore: cast_nullable_to_non_nullable
as bool,canReceiveLocation: null == canReceiveLocation ? _self.canReceiveLocation : canReceiveLocation // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of EmergencyContact
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyContactRelationshipCopyWith<$Res> get relationship {
  
  return $EmergencyContactRelationshipCopyWith<$Res>(_self.relationship, (value) {
    return _then(_self.copyWith(relationship: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmergencyContact].
extension EmergencyContactPatterns on EmergencyContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyContact value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyContact value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String name, @EmergencyContactRelationshipConverter()  EmergencyContactRelationship relationship,  String phoneNumber,  String? email,  String? address,  bool isPrimary,  bool notifyOnEmergency,  bool notifyOnDrill,  bool canReceiveLocation,  String? notes,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyContact() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.relationship,_that.phoneNumber,_that.email,_that.address,_that.isPrimary,_that.notifyOnEmergency,_that.notifyOnDrill,_that.canReceiveLocation,_that.notes,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String name, @EmergencyContactRelationshipConverter()  EmergencyContactRelationship relationship,  String phoneNumber,  String? email,  String? address,  bool isPrimary,  bool notifyOnEmergency,  bool notifyOnDrill,  bool canReceiveLocation,  String? notes,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _EmergencyContact():
return $default(_that.id,_that.userId,_that.name,_that.relationship,_that.phoneNumber,_that.email,_that.address,_that.isPrimary,_that.notifyOnEmergency,_that.notifyOnDrill,_that.canReceiveLocation,_that.notes,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String name, @EmergencyContactRelationshipConverter()  EmergencyContactRelationship relationship,  String phoneNumber,  String? email,  String? address,  bool isPrimary,  bool notifyOnEmergency,  bool notifyOnDrill,  bool canReceiveLocation,  String? notes,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyContact() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.relationship,_that.phoneNumber,_that.email,_that.address,_that.isPrimary,_that.notifyOnEmergency,_that.notifyOnDrill,_that.canReceiveLocation,_that.notes,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmergencyContact extends EmergencyContact {
  const _EmergencyContact({required this.id, required this.userId, required this.name, @EmergencyContactRelationshipConverter() required this.relationship, required this.phoneNumber, this.email, this.address, this.isPrimary = true, this.notifyOnEmergency = false, this.notifyOnDrill = false, this.canReceiveLocation = false, this.notes,  Map<String, dynamic>? metadata, required this.createdAt, required this.updatedAt}): _metadata = metadata,super._();
  factory _EmergencyContact.fromJson(Map<String, dynamic> json) => _$EmergencyContactFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String name;
@override@EmergencyContactRelationshipConverter() final  EmergencyContactRelationship relationship;
@override final  String phoneNumber;
@override final  String? email;
@override final  String? address;
@override@JsonKey() final  bool isPrimary;
@override@JsonKey() final  bool notifyOnEmergency;
@override@JsonKey() final  bool notifyOnDrill;
@override@JsonKey() final  bool canReceiveLocation;
@override final  String? notes;
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

/// Create a copy of EmergencyContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyContactCopyWith<_EmergencyContact> get copyWith => __$EmergencyContactCopyWithImpl<_EmergencyContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmergencyContactToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyContact&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&(identical(other.notifyOnEmergency, notifyOnEmergency) || other.notifyOnEmergency == notifyOnEmergency)&&(identical(other.notifyOnDrill, notifyOnDrill) || other.notifyOnDrill == notifyOnDrill)&&(identical(other.canReceiveLocation, canReceiveLocation) || other.canReceiveLocation == canReceiveLocation)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,name,relationship,phoneNumber,email,address,isPrimary,notifyOnEmergency,notifyOnDrill,canReceiveLocation,notes,const DeepCollectionEquality().hash(_metadata),createdAt,updatedAt);
}

@override
String toString() {
    return 'EmergencyContact(id: $id, userId: $userId, name: $name, relationship: $relationship, phoneNumber: $phoneNumber, email: $email, address: $address, isPrimary: $isPrimary, notifyOnEmergency: $notifyOnEmergency, notifyOnDrill: $notifyOnDrill, canReceiveLocation: $canReceiveLocation, notes: $notes, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EmergencyContactCopyWith<$Res> implements $EmergencyContactCopyWith<$Res> {
  factory _$EmergencyContactCopyWith(_EmergencyContact value, $Res Function(_EmergencyContact) _then) = __$EmergencyContactCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name,@EmergencyContactRelationshipConverter() EmergencyContactRelationship relationship, String phoneNumber, String? email, String? address, bool isPrimary, bool notifyOnEmergency, bool notifyOnDrill, bool canReceiveLocation, String? notes, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});


@override $EmergencyContactRelationshipCopyWith<$Res> get relationship;

}
/// @nodoc
class __$EmergencyContactCopyWithImpl<$Res>
    implements _$EmergencyContactCopyWith<$Res> {
  __$EmergencyContactCopyWithImpl(this._self, this._then);

  final _EmergencyContact _self;
  final $Res Function(_EmergencyContact) _then;

/// Create a copy of EmergencyContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? relationship = null,Object? phoneNumber = null,Object? email = freezed,Object? address = freezed,Object? isPrimary = null,Object? notifyOnEmergency = null,Object? notifyOnDrill = null,Object? canReceiveLocation = null,Object? notes = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_EmergencyContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as EmergencyContactRelationship,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,notifyOnEmergency: null == notifyOnEmergency ? _self.notifyOnEmergency : notifyOnEmergency // ignore: cast_nullable_to_non_nullable
as bool,notifyOnDrill: null == notifyOnDrill ? _self.notifyOnDrill : notifyOnDrill // ignore: cast_nullable_to_non_nullable
as bool,canReceiveLocation: null == canReceiveLocation ? _self.canReceiveLocation : canReceiveLocation // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of EmergencyContact
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyContactRelationshipCopyWith<$Res> get relationship {
  
  return $EmergencyContactRelationshipCopyWith<$Res>(_self.relationship, (value) {
    return _then(_self.copyWith(relationship: value));
  });
}
}


/// @nodoc
mixin _$MedicalInfo {

 String get userId; String? get bloodType; List<String> get allergies; List<String> get medications; List<String> get conditions; List<String> get implants; String? get physicianName; String? get physicianPhone; String? get insuranceProvider; String? get insurancePolicyNumber; String? get organDonorStatus; String? get advanceDirective; bool get hasMedicalAlert; String? get medicalAlertDetails; String? get emergencyNotes; String? get primaryPhysician; Map<String, dynamic>? get metadata; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of MedicalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicalInfoCopyWith<MedicalInfo> get copyWith => _$MedicalInfoCopyWithImpl<MedicalInfo>(this as MedicalInfo, _$identity);

  /// Serializes this MedicalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MedicalInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicalInfo&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.bloodType, _this.bloodType) || other.bloodType == _this.bloodType)&&const DeepCollectionEquality().equals(other.allergies, _this.allergies)&&const DeepCollectionEquality().equals(other.medications, _this.medications)&&const DeepCollectionEquality().equals(other.conditions, _this.conditions)&&const DeepCollectionEquality().equals(other.implants, _this.implants)&&(identical(other.physicianName, _this.physicianName) || other.physicianName == _this.physicianName)&&(identical(other.physicianPhone, _this.physicianPhone) || other.physicianPhone == _this.physicianPhone)&&(identical(other.insuranceProvider, _this.insuranceProvider) || other.insuranceProvider == _this.insuranceProvider)&&(identical(other.insurancePolicyNumber, _this.insurancePolicyNumber) || other.insurancePolicyNumber == _this.insurancePolicyNumber)&&(identical(other.organDonorStatus, _this.organDonorStatus) || other.organDonorStatus == _this.organDonorStatus)&&(identical(other.advanceDirective, _this.advanceDirective) || other.advanceDirective == _this.advanceDirective)&&(identical(other.hasMedicalAlert, _this.hasMedicalAlert) || other.hasMedicalAlert == _this.hasMedicalAlert)&&(identical(other.medicalAlertDetails, _this.medicalAlertDetails) || other.medicalAlertDetails == _this.medicalAlertDetails)&&(identical(other.emergencyNotes, _this.emergencyNotes) || other.emergencyNotes == _this.emergencyNotes)&&(identical(other.primaryPhysician, _this.primaryPhysician) || other.primaryPhysician == _this.primaryPhysician)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MedicalInfo;
  return Object.hashAll([runtimeType,_this.userId,_this.bloodType,const DeepCollectionEquality().hash(_this.allergies),const DeepCollectionEquality().hash(_this.medications),const DeepCollectionEquality().hash(_this.conditions),const DeepCollectionEquality().hash(_this.implants),_this.physicianName,_this.physicianPhone,_this.insuranceProvider,_this.insurancePolicyNumber,_this.organDonorStatus,_this.advanceDirective,_this.hasMedicalAlert,_this.medicalAlertDetails,_this.emergencyNotes,_this.primaryPhysician,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt,_this.updatedAt]);
}

@override
String toString() {
  final _this = this as MedicalInfo;
  return 'MedicalInfo(userId: ${_this.userId}, bloodType: ${_this.bloodType}, allergies: ${_this.allergies}, medications: ${_this.medications}, conditions: ${_this.conditions}, implants: ${_this.implants}, physicianName: ${_this.physicianName}, physicianPhone: ${_this.physicianPhone}, insuranceProvider: ${_this.insuranceProvider}, insurancePolicyNumber: ${_this.insurancePolicyNumber}, organDonorStatus: ${_this.organDonorStatus}, advanceDirective: ${_this.advanceDirective}, hasMedicalAlert: ${_this.hasMedicalAlert}, medicalAlertDetails: ${_this.medicalAlertDetails}, emergencyNotes: ${_this.emergencyNotes}, primaryPhysician: ${_this.primaryPhysician}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $MedicalInfoCopyWith<$Res>  {
  factory $MedicalInfoCopyWith(MedicalInfo value, $Res Function(MedicalInfo) _then) = _$MedicalInfoCopyWithImpl;
@useResult
$Res call({
 String userId, String? bloodType, List<String> allergies, List<String> medications, List<String> conditions, List<String> implants, String? physicianName, String? physicianPhone, String? insuranceProvider, String? insurancePolicyNumber, String? organDonorStatus, String? advanceDirective, bool hasMedicalAlert, String? medicalAlertDetails, String? emergencyNotes, String? primaryPhysician, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$MedicalInfoCopyWithImpl<$Res>
    implements $MedicalInfoCopyWith<$Res> {
  _$MedicalInfoCopyWithImpl(this._self, this._then);

  final MedicalInfo _self;
  final $Res Function(MedicalInfo) _then;

/// Create a copy of MedicalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? bloodType = freezed,Object? allergies = null,Object? medications = null,Object? conditions = null,Object? implants = null,Object? physicianName = freezed,Object? physicianPhone = freezed,Object? insuranceProvider = freezed,Object? insurancePolicyNumber = freezed,Object? organDonorStatus = freezed,Object? advanceDirective = freezed,Object? hasMedicalAlert = null,Object? medicalAlertDetails = freezed,Object? emergencyNotes = freezed,Object? primaryPhysician = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(MedicalInfo(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,allergies: null == allergies ? _self.allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,medications: null == medications ? _self.medications : medications // ignore: cast_nullable_to_non_nullable
as List<String>,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,implants: null == implants ? _self.implants : implants // ignore: cast_nullable_to_non_nullable
as List<String>,physicianName: freezed == physicianName ? _self.physicianName : physicianName // ignore: cast_nullable_to_non_nullable
as String?,physicianPhone: freezed == physicianPhone ? _self.physicianPhone : physicianPhone // ignore: cast_nullable_to_non_nullable
as String?,insuranceProvider: freezed == insuranceProvider ? _self.insuranceProvider : insuranceProvider // ignore: cast_nullable_to_non_nullable
as String?,insurancePolicyNumber: freezed == insurancePolicyNumber ? _self.insurancePolicyNumber : insurancePolicyNumber // ignore: cast_nullable_to_non_nullable
as String?,organDonorStatus: freezed == organDonorStatus ? _self.organDonorStatus : organDonorStatus // ignore: cast_nullable_to_non_nullable
as String?,advanceDirective: freezed == advanceDirective ? _self.advanceDirective : advanceDirective // ignore: cast_nullable_to_non_nullable
as String?,hasMedicalAlert: null == hasMedicalAlert ? _self.hasMedicalAlert : hasMedicalAlert // ignore: cast_nullable_to_non_nullable
as bool,medicalAlertDetails: freezed == medicalAlertDetails ? _self.medicalAlertDetails : medicalAlertDetails // ignore: cast_nullable_to_non_nullable
as String?,emergencyNotes: freezed == emergencyNotes ? _self.emergencyNotes : emergencyNotes // ignore: cast_nullable_to_non_nullable
as String?,primaryPhysician: freezed == primaryPhysician ? _self.primaryPhysician : primaryPhysician // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicalInfo].
extension MedicalInfoPatterns on MedicalInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicalInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicalInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicalInfo value)  $default,){
final _that = this;
switch (_that) {
case _MedicalInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicalInfo value)?  $default,){
final _that = this;
switch (_that) {
case _MedicalInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String? bloodType,  List<String> allergies,  List<String> medications,  List<String> conditions,  List<String> implants,  String? physicianName,  String? physicianPhone,  String? insuranceProvider,  String? insurancePolicyNumber,  String? organDonorStatus,  String? advanceDirective,  bool hasMedicalAlert,  String? medicalAlertDetails,  String? emergencyNotes,  String? primaryPhysician,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicalInfo() when $default != null:
return $default(_that.userId,_that.bloodType,_that.allergies,_that.medications,_that.conditions,_that.implants,_that.physicianName,_that.physicianPhone,_that.insuranceProvider,_that.insurancePolicyNumber,_that.organDonorStatus,_that.advanceDirective,_that.hasMedicalAlert,_that.medicalAlertDetails,_that.emergencyNotes,_that.primaryPhysician,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String? bloodType,  List<String> allergies,  List<String> medications,  List<String> conditions,  List<String> implants,  String? physicianName,  String? physicianPhone,  String? insuranceProvider,  String? insurancePolicyNumber,  String? organDonorStatus,  String? advanceDirective,  bool hasMedicalAlert,  String? medicalAlertDetails,  String? emergencyNotes,  String? primaryPhysician,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MedicalInfo():
return $default(_that.userId,_that.bloodType,_that.allergies,_that.medications,_that.conditions,_that.implants,_that.physicianName,_that.physicianPhone,_that.insuranceProvider,_that.insurancePolicyNumber,_that.organDonorStatus,_that.advanceDirective,_that.hasMedicalAlert,_that.medicalAlertDetails,_that.emergencyNotes,_that.primaryPhysician,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String? bloodType,  List<String> allergies,  List<String> medications,  List<String> conditions,  List<String> implants,  String? physicianName,  String? physicianPhone,  String? insuranceProvider,  String? insurancePolicyNumber,  String? organDonorStatus,  String? advanceDirective,  bool hasMedicalAlert,  String? medicalAlertDetails,  String? emergencyNotes,  String? primaryPhysician,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MedicalInfo() when $default != null:
return $default(_that.userId,_that.bloodType,_that.allergies,_that.medications,_that.conditions,_that.implants,_that.physicianName,_that.physicianPhone,_that.insuranceProvider,_that.insurancePolicyNumber,_that.organDonorStatus,_that.advanceDirective,_that.hasMedicalAlert,_that.medicalAlertDetails,_that.emergencyNotes,_that.primaryPhysician,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicalInfo extends MedicalInfo {
  const _MedicalInfo({required this.userId, this.bloodType,  List<String> allergies = const [],  List<String> medications = const [],  List<String> conditions = const [],  List<String> implants = const [], this.physicianName, this.physicianPhone, this.insuranceProvider, this.insurancePolicyNumber, this.organDonorStatus, this.advanceDirective, this.hasMedicalAlert = false, this.medicalAlertDetails, this.emergencyNotes, this.primaryPhysician,  Map<String, dynamic>? metadata, required this.createdAt, required this.updatedAt}): _allergies = allergies,_medications = medications,_conditions = conditions,_implants = implants,_metadata = metadata,super._();
  factory _MedicalInfo.fromJson(Map<String, dynamic> json) => _$MedicalInfoFromJson(json);

@override final  String userId;
@override final  String? bloodType;
 final  List<String> _allergies;
@override@JsonKey() List<String> get allergies {
  if (_allergies is EqualUnmodifiableListView) return _allergies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allergies);
}

 final  List<String> _medications;
@override@JsonKey() List<String> get medications {
  if (_medications is EqualUnmodifiableListView) return _medications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medications);
}

 final  List<String> _conditions;
@override@JsonKey() List<String> get conditions {
  if (_conditions is EqualUnmodifiableListView) return _conditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conditions);
}

 final  List<String> _implants;
@override@JsonKey() List<String> get implants {
  if (_implants is EqualUnmodifiableListView) return _implants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_implants);
}

@override final  String? physicianName;
@override final  String? physicianPhone;
@override final  String? insuranceProvider;
@override final  String? insurancePolicyNumber;
@override final  String? organDonorStatus;
@override final  String? advanceDirective;
@override@JsonKey() final  bool hasMedicalAlert;
@override final  String? medicalAlertDetails;
@override final  String? emergencyNotes;
@override final  String? primaryPhysician;
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

/// Create a copy of MedicalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicalInfoCopyWith<_MedicalInfo> get copyWith => __$MedicalInfoCopyWithImpl<_MedicalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicalInfo&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&const DeepCollectionEquality().equals(other.allergies, _allergies)&&const DeepCollectionEquality().equals(other.medications, _medications)&&const DeepCollectionEquality().equals(other.conditions, _conditions)&&const DeepCollectionEquality().equals(other.implants, _implants)&&(identical(other.physicianName, physicianName) || other.physicianName == physicianName)&&(identical(other.physicianPhone, physicianPhone) || other.physicianPhone == physicianPhone)&&(identical(other.insuranceProvider, insuranceProvider) || other.insuranceProvider == insuranceProvider)&&(identical(other.insurancePolicyNumber, insurancePolicyNumber) || other.insurancePolicyNumber == insurancePolicyNumber)&&(identical(other.organDonorStatus, organDonorStatus) || other.organDonorStatus == organDonorStatus)&&(identical(other.advanceDirective, advanceDirective) || other.advanceDirective == advanceDirective)&&(identical(other.hasMedicalAlert, hasMedicalAlert) || other.hasMedicalAlert == hasMedicalAlert)&&(identical(other.medicalAlertDetails, medicalAlertDetails) || other.medicalAlertDetails == medicalAlertDetails)&&(identical(other.emergencyNotes, emergencyNotes) || other.emergencyNotes == emergencyNotes)&&(identical(other.primaryPhysician, primaryPhysician) || other.primaryPhysician == primaryPhysician)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,userId,bloodType,const DeepCollectionEquality().hash(_allergies),const DeepCollectionEquality().hash(_medications),const DeepCollectionEquality().hash(_conditions),const DeepCollectionEquality().hash(_implants),physicianName,physicianPhone,insuranceProvider,insurancePolicyNumber,organDonorStatus,advanceDirective,hasMedicalAlert,medicalAlertDetails,emergencyNotes,primaryPhysician,const DeepCollectionEquality().hash(_metadata),createdAt,updatedAt]);
}

@override
String toString() {
    return 'MedicalInfo(userId: $userId, bloodType: $bloodType, allergies: $allergies, medications: $medications, conditions: $conditions, implants: $implants, physicianName: $physicianName, physicianPhone: $physicianPhone, insuranceProvider: $insuranceProvider, insurancePolicyNumber: $insurancePolicyNumber, organDonorStatus: $organDonorStatus, advanceDirective: $advanceDirective, hasMedicalAlert: $hasMedicalAlert, medicalAlertDetails: $medicalAlertDetails, emergencyNotes: $emergencyNotes, primaryPhysician: $primaryPhysician, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MedicalInfoCopyWith<$Res> implements $MedicalInfoCopyWith<$Res> {
  factory _$MedicalInfoCopyWith(_MedicalInfo value, $Res Function(_MedicalInfo) _then) = __$MedicalInfoCopyWithImpl;
@override @useResult
$Res call({
 String userId, String? bloodType, List<String> allergies, List<String> medications, List<String> conditions, List<String> implants, String? physicianName, String? physicianPhone, String? insuranceProvider, String? insurancePolicyNumber, String? organDonorStatus, String? advanceDirective, bool hasMedicalAlert, String? medicalAlertDetails, String? emergencyNotes, String? primaryPhysician, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$MedicalInfoCopyWithImpl<$Res>
    implements _$MedicalInfoCopyWith<$Res> {
  __$MedicalInfoCopyWithImpl(this._self, this._then);

  final _MedicalInfo _self;
  final $Res Function(_MedicalInfo) _then;

/// Create a copy of MedicalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? bloodType = freezed,Object? allergies = null,Object? medications = null,Object? conditions = null,Object? implants = null,Object? physicianName = freezed,Object? physicianPhone = freezed,Object? insuranceProvider = freezed,Object? insurancePolicyNumber = freezed,Object? organDonorStatus = freezed,Object? advanceDirective = freezed,Object? hasMedicalAlert = null,Object? medicalAlertDetails = freezed,Object? emergencyNotes = freezed,Object? primaryPhysician = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_MedicalInfo(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,bloodType: freezed == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String?,allergies: null == allergies ? _self._allergies : allergies // ignore: cast_nullable_to_non_nullable
as List<String>,medications: null == medications ? _self._medications : medications // ignore: cast_nullable_to_non_nullable
as List<String>,conditions: null == conditions ? _self._conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,implants: null == implants ? _self._implants : implants // ignore: cast_nullable_to_non_nullable
as List<String>,physicianName: freezed == physicianName ? _self.physicianName : physicianName // ignore: cast_nullable_to_non_nullable
as String?,physicianPhone: freezed == physicianPhone ? _self.physicianPhone : physicianPhone // ignore: cast_nullable_to_non_nullable
as String?,insuranceProvider: freezed == insuranceProvider ? _self.insuranceProvider : insuranceProvider // ignore: cast_nullable_to_non_nullable
as String?,insurancePolicyNumber: freezed == insurancePolicyNumber ? _self.insurancePolicyNumber : insurancePolicyNumber // ignore: cast_nullable_to_non_nullable
as String?,organDonorStatus: freezed == organDonorStatus ? _self.organDonorStatus : organDonorStatus // ignore: cast_nullable_to_non_nullable
as String?,advanceDirective: freezed == advanceDirective ? _self.advanceDirective : advanceDirective // ignore: cast_nullable_to_non_nullable
as String?,hasMedicalAlert: null == hasMedicalAlert ? _self.hasMedicalAlert : hasMedicalAlert // ignore: cast_nullable_to_non_nullable
as bool,medicalAlertDetails: freezed == medicalAlertDetails ? _self.medicalAlertDetails : medicalAlertDetails // ignore: cast_nullable_to_non_nullable
as String?,emergencyNotes: freezed == emergencyNotes ? _self.emergencyNotes : emergencyNotes // ignore: cast_nullable_to_non_nullable
as String?,primaryPhysician: freezed == primaryPhysician ? _self.primaryPhysician : primaryPhysician // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
