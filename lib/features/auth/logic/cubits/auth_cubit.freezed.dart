// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( SuccessLogin value)?  successLogin,TResult Function( SuccessRegister value)?  successRegister,TResult Function( SuccessLogout value)?  successLogout,TResult Function( SuccessGetMe value)?  successGetMe,TResult Function( SuccessChangePassword value)?  successChangePassword,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessLogin() when successLogin != null:
return successLogin(_that);case SuccessRegister() when successRegister != null:
return successRegister(_that);case SuccessLogout() when successLogout != null:
return successLogout(_that);case SuccessGetMe() when successGetMe != null:
return successGetMe(_that);case SuccessChangePassword() when successChangePassword != null:
return successChangePassword(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( SuccessLogin value)  successLogin,required TResult Function( SuccessRegister value)  successRegister,required TResult Function( SuccessLogout value)  successLogout,required TResult Function( SuccessGetMe value)  successGetMe,required TResult Function( SuccessChangePassword value)  successChangePassword,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case SuccessLogin():
return successLogin(_that);case SuccessRegister():
return successRegister(_that);case SuccessLogout():
return successLogout(_that);case SuccessGetMe():
return successGetMe(_that);case SuccessChangePassword():
return successChangePassword(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( SuccessLogin value)?  successLogin,TResult? Function( SuccessRegister value)?  successRegister,TResult? Function( SuccessLogout value)?  successLogout,TResult? Function( SuccessGetMe value)?  successGetMe,TResult? Function( SuccessChangePassword value)?  successChangePassword,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessLogin() when successLogin != null:
return successLogin(_that);case SuccessRegister() when successRegister != null:
return successRegister(_that);case SuccessLogout() when successLogout != null:
return successLogout(_that);case SuccessGetMe() when successGetMe != null:
return successGetMe(_that);case SuccessChangePassword() when successChangePassword != null:
return successChangePassword(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LoginResponse loginResponse)?  successLogin,TResult Function( RegisterResponse registerResponse)?  successRegister,TResult Function( LogoutResponse logoutResponse)?  successLogout,TResult Function( MeResponse meResponse)?  successGetMe,TResult Function( ChangePasswordResponse changePasswordResponse)?  successChangePassword,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessLogin() when successLogin != null:
return successLogin(_that.loginResponse);case SuccessRegister() when successRegister != null:
return successRegister(_that.registerResponse);case SuccessLogout() when successLogout != null:
return successLogout(_that.logoutResponse);case SuccessGetMe() when successGetMe != null:
return successGetMe(_that.meResponse);case SuccessChangePassword() when successChangePassword != null:
return successChangePassword(_that.changePasswordResponse);case Error() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LoginResponse loginResponse)  successLogin,required TResult Function( RegisterResponse registerResponse)  successRegister,required TResult Function( LogoutResponse logoutResponse)  successLogout,required TResult Function( MeResponse meResponse)  successGetMe,required TResult Function( ChangePasswordResponse changePasswordResponse)  successChangePassword,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case SuccessLogin():
return successLogin(_that.loginResponse);case SuccessRegister():
return successRegister(_that.registerResponse);case SuccessLogout():
return successLogout(_that.logoutResponse);case SuccessGetMe():
return successGetMe(_that.meResponse);case SuccessChangePassword():
return successChangePassword(_that.changePasswordResponse);case Error():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LoginResponse loginResponse)?  successLogin,TResult? Function( RegisterResponse registerResponse)?  successRegister,TResult? Function( LogoutResponse logoutResponse)?  successLogout,TResult? Function( MeResponse meResponse)?  successGetMe,TResult? Function( ChangePasswordResponse changePasswordResponse)?  successChangePassword,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessLogin() when successLogin != null:
return successLogin(_that.loginResponse);case SuccessRegister() when successRegister != null:
return successRegister(_that.registerResponse);case SuccessLogout() when successLogout != null:
return successLogout(_that.logoutResponse);case SuccessGetMe() when successGetMe != null:
return successGetMe(_that.meResponse);case SuccessChangePassword() when successChangePassword != null:
return successChangePassword(_that.changePasswordResponse);case Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class Loading implements AuthState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class SuccessLogin implements AuthState {
  const SuccessLogin(this.loginResponse);
  

 final  LoginResponse loginResponse;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessLoginCopyWith<SuccessLogin> get copyWith => _$SuccessLoginCopyWithImpl<SuccessLogin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessLogin&&(identical(other.loginResponse, loginResponse) || other.loginResponse == loginResponse));
}


@override
int get hashCode => Object.hash(runtimeType,loginResponse);

@override
String toString() {
  return 'AuthState.successLogin(loginResponse: $loginResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessLoginCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SuccessLoginCopyWith(SuccessLogin value, $Res Function(SuccessLogin) _then) = _$SuccessLoginCopyWithImpl;
@useResult
$Res call({
 LoginResponse loginResponse
});




}
/// @nodoc
class _$SuccessLoginCopyWithImpl<$Res>
    implements $SuccessLoginCopyWith<$Res> {
  _$SuccessLoginCopyWithImpl(this._self, this._then);

  final SuccessLogin _self;
  final $Res Function(SuccessLogin) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? loginResponse = null,}) {
  return _then(SuccessLogin(
null == loginResponse ? _self.loginResponse : loginResponse // ignore: cast_nullable_to_non_nullable
as LoginResponse,
  ));
}


}

/// @nodoc


class SuccessRegister implements AuthState {
  const SuccessRegister(this.registerResponse);
  

 final  RegisterResponse registerResponse;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessRegisterCopyWith<SuccessRegister> get copyWith => _$SuccessRegisterCopyWithImpl<SuccessRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessRegister&&(identical(other.registerResponse, registerResponse) || other.registerResponse == registerResponse));
}


@override
int get hashCode => Object.hash(runtimeType,registerResponse);

@override
String toString() {
  return 'AuthState.successRegister(registerResponse: $registerResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessRegisterCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SuccessRegisterCopyWith(SuccessRegister value, $Res Function(SuccessRegister) _then) = _$SuccessRegisterCopyWithImpl;
@useResult
$Res call({
 RegisterResponse registerResponse
});




}
/// @nodoc
class _$SuccessRegisterCopyWithImpl<$Res>
    implements $SuccessRegisterCopyWith<$Res> {
  _$SuccessRegisterCopyWithImpl(this._self, this._then);

  final SuccessRegister _self;
  final $Res Function(SuccessRegister) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? registerResponse = null,}) {
  return _then(SuccessRegister(
null == registerResponse ? _self.registerResponse : registerResponse // ignore: cast_nullable_to_non_nullable
as RegisterResponse,
  ));
}


}

/// @nodoc


class SuccessLogout implements AuthState {
  const SuccessLogout(this.logoutResponse);
  

 final  LogoutResponse logoutResponse;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessLogoutCopyWith<SuccessLogout> get copyWith => _$SuccessLogoutCopyWithImpl<SuccessLogout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessLogout&&(identical(other.logoutResponse, logoutResponse) || other.logoutResponse == logoutResponse));
}


@override
int get hashCode => Object.hash(runtimeType,logoutResponse);

@override
String toString() {
  return 'AuthState.successLogout(logoutResponse: $logoutResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessLogoutCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SuccessLogoutCopyWith(SuccessLogout value, $Res Function(SuccessLogout) _then) = _$SuccessLogoutCopyWithImpl;
@useResult
$Res call({
 LogoutResponse logoutResponse
});




}
/// @nodoc
class _$SuccessLogoutCopyWithImpl<$Res>
    implements $SuccessLogoutCopyWith<$Res> {
  _$SuccessLogoutCopyWithImpl(this._self, this._then);

  final SuccessLogout _self;
  final $Res Function(SuccessLogout) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? logoutResponse = null,}) {
  return _then(SuccessLogout(
null == logoutResponse ? _self.logoutResponse : logoutResponse // ignore: cast_nullable_to_non_nullable
as LogoutResponse,
  ));
}


}

/// @nodoc


class SuccessGetMe implements AuthState {
  const SuccessGetMe(this.meResponse);
  

 final  MeResponse meResponse;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGetMeCopyWith<SuccessGetMe> get copyWith => _$SuccessGetMeCopyWithImpl<SuccessGetMe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetMe&&(identical(other.meResponse, meResponse) || other.meResponse == meResponse));
}


@override
int get hashCode => Object.hash(runtimeType,meResponse);

@override
String toString() {
  return 'AuthState.successGetMe(meResponse: $meResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessGetMeCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SuccessGetMeCopyWith(SuccessGetMe value, $Res Function(SuccessGetMe) _then) = _$SuccessGetMeCopyWithImpl;
@useResult
$Res call({
 MeResponse meResponse
});




}
/// @nodoc
class _$SuccessGetMeCopyWithImpl<$Res>
    implements $SuccessGetMeCopyWith<$Res> {
  _$SuccessGetMeCopyWithImpl(this._self, this._then);

  final SuccessGetMe _self;
  final $Res Function(SuccessGetMe) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meResponse = null,}) {
  return _then(SuccessGetMe(
null == meResponse ? _self.meResponse : meResponse // ignore: cast_nullable_to_non_nullable
as MeResponse,
  ));
}


}

/// @nodoc


class SuccessChangePassword implements AuthState {
  const SuccessChangePassword(this.changePasswordResponse);
  

 final  ChangePasswordResponse changePasswordResponse;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessChangePasswordCopyWith<SuccessChangePassword> get copyWith => _$SuccessChangePasswordCopyWithImpl<SuccessChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessChangePassword&&(identical(other.changePasswordResponse, changePasswordResponse) || other.changePasswordResponse == changePasswordResponse));
}


@override
int get hashCode => Object.hash(runtimeType,changePasswordResponse);

@override
String toString() {
  return 'AuthState.successChangePassword(changePasswordResponse: $changePasswordResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessChangePasswordCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $SuccessChangePasswordCopyWith(SuccessChangePassword value, $Res Function(SuccessChangePassword) _then) = _$SuccessChangePasswordCopyWithImpl;
@useResult
$Res call({
 ChangePasswordResponse changePasswordResponse
});




}
/// @nodoc
class _$SuccessChangePasswordCopyWithImpl<$Res>
    implements $SuccessChangePasswordCopyWith<$Res> {
  _$SuccessChangePasswordCopyWithImpl(this._self, this._then);

  final SuccessChangePassword _self;
  final $Res Function(SuccessChangePassword) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? changePasswordResponse = null,}) {
  return _then(SuccessChangePassword(
null == changePasswordResponse ? _self.changePasswordResponse : changePasswordResponse // ignore: cast_nullable_to_non_nullable
as ChangePasswordResponse,
  ));
}


}

/// @nodoc


class Error implements AuthState {
  const Error({required this.error});
  

 final  String error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AuthState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
