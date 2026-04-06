// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState()';
}


}

/// @nodoc
class $NotificationsStateCopyWith<$Res>  {
$NotificationsStateCopyWith(NotificationsState _, $Res Function(NotificationsState) __);
}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( NotificationsLoading value)?  loading,TResult Function( NotificationsSuccess value)?  success,TResult Function( NotificationsError value)?  error,TResult Function( NotificationsActionError value)?  actionError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case NotificationsLoading() when loading != null:
return loading(_that);case NotificationsSuccess() when success != null:
return success(_that);case NotificationsError() when error != null:
return error(_that);case NotificationsActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( NotificationsLoading value)  loading,required TResult Function( NotificationsSuccess value)  success,required TResult Function( NotificationsError value)  error,required TResult Function( NotificationsActionError value)  actionError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case NotificationsLoading():
return loading(_that);case NotificationsSuccess():
return success(_that);case NotificationsError():
return error(_that);case NotificationsActionError():
return actionError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( NotificationsLoading value)?  loading,TResult? Function( NotificationsSuccess value)?  success,TResult? Function( NotificationsError value)?  error,TResult? Function( NotificationsActionError value)?  actionError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case NotificationsLoading() when loading != null:
return loading(_that);case NotificationsSuccess() when success != null:
return success(_that);case NotificationsError() when error != null:
return error(_that);case NotificationsActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( NotificationListResponse response,  bool unreadOnly,  int? processingNotificationId)?  success,TResult Function( String error)?  error,TResult Function( String error,  NotificationListResponse response,  bool unreadOnly)?  actionError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case NotificationsLoading() when loading != null:
return loading();case NotificationsSuccess() when success != null:
return success(_that.response,_that.unreadOnly,_that.processingNotificationId);case NotificationsError() when error != null:
return error(_that.error);case NotificationsActionError() when actionError != null:
return actionError(_that.error,_that.response,_that.unreadOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( NotificationListResponse response,  bool unreadOnly,  int? processingNotificationId)  success,required TResult Function( String error)  error,required TResult Function( String error,  NotificationListResponse response,  bool unreadOnly)  actionError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case NotificationsLoading():
return loading();case NotificationsSuccess():
return success(_that.response,_that.unreadOnly,_that.processingNotificationId);case NotificationsError():
return error(_that.error);case NotificationsActionError():
return actionError(_that.error,_that.response,_that.unreadOnly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( NotificationListResponse response,  bool unreadOnly,  int? processingNotificationId)?  success,TResult? Function( String error)?  error,TResult? Function( String error,  NotificationListResponse response,  bool unreadOnly)?  actionError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case NotificationsLoading() when loading != null:
return loading();case NotificationsSuccess() when success != null:
return success(_that.response,_that.unreadOnly,_that.processingNotificationId);case NotificationsError() when error != null:
return error(_that.error);case NotificationsActionError() when actionError != null:
return actionError(_that.error,_that.response,_that.unreadOnly);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NotificationsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.initial()';
}


}




/// @nodoc


class NotificationsLoading implements NotificationsState {
  const NotificationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.loading()';
}


}




/// @nodoc


class NotificationsSuccess implements NotificationsState {
  const NotificationsSuccess({required this.response, required this.unreadOnly, this.processingNotificationId});
  

 final  NotificationListResponse response;
 final  bool unreadOnly;
 final  int? processingNotificationId;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsSuccessCopyWith<NotificationsSuccess> get copyWith => _$NotificationsSuccessCopyWithImpl<NotificationsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsSuccess&&(identical(other.response, response) || other.response == response)&&(identical(other.unreadOnly, unreadOnly) || other.unreadOnly == unreadOnly)&&(identical(other.processingNotificationId, processingNotificationId) || other.processingNotificationId == processingNotificationId));
}


@override
int get hashCode => Object.hash(runtimeType,response,unreadOnly,processingNotificationId);

@override
String toString() {
  return 'NotificationsState.success(response: $response, unreadOnly: $unreadOnly, processingNotificationId: $processingNotificationId)';
}


}

/// @nodoc
abstract mixin class $NotificationsSuccessCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsSuccessCopyWith(NotificationsSuccess value, $Res Function(NotificationsSuccess) _then) = _$NotificationsSuccessCopyWithImpl;
@useResult
$Res call({
 NotificationListResponse response, bool unreadOnly, int? processingNotificationId
});




}
/// @nodoc
class _$NotificationsSuccessCopyWithImpl<$Res>
    implements $NotificationsSuccessCopyWith<$Res> {
  _$NotificationsSuccessCopyWithImpl(this._self, this._then);

  final NotificationsSuccess _self;
  final $Res Function(NotificationsSuccess) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,Object? unreadOnly = null,Object? processingNotificationId = freezed,}) {
  return _then(NotificationsSuccess(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as NotificationListResponse,unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,processingNotificationId: freezed == processingNotificationId ? _self.processingNotificationId : processingNotificationId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class NotificationsError implements NotificationsState {
  const NotificationsError({required this.error});
  

 final  String error;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsErrorCopyWith<NotificationsError> get copyWith => _$NotificationsErrorCopyWithImpl<NotificationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'NotificationsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $NotificationsErrorCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsErrorCopyWith(NotificationsError value, $Res Function(NotificationsError) _then) = _$NotificationsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$NotificationsErrorCopyWithImpl<$Res>
    implements $NotificationsErrorCopyWith<$Res> {
  _$NotificationsErrorCopyWithImpl(this._self, this._then);

  final NotificationsError _self;
  final $Res Function(NotificationsError) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(NotificationsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NotificationsActionError implements NotificationsState {
  const NotificationsActionError({required this.error, required this.response, required this.unreadOnly});
  

 final  String error;
 final  NotificationListResponse response;
 final  bool unreadOnly;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsActionErrorCopyWith<NotificationsActionError> get copyWith => _$NotificationsActionErrorCopyWithImpl<NotificationsActionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsActionError&&(identical(other.error, error) || other.error == error)&&(identical(other.response, response) || other.response == response)&&(identical(other.unreadOnly, unreadOnly) || other.unreadOnly == unreadOnly));
}


@override
int get hashCode => Object.hash(runtimeType,error,response,unreadOnly);

@override
String toString() {
  return 'NotificationsState.actionError(error: $error, response: $response, unreadOnly: $unreadOnly)';
}


}

/// @nodoc
abstract mixin class $NotificationsActionErrorCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsActionErrorCopyWith(NotificationsActionError value, $Res Function(NotificationsActionError) _then) = _$NotificationsActionErrorCopyWithImpl;
@useResult
$Res call({
 String error, NotificationListResponse response, bool unreadOnly
});




}
/// @nodoc
class _$NotificationsActionErrorCopyWithImpl<$Res>
    implements $NotificationsActionErrorCopyWith<$Res> {
  _$NotificationsActionErrorCopyWithImpl(this._self, this._then);

  final NotificationsActionError _self;
  final $Res Function(NotificationsActionError) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? response = null,Object? unreadOnly = null,}) {
  return _then(NotificationsActionError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as NotificationListResponse,unreadOnly: null == unreadOnly ? _self.unreadOnly : unreadOnly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
