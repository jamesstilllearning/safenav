// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthStatus implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthStatus'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus()';
  }
}

/// @nodoc
class $AuthStatusCopyWith<$Res> {
  $AuthStatusCopyWith(AuthStatus _, $Res Function(AuthStatus) __);
}

/// Adds pattern-matching-related methods to [AuthStatus].
extension AuthStatusPatterns on AuthStatus {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Authenticating value)? authenticating,
    TResult Function(_Registering value)? registering,
    TResult Function(_SendingReset value)? sendingReset,
    TResult Function(_VerifyingEmail value)? verifyingEmail,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _Authenticating() when authenticating != null:
        return authenticating(_that);
      case _Registering() when registering != null:
        return registering(_that);
      case _SendingReset() when sendingReset != null:
        return sendingReset(_that);
      case _VerifyingEmail() when verifyingEmail != null:
        return verifyingEmail(_that);
      case _Error() when error != null:
        return error(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Authenticating value) authenticating,
    required TResult Function(_Registering value) registering,
    required TResult Function(_SendingReset value) sendingReset,
    required TResult Function(_VerifyingEmail value) verifyingEmail,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Authenticated():
        return authenticated(_that);
      case _Unauthenticated():
        return unauthenticated(_that);
      case _Authenticating():
        return authenticating(_that);
      case _Registering():
        return registering(_that);
      case _SendingReset():
        return sendingReset(_that);
      case _VerifyingEmail():
        return verifyingEmail(_that);
      case _Error():
        return error(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_Authenticating value)? authenticating,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_SendingReset value)? sendingReset,
    TResult? Function(_VerifyingEmail value)? verifyingEmail,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Authenticated() when authenticated != null:
        return authenticated(_that);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated(_that);
      case _Authenticating() when authenticating != null:
        return authenticating(_that);
      case _Registering() when registering != null:
        return registering(_that);
      case _SendingReset() when sendingReset != null:
        return sendingReset(_that);
      case _VerifyingEmail() when verifyingEmail != null:
        return verifyingEmail(_that);
      case _Error() when error != null:
        return error(_that);
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
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? authenticating,
    TResult Function()? registering,
    TResult Function()? sendingReset,
    TResult Function()? verifyingEmail,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Authenticated() when authenticated != null:
        return authenticated(_that.user);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _Authenticating() when authenticating != null:
        return authenticating();
      case _Registering() when registering != null:
        return registering();
      case _SendingReset() when sendingReset != null:
        return sendingReset();
      case _VerifyingEmail() when verifyingEmail != null:
        return verifyingEmail();
      case _Error() when error != null:
        return error(_that.failure);
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
    required TResult Function() initial,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() authenticating,
    required TResult Function() registering,
    required TResult Function() sendingReset,
    required TResult Function() verifyingEmail,
    required TResult Function(Failure failure) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Authenticated():
        return authenticated(_that.user);
      case _Unauthenticated():
        return unauthenticated();
      case _Authenticating():
        return authenticating();
      case _Registering():
        return registering();
      case _SendingReset():
        return sendingReset();
      case _VerifyingEmail():
        return verifyingEmail();
      case _Error():
        return error(_that.failure);
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
    TResult? Function()? initial,
    TResult? Function(User user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? authenticating,
    TResult? Function()? registering,
    TResult? Function()? sendingReset,
    TResult? Function()? verifyingEmail,
    TResult? Function(Failure failure)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Authenticated() when authenticated != null:
        return authenticated(_that.user);
      case _Unauthenticated() when unauthenticated != null:
        return unauthenticated();
      case _Authenticating() when authenticating != null:
        return authenticating();
      case _Registering() when registering != null:
        return registering();
      case _SendingReset() when sendingReset != null:
        return sendingReset();
      case _VerifyingEmail() when verifyingEmail != null:
        return verifyingEmail();
      case _Error() when error != null:
        return error(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements AuthStatus {
  const _Initial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthStatus.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.initial()';
  }
}

/// @nodoc

class _Authenticated with DiagnosticableTreeMixin implements AuthStatus {
  const _Authenticated(this.user);

  final User user;

  /// Create a copy of AuthStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticatedCopyWith<_Authenticated> get copyWith =>
      __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthStatus.authenticated'))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authenticated &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, user);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.authenticated(user: $user)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res>
    implements $AuthStatusCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) _then) =
      __$AuthenticatedCopyWithImpl;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

  /// Create a copy of AuthStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(_Authenticated(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of AuthStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _Unauthenticated with DiagnosticableTreeMixin implements AuthStatus {
  const _Unauthenticated();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthStatus.unauthenticated'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.unauthenticated()';
  }
}

/// @nodoc

class _Authenticating with DiagnosticableTreeMixin implements AuthStatus {
  const _Authenticating();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthStatus.authenticating'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Authenticating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.authenticating()';
  }
}

/// @nodoc

class _Registering with DiagnosticableTreeMixin implements AuthStatus {
  const _Registering();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthStatus.registering'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Registering);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.registering()';
  }
}

/// @nodoc

class _SendingReset with DiagnosticableTreeMixin implements AuthStatus {
  const _SendingReset();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthStatus.sendingReset'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SendingReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.sendingReset()';
  }
}

/// @nodoc

class _VerifyingEmail with DiagnosticableTreeMixin implements AuthStatus {
  const _VerifyingEmail();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'AuthStatus.verifyingEmail'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _VerifyingEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.verifyingEmail()';
  }
}

/// @nodoc

class _Error with DiagnosticableTreeMixin implements AuthStatus {
  const _Error(this.failure);

  final Failure failure;

  /// Create a copy of AuthStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'AuthStatus.error'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, failure);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthStatus.error(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $AuthStatusCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of AuthStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(_Error(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
