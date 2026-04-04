// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState()';
}


}

/// @nodoc
class $InventoryStateCopyWith<$Res>  {
$InventoryStateCopyWith(InventoryState _, $Res Function(InventoryState) __);
}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( InventoryLoading value)?  loading,TResult Function( SuccessInventoryList value)?  successList,TResult Function( SuccessInventoryCreate value)?  successCreate,TResult Function( SuccessInventoryAdjust value)?  successAdjust,TResult Function( InventoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InventoryLoading() when loading != null:
return loading(_that);case SuccessInventoryList() when successList != null:
return successList(_that);case SuccessInventoryCreate() when successCreate != null:
return successCreate(_that);case SuccessInventoryAdjust() when successAdjust != null:
return successAdjust(_that);case InventoryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( InventoryLoading value)  loading,required TResult Function( SuccessInventoryList value)  successList,required TResult Function( SuccessInventoryCreate value)  successCreate,required TResult Function( SuccessInventoryAdjust value)  successAdjust,required TResult Function( InventoryError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case InventoryLoading():
return loading(_that);case SuccessInventoryList():
return successList(_that);case SuccessInventoryCreate():
return successCreate(_that);case SuccessInventoryAdjust():
return successAdjust(_that);case InventoryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( InventoryLoading value)?  loading,TResult? Function( SuccessInventoryList value)?  successList,TResult? Function( SuccessInventoryCreate value)?  successCreate,TResult? Function( SuccessInventoryAdjust value)?  successAdjust,TResult? Function( InventoryError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case InventoryLoading() when loading != null:
return loading(_that);case SuccessInventoryList() when successList != null:
return successList(_that);case SuccessInventoryCreate() when successCreate != null:
return successCreate(_that);case SuccessInventoryAdjust() when successAdjust != null:
return successAdjust(_that);case InventoryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( InventoryListResponse inventoryListResponse)?  successList,TResult Function( InventoryCreateResponse inventoryCreateResponse)?  successCreate,TResult Function( InventoryAdjustResponse inventoryAdjustResponse)?  successAdjust,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InventoryLoading() when loading != null:
return loading();case SuccessInventoryList() when successList != null:
return successList(_that.inventoryListResponse);case SuccessInventoryCreate() when successCreate != null:
return successCreate(_that.inventoryCreateResponse);case SuccessInventoryAdjust() when successAdjust != null:
return successAdjust(_that.inventoryAdjustResponse);case InventoryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( InventoryListResponse inventoryListResponse)  successList,required TResult Function( InventoryCreateResponse inventoryCreateResponse)  successCreate,required TResult Function( InventoryAdjustResponse inventoryAdjustResponse)  successAdjust,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case InventoryLoading():
return loading();case SuccessInventoryList():
return successList(_that.inventoryListResponse);case SuccessInventoryCreate():
return successCreate(_that.inventoryCreateResponse);case SuccessInventoryAdjust():
return successAdjust(_that.inventoryAdjustResponse);case InventoryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( InventoryListResponse inventoryListResponse)?  successList,TResult? Function( InventoryCreateResponse inventoryCreateResponse)?  successCreate,TResult? Function( InventoryAdjustResponse inventoryAdjustResponse)?  successAdjust,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case InventoryLoading() when loading != null:
return loading();case SuccessInventoryList() when successList != null:
return successList(_that.inventoryListResponse);case SuccessInventoryCreate() when successCreate != null:
return successCreate(_that.inventoryCreateResponse);case SuccessInventoryAdjust() when successAdjust != null:
return successAdjust(_that.inventoryAdjustResponse);case InventoryError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InventoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.initial()';
}


}




/// @nodoc


class InventoryLoading implements InventoryState {
  const InventoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.loading()';
}


}




/// @nodoc


class SuccessInventoryList implements InventoryState {
  const SuccessInventoryList(this.inventoryListResponse);
  

 final  InventoryListResponse inventoryListResponse;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessInventoryListCopyWith<SuccessInventoryList> get copyWith => _$SuccessInventoryListCopyWithImpl<SuccessInventoryList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessInventoryList&&(identical(other.inventoryListResponse, inventoryListResponse) || other.inventoryListResponse == inventoryListResponse));
}


@override
int get hashCode => Object.hash(runtimeType,inventoryListResponse);

@override
String toString() {
  return 'InventoryState.successList(inventoryListResponse: $inventoryListResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessInventoryListCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $SuccessInventoryListCopyWith(SuccessInventoryList value, $Res Function(SuccessInventoryList) _then) = _$SuccessInventoryListCopyWithImpl;
@useResult
$Res call({
 InventoryListResponse inventoryListResponse
});




}
/// @nodoc
class _$SuccessInventoryListCopyWithImpl<$Res>
    implements $SuccessInventoryListCopyWith<$Res> {
  _$SuccessInventoryListCopyWithImpl(this._self, this._then);

  final SuccessInventoryList _self;
  final $Res Function(SuccessInventoryList) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inventoryListResponse = null,}) {
  return _then(SuccessInventoryList(
null == inventoryListResponse ? _self.inventoryListResponse : inventoryListResponse // ignore: cast_nullable_to_non_nullable
as InventoryListResponse,
  ));
}


}

/// @nodoc


class SuccessInventoryCreate implements InventoryState {
  const SuccessInventoryCreate(this.inventoryCreateResponse);
  

 final  InventoryCreateResponse inventoryCreateResponse;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessInventoryCreateCopyWith<SuccessInventoryCreate> get copyWith => _$SuccessInventoryCreateCopyWithImpl<SuccessInventoryCreate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessInventoryCreate&&(identical(other.inventoryCreateResponse, inventoryCreateResponse) || other.inventoryCreateResponse == inventoryCreateResponse));
}


@override
int get hashCode => Object.hash(runtimeType,inventoryCreateResponse);

@override
String toString() {
  return 'InventoryState.successCreate(inventoryCreateResponse: $inventoryCreateResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessInventoryCreateCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $SuccessInventoryCreateCopyWith(SuccessInventoryCreate value, $Res Function(SuccessInventoryCreate) _then) = _$SuccessInventoryCreateCopyWithImpl;
@useResult
$Res call({
 InventoryCreateResponse inventoryCreateResponse
});




}
/// @nodoc
class _$SuccessInventoryCreateCopyWithImpl<$Res>
    implements $SuccessInventoryCreateCopyWith<$Res> {
  _$SuccessInventoryCreateCopyWithImpl(this._self, this._then);

  final SuccessInventoryCreate _self;
  final $Res Function(SuccessInventoryCreate) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inventoryCreateResponse = null,}) {
  return _then(SuccessInventoryCreate(
null == inventoryCreateResponse ? _self.inventoryCreateResponse : inventoryCreateResponse // ignore: cast_nullable_to_non_nullable
as InventoryCreateResponse,
  ));
}


}

/// @nodoc


class SuccessInventoryAdjust implements InventoryState {
  const SuccessInventoryAdjust(this.inventoryAdjustResponse);
  

 final  InventoryAdjustResponse inventoryAdjustResponse;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessInventoryAdjustCopyWith<SuccessInventoryAdjust> get copyWith => _$SuccessInventoryAdjustCopyWithImpl<SuccessInventoryAdjust>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessInventoryAdjust&&(identical(other.inventoryAdjustResponse, inventoryAdjustResponse) || other.inventoryAdjustResponse == inventoryAdjustResponse));
}


@override
int get hashCode => Object.hash(runtimeType,inventoryAdjustResponse);

@override
String toString() {
  return 'InventoryState.successAdjust(inventoryAdjustResponse: $inventoryAdjustResponse)';
}


}

/// @nodoc
abstract mixin class $SuccessInventoryAdjustCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $SuccessInventoryAdjustCopyWith(SuccessInventoryAdjust value, $Res Function(SuccessInventoryAdjust) _then) = _$SuccessInventoryAdjustCopyWithImpl;
@useResult
$Res call({
 InventoryAdjustResponse inventoryAdjustResponse
});




}
/// @nodoc
class _$SuccessInventoryAdjustCopyWithImpl<$Res>
    implements $SuccessInventoryAdjustCopyWith<$Res> {
  _$SuccessInventoryAdjustCopyWithImpl(this._self, this._then);

  final SuccessInventoryAdjust _self;
  final $Res Function(SuccessInventoryAdjust) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inventoryAdjustResponse = null,}) {
  return _then(SuccessInventoryAdjust(
null == inventoryAdjustResponse ? _self.inventoryAdjustResponse : inventoryAdjustResponse // ignore: cast_nullable_to_non_nullable
as InventoryAdjustResponse,
  ));
}


}

/// @nodoc


class InventoryError implements InventoryState {
  const InventoryError({required this.error});
  

 final  String error;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryErrorCopyWith<InventoryError> get copyWith => _$InventoryErrorCopyWithImpl<InventoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'InventoryState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $InventoryErrorCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventoryErrorCopyWith(InventoryError value, $Res Function(InventoryError) _then) = _$InventoryErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$InventoryErrorCopyWithImpl<$Res>
    implements $InventoryErrorCopyWith<$Res> {
  _$InventoryErrorCopyWithImpl(this._self, this._then);

  final InventoryError _self;
  final $Res Function(InventoryError) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(InventoryError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
