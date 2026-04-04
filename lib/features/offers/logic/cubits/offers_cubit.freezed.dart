// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OffersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OffersState()';
}


}

/// @nodoc
class $OffersStateCopyWith<$Res>  {
$OffersStateCopyWith(OffersState _, $Res Function(OffersState) __);
}


/// Adds pattern-matching-related methods to [OffersState].
extension OffersStatePatterns on OffersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( OffersLoading value)?  loading,TResult Function( UploadSuccess value)?  uploadSuccess,TResult Function( StatusSuccess value)?  statusSuccess,TResult Function( OffersError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case OffersLoading() when loading != null:
return loading(_that);case UploadSuccess() when uploadSuccess != null:
return uploadSuccess(_that);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that);case OffersError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( OffersLoading value)  loading,required TResult Function( UploadSuccess value)  uploadSuccess,required TResult Function( StatusSuccess value)  statusSuccess,required TResult Function( OffersError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case OffersLoading():
return loading(_that);case UploadSuccess():
return uploadSuccess(_that);case StatusSuccess():
return statusSuccess(_that);case OffersError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( OffersLoading value)?  loading,TResult? Function( UploadSuccess value)?  uploadSuccess,TResult? Function( StatusSuccess value)?  statusSuccess,TResult? Function( OffersError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case OffersLoading() when loading != null:
return loading(_that);case UploadSuccess() when uploadSuccess != null:
return uploadSuccess(_that);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that);case OffersError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UploadOfferResponse uploadOfferResponse)?  uploadSuccess,TResult Function( UploadStatusResponse uploadStatusResponse)?  statusSuccess,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case OffersLoading() when loading != null:
return loading();case UploadSuccess() when uploadSuccess != null:
return uploadSuccess(_that.uploadOfferResponse);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that.uploadStatusResponse);case OffersError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UploadOfferResponse uploadOfferResponse)  uploadSuccess,required TResult Function( UploadStatusResponse uploadStatusResponse)  statusSuccess,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case OffersLoading():
return loading();case UploadSuccess():
return uploadSuccess(_that.uploadOfferResponse);case StatusSuccess():
return statusSuccess(_that.uploadStatusResponse);case OffersError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UploadOfferResponse uploadOfferResponse)?  uploadSuccess,TResult? Function( UploadStatusResponse uploadStatusResponse)?  statusSuccess,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case OffersLoading() when loading != null:
return loading();case UploadSuccess() when uploadSuccess != null:
return uploadSuccess(_that.uploadOfferResponse);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that.uploadStatusResponse);case OffersError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OffersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OffersState.initial()';
}


}




/// @nodoc


class OffersLoading implements OffersState {
  const OffersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OffersState.loading()';
}


}




/// @nodoc


class UploadSuccess implements OffersState {
  const UploadSuccess(this.uploadOfferResponse);
  

 final  UploadOfferResponse uploadOfferResponse;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadSuccessCopyWith<UploadSuccess> get copyWith => _$UploadSuccessCopyWithImpl<UploadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadSuccess&&(identical(other.uploadOfferResponse, uploadOfferResponse) || other.uploadOfferResponse == uploadOfferResponse));
}


@override
int get hashCode => Object.hash(runtimeType,uploadOfferResponse);

@override
String toString() {
  return 'OffersState.uploadSuccess(uploadOfferResponse: $uploadOfferResponse)';
}


}

/// @nodoc
abstract mixin class $UploadSuccessCopyWith<$Res> implements $OffersStateCopyWith<$Res> {
  factory $UploadSuccessCopyWith(UploadSuccess value, $Res Function(UploadSuccess) _then) = _$UploadSuccessCopyWithImpl;
@useResult
$Res call({
 UploadOfferResponse uploadOfferResponse
});




}
/// @nodoc
class _$UploadSuccessCopyWithImpl<$Res>
    implements $UploadSuccessCopyWith<$Res> {
  _$UploadSuccessCopyWithImpl(this._self, this._then);

  final UploadSuccess _self;
  final $Res Function(UploadSuccess) _then;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uploadOfferResponse = null,}) {
  return _then(UploadSuccess(
null == uploadOfferResponse ? _self.uploadOfferResponse : uploadOfferResponse // ignore: cast_nullable_to_non_nullable
as UploadOfferResponse,
  ));
}


}

/// @nodoc


class StatusSuccess implements OffersState {
  const StatusSuccess(this.uploadStatusResponse);
  

 final  UploadStatusResponse uploadStatusResponse;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusSuccessCopyWith<StatusSuccess> get copyWith => _$StatusSuccessCopyWithImpl<StatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusSuccess&&(identical(other.uploadStatusResponse, uploadStatusResponse) || other.uploadStatusResponse == uploadStatusResponse));
}


@override
int get hashCode => Object.hash(runtimeType,uploadStatusResponse);

@override
String toString() {
  return 'OffersState.statusSuccess(uploadStatusResponse: $uploadStatusResponse)';
}


}

/// @nodoc
abstract mixin class $StatusSuccessCopyWith<$Res> implements $OffersStateCopyWith<$Res> {
  factory $StatusSuccessCopyWith(StatusSuccess value, $Res Function(StatusSuccess) _then) = _$StatusSuccessCopyWithImpl;
@useResult
$Res call({
 UploadStatusResponse uploadStatusResponse
});




}
/// @nodoc
class _$StatusSuccessCopyWithImpl<$Res>
    implements $StatusSuccessCopyWith<$Res> {
  _$StatusSuccessCopyWithImpl(this._self, this._then);

  final StatusSuccess _self;
  final $Res Function(StatusSuccess) _then;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uploadStatusResponse = null,}) {
  return _then(StatusSuccess(
null == uploadStatusResponse ? _self.uploadStatusResponse : uploadStatusResponse // ignore: cast_nullable_to_non_nullable
as UploadStatusResponse,
  ));
}


}

/// @nodoc


class OffersError implements OffersState {
  const OffersError({required this.error});
  

 final  String error;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OffersErrorCopyWith<OffersError> get copyWith => _$OffersErrorCopyWithImpl<OffersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'OffersState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $OffersErrorCopyWith<$Res> implements $OffersStateCopyWith<$Res> {
  factory $OffersErrorCopyWith(OffersError value, $Res Function(OffersError) _then) = _$OffersErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$OffersErrorCopyWithImpl<$Res>
    implements $OffersErrorCopyWith<$Res> {
  _$OffersErrorCopyWithImpl(this._self, this._then);

  final OffersError _self;
  final $Res Function(OffersError) _then;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(OffersError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
