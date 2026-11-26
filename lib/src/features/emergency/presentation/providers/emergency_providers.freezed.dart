// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emergency_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SosActivationState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SosActivationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SosActivationState()';
}


}

/// @nodoc
class $SosActivationStateCopyWith<$Res>  {
$SosActivationStateCopyWith(SosActivationState _, $Res Function(SosActivationState) __);
}


/// Adds pattern-matching-related methods to [SosActivationState].
extension SosActivationStatePatterns on SosActivationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Confirming value)?  confirming,TResult Function( _GettingLocation value)?  gettingLocation,TResult Function( _CreatingReport value)?  creatingReport,TResult Function( _ReportCreated value)?  reportCreated,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Confirming() when confirming != null:
return confirming(_that);case _GettingLocation() when gettingLocation != null:
return gettingLocation(_that);case _CreatingReport() when creatingReport != null:
return creatingReport(_that);case _ReportCreated() when reportCreated != null:
return reportCreated(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Confirming value)  confirming,required TResult Function( _GettingLocation value)  gettingLocation,required TResult Function( _CreatingReport value)  creatingReport,required TResult Function( _ReportCreated value)  reportCreated,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Confirming():
return confirming(_that);case _GettingLocation():
return gettingLocation(_that);case _CreatingReport():
return creatingReport(_that);case _ReportCreated():
return reportCreated(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Confirming value)?  confirming,TResult? Function( _GettingLocation value)?  gettingLocation,TResult? Function( _CreatingReport value)?  creatingReport,TResult? Function( _ReportCreated value)?  reportCreated,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Confirming() when confirming != null:
return confirming(_that);case _GettingLocation() when gettingLocation != null:
return gettingLocation(_that);case _CreatingReport() when creatingReport != null:
return creatingReport(_that);case _ReportCreated() when reportCreated != null:
return reportCreated(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( int holdProgress)?  confirming,TResult Function()?  gettingLocation,TResult Function()?  creatingReport,TResult Function( EmergencyReport report)?  reportCreated,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Confirming() when confirming != null:
return confirming(_that.holdProgress);case _GettingLocation() when gettingLocation != null:
return gettingLocation();case _CreatingReport() when creatingReport != null:
return creatingReport();case _ReportCreated() when reportCreated != null:
return reportCreated(_that.report);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( int holdProgress)  confirming,required TResult Function()  gettingLocation,required TResult Function()  creatingReport,required TResult Function( EmergencyReport report)  reportCreated,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Confirming():
return confirming(_that.holdProgress);case _GettingLocation():
return gettingLocation();case _CreatingReport():
return creatingReport();case _ReportCreated():
return reportCreated(_that.report);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( int holdProgress)?  confirming,TResult? Function()?  gettingLocation,TResult? Function()?  creatingReport,TResult? Function( EmergencyReport report)?  reportCreated,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Confirming() when confirming != null:
return confirming(_that.holdProgress);case _GettingLocation() when gettingLocation != null:
return gettingLocation();case _CreatingReport() when creatingReport != null:
return creatingReport();case _ReportCreated() when reportCreated != null:
return reportCreated(_that.report);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements SosActivationState {
  const _Idle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SosActivationState.idle()';
}


}




/// @nodoc


class _Confirming implements SosActivationState {
  const _Confirming({required this.holdProgress});
  

 final  int holdProgress;

/// Create a copy of SosActivationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmingCopyWith<_Confirming> get copyWith => __$ConfirmingCopyWithImpl<_Confirming>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Confirming&&(identical(other.holdProgress, holdProgress) || other.holdProgress == holdProgress));
}


@override
int get hashCode {
    return Object.hash(runtimeType,holdProgress);
}

@override
String toString() {
    return 'SosActivationState.confirming(holdProgress: $holdProgress)';
}


}

/// @nodoc
abstract mixin class _$ConfirmingCopyWith<$Res> implements $SosActivationStateCopyWith<$Res> {
  factory _$ConfirmingCopyWith(_Confirming value, $Res Function(_Confirming) _then) = __$ConfirmingCopyWithImpl;
@useResult
$Res call({
 int holdProgress
});




}
/// @nodoc
class __$ConfirmingCopyWithImpl<$Res>
    implements _$ConfirmingCopyWith<$Res> {
  __$ConfirmingCopyWithImpl(this._self, this._then);

  final _Confirming _self;
  final $Res Function(_Confirming) _then;

/// Create a copy of SosActivationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? holdProgress = null,}) {
  return _then(_Confirming(
holdProgress: null == holdProgress ? _self.holdProgress : holdProgress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GettingLocation implements SosActivationState {
  const _GettingLocation();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GettingLocation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SosActivationState.gettingLocation()';
}


}




/// @nodoc


class _CreatingReport implements SosActivationState {
  const _CreatingReport();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatingReport);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SosActivationState.creatingReport()';
}


}




/// @nodoc


class _ReportCreated implements SosActivationState {
  const _ReportCreated({required this.report});
  

 final  EmergencyReport report;

/// Create a copy of SosActivationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportCreatedCopyWith<_ReportCreated> get copyWith => __$ReportCreatedCopyWithImpl<_ReportCreated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportCreated&&(identical(other.report, report) || other.report == report));
}


@override
int get hashCode {
    return Object.hash(runtimeType,report);
}

@override
String toString() {
    return 'SosActivationState.reportCreated(report: $report)';
}


}

/// @nodoc
abstract mixin class _$ReportCreatedCopyWith<$Res> implements $SosActivationStateCopyWith<$Res> {
  factory _$ReportCreatedCopyWith(_ReportCreated value, $Res Function(_ReportCreated) _then) = __$ReportCreatedCopyWithImpl;
@useResult
$Res call({
 EmergencyReport report
});


$EmergencyReportCopyWith<$Res> get report;

}
/// @nodoc
class __$ReportCreatedCopyWithImpl<$Res>
    implements _$ReportCreatedCopyWith<$Res> {
  __$ReportCreatedCopyWithImpl(this._self, this._then);

  final _ReportCreated _self;
  final $Res Function(_ReportCreated) _then;

/// Create a copy of SosActivationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? report = null,}) {
  return _then(_ReportCreated(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as EmergencyReport,
  ));
}

/// Create a copy of SosActivationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyReportCopyWith<$Res> get report {
  
  return $EmergencyReportCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}

/// @nodoc


class _Error implements SosActivationState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of SosActivationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SosActivationState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SosActivationStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SosActivationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EmergencyStatusViewState {

 EmergencyReport get report; AssemblyPoint? get nearestAssemblyPoint; EvacuationRouteSummary? get evacuationRoute; bool get showCancelButton;
/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyStatusViewStateCopyWith<EmergencyStatusViewState> get copyWith => _$EmergencyStatusViewStateCopyWithImpl<EmergencyStatusViewState>(this as EmergencyStatusViewState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EmergencyStatusViewState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyStatusViewState&&(identical(other.report, _this.report) || other.report == _this.report)&&(identical(other.nearestAssemblyPoint, _this.nearestAssemblyPoint) || other.nearestAssemblyPoint == _this.nearestAssemblyPoint)&&(identical(other.evacuationRoute, _this.evacuationRoute) || other.evacuationRoute == _this.evacuationRoute)&&(identical(other.showCancelButton, _this.showCancelButton) || other.showCancelButton == _this.showCancelButton));
}


@override
int get hashCode {
  final _this = this as EmergencyStatusViewState;
  return Object.hash(runtimeType,_this.report,_this.nearestAssemblyPoint,_this.evacuationRoute,_this.showCancelButton);
}

@override
String toString() {
  final _this = this as EmergencyStatusViewState;
  return 'EmergencyStatusViewState(report: ${_this.report}, nearestAssemblyPoint: ${_this.nearestAssemblyPoint}, evacuationRoute: ${_this.evacuationRoute}, showCancelButton: ${_this.showCancelButton})';
}


}

/// @nodoc
abstract mixin class $EmergencyStatusViewStateCopyWith<$Res>  {
  factory $EmergencyStatusViewStateCopyWith(EmergencyStatusViewState value, $Res Function(EmergencyStatusViewState) _then) = _$EmergencyStatusViewStateCopyWithImpl;
@useResult
$Res call({
 EmergencyReport report, AssemblyPoint? nearestAssemblyPoint, EvacuationRouteSummary? evacuationRoute, bool showCancelButton
});


$EmergencyReportCopyWith<$Res> get report;$AssemblyPointCopyWith<$Res>? get nearestAssemblyPoint;$EvacuationRouteSummaryCopyWith<$Res>? get evacuationRoute;

}
/// @nodoc
class _$EmergencyStatusViewStateCopyWithImpl<$Res>
    implements $EmergencyStatusViewStateCopyWith<$Res> {
  _$EmergencyStatusViewStateCopyWithImpl(this._self, this._then);

  final EmergencyStatusViewState _self;
  final $Res Function(EmergencyStatusViewState) _then;

/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? report = null,Object? nearestAssemblyPoint = freezed,Object? evacuationRoute = freezed,Object? showCancelButton = null,}) {
  return _then(EmergencyStatusViewState(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as EmergencyReport,nearestAssemblyPoint: freezed == nearestAssemblyPoint ? _self.nearestAssemblyPoint : nearestAssemblyPoint // ignore: cast_nullable_to_non_nullable
as AssemblyPoint?,evacuationRoute: freezed == evacuationRoute ? _self.evacuationRoute : evacuationRoute // ignore: cast_nullable_to_non_nullable
as EvacuationRouteSummary?,showCancelButton: null == showCancelButton ? _self.showCancelButton : showCancelButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyReportCopyWith<$Res> get report {
  
  return $EmergencyReportCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssemblyPointCopyWith<$Res>? get nearestAssemblyPoint {
    if (_self.nearestAssemblyPoint == null) {
    return null;
  }

  return $AssemblyPointCopyWith<$Res>(_self.nearestAssemblyPoint!, (value) {
    return _then(_self.copyWith(nearestAssemblyPoint: value));
  });
}/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EvacuationRouteSummaryCopyWith<$Res>? get evacuationRoute {
    if (_self.evacuationRoute == null) {
    return null;
  }

  return $EvacuationRouteSummaryCopyWith<$Res>(_self.evacuationRoute!, (value) {
    return _then(_self.copyWith(evacuationRoute: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmergencyStatusViewState].
extension EmergencyStatusViewStatePatterns on EmergencyStatusViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyStatusViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyStatusViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyStatusViewState value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyStatusViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyStatusViewState value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyStatusViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmergencyReport report,  AssemblyPoint? nearestAssemblyPoint,  EvacuationRouteSummary? evacuationRoute,  bool showCancelButton)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyStatusViewState() when $default != null:
return $default(_that.report,_that.nearestAssemblyPoint,_that.evacuationRoute,_that.showCancelButton);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmergencyReport report,  AssemblyPoint? nearestAssemblyPoint,  EvacuationRouteSummary? evacuationRoute,  bool showCancelButton)  $default,) {final _that = this;
switch (_that) {
case _EmergencyStatusViewState():
return $default(_that.report,_that.nearestAssemblyPoint,_that.evacuationRoute,_that.showCancelButton);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmergencyReport report,  AssemblyPoint? nearestAssemblyPoint,  EvacuationRouteSummary? evacuationRoute,  bool showCancelButton)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyStatusViewState() when $default != null:
return $default(_that.report,_that.nearestAssemblyPoint,_that.evacuationRoute,_that.showCancelButton);case _:
  return null;

}
}

}

/// @nodoc


class _EmergencyStatusViewState implements EmergencyStatusViewState {
  const _EmergencyStatusViewState({required this.report, required this.nearestAssemblyPoint, required this.evacuationRoute, this.showCancelButton = false});
  

@override final  EmergencyReport report;
@override final  AssemblyPoint? nearestAssemblyPoint;
@override final  EvacuationRouteSummary? evacuationRoute;
@override@JsonKey() final  bool showCancelButton;

/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyStatusViewStateCopyWith<_EmergencyStatusViewState> get copyWith => __$EmergencyStatusViewStateCopyWithImpl<_EmergencyStatusViewState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyStatusViewState&&(identical(other.report, report) || other.report == report)&&(identical(other.nearestAssemblyPoint, nearestAssemblyPoint) || other.nearestAssemblyPoint == nearestAssemblyPoint)&&(identical(other.evacuationRoute, evacuationRoute) || other.evacuationRoute == evacuationRoute)&&(identical(other.showCancelButton, showCancelButton) || other.showCancelButton == showCancelButton));
}


@override
int get hashCode {
    return Object.hash(runtimeType,report,nearestAssemblyPoint,evacuationRoute,showCancelButton);
}

@override
String toString() {
    return 'EmergencyStatusViewState(report: $report, nearestAssemblyPoint: $nearestAssemblyPoint, evacuationRoute: $evacuationRoute, showCancelButton: $showCancelButton)';
}


}

/// @nodoc
abstract mixin class _$EmergencyStatusViewStateCopyWith<$Res> implements $EmergencyStatusViewStateCopyWith<$Res> {
  factory _$EmergencyStatusViewStateCopyWith(_EmergencyStatusViewState value, $Res Function(_EmergencyStatusViewState) _then) = __$EmergencyStatusViewStateCopyWithImpl;
@override @useResult
$Res call({
 EmergencyReport report, AssemblyPoint? nearestAssemblyPoint, EvacuationRouteSummary? evacuationRoute, bool showCancelButton
});


@override $EmergencyReportCopyWith<$Res> get report;@override $AssemblyPointCopyWith<$Res>? get nearestAssemblyPoint;@override $EvacuationRouteSummaryCopyWith<$Res>? get evacuationRoute;

}
/// @nodoc
class __$EmergencyStatusViewStateCopyWithImpl<$Res>
    implements _$EmergencyStatusViewStateCopyWith<$Res> {
  __$EmergencyStatusViewStateCopyWithImpl(this._self, this._then);

  final _EmergencyStatusViewState _self;
  final $Res Function(_EmergencyStatusViewState) _then;

/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? report = null,Object? nearestAssemblyPoint = freezed,Object? evacuationRoute = freezed,Object? showCancelButton = null,}) {
  return _then(_EmergencyStatusViewState(
report: null == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as EmergencyReport,nearestAssemblyPoint: freezed == nearestAssemblyPoint ? _self.nearestAssemblyPoint : nearestAssemblyPoint // ignore: cast_nullable_to_non_nullable
as AssemblyPoint?,evacuationRoute: freezed == evacuationRoute ? _self.evacuationRoute : evacuationRoute // ignore: cast_nullable_to_non_nullable
as EvacuationRouteSummary?,showCancelButton: null == showCancelButton ? _self.showCancelButton : showCancelButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyReportCopyWith<$Res> get report {
  
  return $EmergencyReportCopyWith<$Res>(_self.report, (value) {
    return _then(_self.copyWith(report: value));
  });
}/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssemblyPointCopyWith<$Res>? get nearestAssemblyPoint {
    if (_self.nearestAssemblyPoint == null) {
    return null;
  }

  return $AssemblyPointCopyWith<$Res>(_self.nearestAssemblyPoint!, (value) {
    return _then(_self.copyWith(nearestAssemblyPoint: value));
  });
}/// Create a copy of EmergencyStatusViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EvacuationRouteSummaryCopyWith<$Res>? get evacuationRoute {
    if (_self.evacuationRoute == null) {
    return null;
  }

  return $EvacuationRouteSummaryCopyWith<$Res>(_self.evacuationRoute!, (value) {
    return _then(_self.copyWith(evacuationRoute: value));
  });
}
}

/// @nodoc
mixin _$EmergencyActionState {

 bool get isActivatingSos; int get holdProgress; bool get showConfirmation; EmergencyType? get selectedType;
/// Create a copy of EmergencyActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmergencyActionStateCopyWith<EmergencyActionState> get copyWith => _$EmergencyActionStateCopyWithImpl<EmergencyActionState>(this as EmergencyActionState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EmergencyActionState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmergencyActionState&&(identical(other.isActivatingSos, _this.isActivatingSos) || other.isActivatingSos == _this.isActivatingSos)&&(identical(other.holdProgress, _this.holdProgress) || other.holdProgress == _this.holdProgress)&&(identical(other.showConfirmation, _this.showConfirmation) || other.showConfirmation == _this.showConfirmation)&&(identical(other.selectedType, _this.selectedType) || other.selectedType == _this.selectedType));
}


@override
int get hashCode {
  final _this = this as EmergencyActionState;
  return Object.hash(runtimeType,_this.isActivatingSos,_this.holdProgress,_this.showConfirmation,_this.selectedType);
}

@override
String toString() {
  final _this = this as EmergencyActionState;
  return 'EmergencyActionState(isActivatingSos: ${_this.isActivatingSos}, holdProgress: ${_this.holdProgress}, showConfirmation: ${_this.showConfirmation}, selectedType: ${_this.selectedType})';
}


}

/// @nodoc
abstract mixin class $EmergencyActionStateCopyWith<$Res>  {
  factory $EmergencyActionStateCopyWith(EmergencyActionState value, $Res Function(EmergencyActionState) _then) = _$EmergencyActionStateCopyWithImpl;
@useResult
$Res call({
 bool isActivatingSos, int holdProgress, bool showConfirmation, EmergencyType? selectedType
});


$EmergencyTypeCopyWith<$Res>? get selectedType;

}
/// @nodoc
class _$EmergencyActionStateCopyWithImpl<$Res>
    implements $EmergencyActionStateCopyWith<$Res> {
  _$EmergencyActionStateCopyWithImpl(this._self, this._then);

  final EmergencyActionState _self;
  final $Res Function(EmergencyActionState) _then;

/// Create a copy of EmergencyActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isActivatingSos = null,Object? holdProgress = null,Object? showConfirmation = null,Object? selectedType = freezed,}) {
  return _then(EmergencyActionState(
isActivatingSos: null == isActivatingSos ? _self.isActivatingSos : isActivatingSos // ignore: cast_nullable_to_non_nullable
as bool,holdProgress: null == holdProgress ? _self.holdProgress : holdProgress // ignore: cast_nullable_to_non_nullable
as int,showConfirmation: null == showConfirmation ? _self.showConfirmation : showConfirmation // ignore: cast_nullable_to_non_nullable
as bool,selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as EmergencyType?,
  ));
}
/// Create a copy of EmergencyActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyTypeCopyWith<$Res>? get selectedType {
    if (_self.selectedType == null) {
    return null;
  }

  return $EmergencyTypeCopyWith<$Res>(_self.selectedType!, (value) {
    return _then(_self.copyWith(selectedType: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmergencyActionState].
extension EmergencyActionStatePatterns on EmergencyActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmergencyActionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmergencyActionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmergencyActionState value)  $default,){
final _that = this;
switch (_that) {
case _EmergencyActionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmergencyActionState value)?  $default,){
final _that = this;
switch (_that) {
case _EmergencyActionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isActivatingSos,  int holdProgress,  bool showConfirmation,  EmergencyType? selectedType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmergencyActionState() when $default != null:
return $default(_that.isActivatingSos,_that.holdProgress,_that.showConfirmation,_that.selectedType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isActivatingSos,  int holdProgress,  bool showConfirmation,  EmergencyType? selectedType)  $default,) {final _that = this;
switch (_that) {
case _EmergencyActionState():
return $default(_that.isActivatingSos,_that.holdProgress,_that.showConfirmation,_that.selectedType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isActivatingSos,  int holdProgress,  bool showConfirmation,  EmergencyType? selectedType)?  $default,) {final _that = this;
switch (_that) {
case _EmergencyActionState() when $default != null:
return $default(_that.isActivatingSos,_that.holdProgress,_that.showConfirmation,_that.selectedType);case _:
  return null;

}
}

}

/// @nodoc


class _EmergencyActionState extends EmergencyActionState {
  const _EmergencyActionState({this.isActivatingSos = false, this.holdProgress = 0, this.showConfirmation = false, this.selectedType}): super._();
  

@override@JsonKey() final  bool isActivatingSos;
@override@JsonKey() final  int holdProgress;
@override@JsonKey() final  bool showConfirmation;
@override final  EmergencyType? selectedType;

/// Create a copy of EmergencyActionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmergencyActionStateCopyWith<_EmergencyActionState> get copyWith => __$EmergencyActionStateCopyWithImpl<_EmergencyActionState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyActionState&&(identical(other.isActivatingSos, isActivatingSos) || other.isActivatingSos == isActivatingSos)&&(identical(other.holdProgress, holdProgress) || other.holdProgress == holdProgress)&&(identical(other.showConfirmation, showConfirmation) || other.showConfirmation == showConfirmation)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isActivatingSos,holdProgress,showConfirmation,selectedType);
}

@override
String toString() {
    return 'EmergencyActionState(isActivatingSos: $isActivatingSos, holdProgress: $holdProgress, showConfirmation: $showConfirmation, selectedType: $selectedType)';
}


}

/// @nodoc
abstract mixin class _$EmergencyActionStateCopyWith<$Res> implements $EmergencyActionStateCopyWith<$Res> {
  factory _$EmergencyActionStateCopyWith(_EmergencyActionState value, $Res Function(_EmergencyActionState) _then) = __$EmergencyActionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isActivatingSos, int holdProgress, bool showConfirmation, EmergencyType? selectedType
});


@override $EmergencyTypeCopyWith<$Res>? get selectedType;

}
/// @nodoc
class __$EmergencyActionStateCopyWithImpl<$Res>
    implements _$EmergencyActionStateCopyWith<$Res> {
  __$EmergencyActionStateCopyWithImpl(this._self, this._then);

  final _EmergencyActionState _self;
  final $Res Function(_EmergencyActionState) _then;

/// Create a copy of EmergencyActionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isActivatingSos = null,Object? holdProgress = null,Object? showConfirmation = null,Object? selectedType = freezed,}) {
  return _then(_EmergencyActionState(
isActivatingSos: null == isActivatingSos ? _self.isActivatingSos : isActivatingSos // ignore: cast_nullable_to_non_nullable
as bool,holdProgress: null == holdProgress ? _self.holdProgress : holdProgress // ignore: cast_nullable_to_non_nullable
as int,showConfirmation: null == showConfirmation ? _self.showConfirmation : showConfirmation // ignore: cast_nullable_to_non_nullable
as bool,selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as EmergencyType?,
  ));
}

/// Create a copy of EmergencyActionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmergencyTypeCopyWith<$Res>? get selectedType {
    if (_self.selectedType == null) {
    return null;
  }

  return $EmergencyTypeCopyWith<$Res>(_self.selectedType!, (value) {
    return _then(_self.copyWith(selectedType: value));
  });
}
}

// dart format on
