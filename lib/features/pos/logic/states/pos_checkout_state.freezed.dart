// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PosCheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosCheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosCheckoutState()';
}


}

/// @nodoc
class $PosCheckoutStateCopyWith<$Res>  {
$PosCheckoutStateCopyWith(PosCheckoutState _, $Res Function(PosCheckoutState) __);
}


/// Adds pattern-matching-related methods to [PosCheckoutState].
extension PosCheckoutStatePatterns on PosCheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PosCheckoutInitial value)?  initial,TResult Function( PosCheckoutLoading value)?  loading,TResult Function( PosCheckoutSuccess value)?  success,TResult Function( PosCheckoutError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosCheckoutInitial() when initial != null:
return initial(_that);case PosCheckoutLoading() when loading != null:
return loading(_that);case PosCheckoutSuccess() when success != null:
return success(_that);case PosCheckoutError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PosCheckoutInitial value)  initial,required TResult Function( PosCheckoutLoading value)  loading,required TResult Function( PosCheckoutSuccess value)  success,required TResult Function( PosCheckoutError value)  error,}){
final _that = this;
switch (_that) {
case _PosCheckoutInitial():
return initial(_that);case PosCheckoutLoading():
return loading(_that);case PosCheckoutSuccess():
return success(_that);case PosCheckoutError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PosCheckoutInitial value)?  initial,TResult? Function( PosCheckoutLoading value)?  loading,TResult? Function( PosCheckoutSuccess value)?  success,TResult? Function( PosCheckoutError value)?  error,}){
final _that = this;
switch (_that) {
case _PosCheckoutInitial() when initial != null:
return initial(_that);case PosCheckoutLoading() when loading != null:
return loading(_that);case PosCheckoutSuccess() when success != null:
return success(_that);case PosCheckoutError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PosTransactionModel transaction)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosCheckoutInitial() when initial != null:
return initial();case PosCheckoutLoading() when loading != null:
return loading();case PosCheckoutSuccess() when success != null:
return success(_that.transaction);case PosCheckoutError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PosTransactionModel transaction)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _PosCheckoutInitial():
return initial();case PosCheckoutLoading():
return loading();case PosCheckoutSuccess():
return success(_that.transaction);case PosCheckoutError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PosTransactionModel transaction)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _PosCheckoutInitial() when initial != null:
return initial();case PosCheckoutLoading() when loading != null:
return loading();case PosCheckoutSuccess() when success != null:
return success(_that.transaction);case PosCheckoutError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PosCheckoutInitial implements PosCheckoutState {
  const _PosCheckoutInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosCheckoutInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosCheckoutState.initial()';
}


}




/// @nodoc


class PosCheckoutLoading implements PosCheckoutState {
  const PosCheckoutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosCheckoutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosCheckoutState.loading()';
}


}




/// @nodoc


class PosCheckoutSuccess implements PosCheckoutState {
  const PosCheckoutSuccess(this.transaction);
  

 final  PosTransactionModel transaction;

/// Create a copy of PosCheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosCheckoutSuccessCopyWith<PosCheckoutSuccess> get copyWith => _$PosCheckoutSuccessCopyWithImpl<PosCheckoutSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosCheckoutSuccess&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'PosCheckoutState.success(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $PosCheckoutSuccessCopyWith<$Res> implements $PosCheckoutStateCopyWith<$Res> {
  factory $PosCheckoutSuccessCopyWith(PosCheckoutSuccess value, $Res Function(PosCheckoutSuccess) _then) = _$PosCheckoutSuccessCopyWithImpl;
@useResult
$Res call({
 PosTransactionModel transaction
});




}
/// @nodoc
class _$PosCheckoutSuccessCopyWithImpl<$Res>
    implements $PosCheckoutSuccessCopyWith<$Res> {
  _$PosCheckoutSuccessCopyWithImpl(this._self, this._then);

  final PosCheckoutSuccess _self;
  final $Res Function(PosCheckoutSuccess) _then;

/// Create a copy of PosCheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(PosCheckoutSuccess(
null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as PosTransactionModel,
  ));
}


}

/// @nodoc


class PosCheckoutError implements PosCheckoutState {
  const PosCheckoutError(this.message);
  

 final  String message;

/// Create a copy of PosCheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosCheckoutErrorCopyWith<PosCheckoutError> get copyWith => _$PosCheckoutErrorCopyWithImpl<PosCheckoutError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosCheckoutError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PosCheckoutState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PosCheckoutErrorCopyWith<$Res> implements $PosCheckoutStateCopyWith<$Res> {
  factory $PosCheckoutErrorCopyWith(PosCheckoutError value, $Res Function(PosCheckoutError) _then) = _$PosCheckoutErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PosCheckoutErrorCopyWithImpl<$Res>
    implements $PosCheckoutErrorCopyWith<$Res> {
  _$PosCheckoutErrorCopyWithImpl(this._self, this._then);

  final PosCheckoutError _self;
  final $Res Function(PosCheckoutError) _then;

/// Create a copy of PosCheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PosCheckoutError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
