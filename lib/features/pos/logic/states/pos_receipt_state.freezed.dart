// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_receipt_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PosReceiptState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosReceiptState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosReceiptState()';
}


}

/// @nodoc
class $PosReceiptStateCopyWith<$Res>  {
$PosReceiptStateCopyWith(PosReceiptState _, $Res Function(PosReceiptState) __);
}


/// Adds pattern-matching-related methods to [PosReceiptState].
extension PosReceiptStatePatterns on PosReceiptState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PosReceiptInitial value)?  initial,TResult Function( PosReceiptLoading value)?  loading,TResult Function( PosReceiptLoaded value)?  loaded,TResult Function( PosReceiptRefunding value)?  refunding,TResult Function( PosReceiptRefunded value)?  refunded,TResult Function( PosReceiptError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosReceiptInitial() when initial != null:
return initial(_that);case PosReceiptLoading() when loading != null:
return loading(_that);case PosReceiptLoaded() when loaded != null:
return loaded(_that);case PosReceiptRefunding() when refunding != null:
return refunding(_that);case PosReceiptRefunded() when refunded != null:
return refunded(_that);case PosReceiptError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PosReceiptInitial value)  initial,required TResult Function( PosReceiptLoading value)  loading,required TResult Function( PosReceiptLoaded value)  loaded,required TResult Function( PosReceiptRefunding value)  refunding,required TResult Function( PosReceiptRefunded value)  refunded,required TResult Function( PosReceiptError value)  error,}){
final _that = this;
switch (_that) {
case _PosReceiptInitial():
return initial(_that);case PosReceiptLoading():
return loading(_that);case PosReceiptLoaded():
return loaded(_that);case PosReceiptRefunding():
return refunding(_that);case PosReceiptRefunded():
return refunded(_that);case PosReceiptError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PosReceiptInitial value)?  initial,TResult? Function( PosReceiptLoading value)?  loading,TResult? Function( PosReceiptLoaded value)?  loaded,TResult? Function( PosReceiptRefunding value)?  refunding,TResult? Function( PosReceiptRefunded value)?  refunded,TResult? Function( PosReceiptError value)?  error,}){
final _that = this;
switch (_that) {
case _PosReceiptInitial() when initial != null:
return initial(_that);case PosReceiptLoading() when loading != null:
return loading(_that);case PosReceiptLoaded() when loaded != null:
return loaded(_that);case PosReceiptRefunding() when refunding != null:
return refunding(_that);case PosReceiptRefunded() when refunded != null:
return refunded(_that);case PosReceiptError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PosTransactionModel receipt)?  loaded,TResult Function()?  refunding,TResult Function( PosTransactionModel receipt)?  refunded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosReceiptInitial() when initial != null:
return initial();case PosReceiptLoading() when loading != null:
return loading();case PosReceiptLoaded() when loaded != null:
return loaded(_that.receipt);case PosReceiptRefunding() when refunding != null:
return refunding();case PosReceiptRefunded() when refunded != null:
return refunded(_that.receipt);case PosReceiptError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PosTransactionModel receipt)  loaded,required TResult Function()  refunding,required TResult Function( PosTransactionModel receipt)  refunded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _PosReceiptInitial():
return initial();case PosReceiptLoading():
return loading();case PosReceiptLoaded():
return loaded(_that.receipt);case PosReceiptRefunding():
return refunding();case PosReceiptRefunded():
return refunded(_that.receipt);case PosReceiptError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PosTransactionModel receipt)?  loaded,TResult? Function()?  refunding,TResult? Function( PosTransactionModel receipt)?  refunded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _PosReceiptInitial() when initial != null:
return initial();case PosReceiptLoading() when loading != null:
return loading();case PosReceiptLoaded() when loaded != null:
return loaded(_that.receipt);case PosReceiptRefunding() when refunding != null:
return refunding();case PosReceiptRefunded() when refunded != null:
return refunded(_that.receipt);case PosReceiptError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PosReceiptInitial implements PosReceiptState {
  const _PosReceiptInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosReceiptInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosReceiptState.initial()';
}


}




/// @nodoc


class PosReceiptLoading implements PosReceiptState {
  const PosReceiptLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosReceiptLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosReceiptState.loading()';
}


}




/// @nodoc


class PosReceiptLoaded implements PosReceiptState {
  const PosReceiptLoaded(this.receipt);
  

 final  PosTransactionModel receipt;

/// Create a copy of PosReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosReceiptLoadedCopyWith<PosReceiptLoaded> get copyWith => _$PosReceiptLoadedCopyWithImpl<PosReceiptLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosReceiptLoaded&&(identical(other.receipt, receipt) || other.receipt == receipt));
}


@override
int get hashCode => Object.hash(runtimeType,receipt);

@override
String toString() {
  return 'PosReceiptState.loaded(receipt: $receipt)';
}


}

/// @nodoc
abstract mixin class $PosReceiptLoadedCopyWith<$Res> implements $PosReceiptStateCopyWith<$Res> {
  factory $PosReceiptLoadedCopyWith(PosReceiptLoaded value, $Res Function(PosReceiptLoaded) _then) = _$PosReceiptLoadedCopyWithImpl;
@useResult
$Res call({
 PosTransactionModel receipt
});




}
/// @nodoc
class _$PosReceiptLoadedCopyWithImpl<$Res>
    implements $PosReceiptLoadedCopyWith<$Res> {
  _$PosReceiptLoadedCopyWithImpl(this._self, this._then);

  final PosReceiptLoaded _self;
  final $Res Function(PosReceiptLoaded) _then;

/// Create a copy of PosReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receipt = null,}) {
  return _then(PosReceiptLoaded(
null == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as PosTransactionModel,
  ));
}


}

/// @nodoc


class PosReceiptRefunding implements PosReceiptState {
  const PosReceiptRefunding();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosReceiptRefunding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosReceiptState.refunding()';
}


}




/// @nodoc


class PosReceiptRefunded implements PosReceiptState {
  const PosReceiptRefunded(this.receipt);
  

 final  PosTransactionModel receipt;

/// Create a copy of PosReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosReceiptRefundedCopyWith<PosReceiptRefunded> get copyWith => _$PosReceiptRefundedCopyWithImpl<PosReceiptRefunded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosReceiptRefunded&&(identical(other.receipt, receipt) || other.receipt == receipt));
}


@override
int get hashCode => Object.hash(runtimeType,receipt);

@override
String toString() {
  return 'PosReceiptState.refunded(receipt: $receipt)';
}


}

/// @nodoc
abstract mixin class $PosReceiptRefundedCopyWith<$Res> implements $PosReceiptStateCopyWith<$Res> {
  factory $PosReceiptRefundedCopyWith(PosReceiptRefunded value, $Res Function(PosReceiptRefunded) _then) = _$PosReceiptRefundedCopyWithImpl;
@useResult
$Res call({
 PosTransactionModel receipt
});




}
/// @nodoc
class _$PosReceiptRefundedCopyWithImpl<$Res>
    implements $PosReceiptRefundedCopyWith<$Res> {
  _$PosReceiptRefundedCopyWithImpl(this._self, this._then);

  final PosReceiptRefunded _self;
  final $Res Function(PosReceiptRefunded) _then;

/// Create a copy of PosReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receipt = null,}) {
  return _then(PosReceiptRefunded(
null == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as PosTransactionModel,
  ));
}


}

/// @nodoc


class PosReceiptError implements PosReceiptState {
  const PosReceiptError(this.message);
  

 final  String message;

/// Create a copy of PosReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosReceiptErrorCopyWith<PosReceiptError> get copyWith => _$PosReceiptErrorCopyWithImpl<PosReceiptError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosReceiptError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PosReceiptState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PosReceiptErrorCopyWith<$Res> implements $PosReceiptStateCopyWith<$Res> {
  factory $PosReceiptErrorCopyWith(PosReceiptError value, $Res Function(PosReceiptError) _then) = _$PosReceiptErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PosReceiptErrorCopyWithImpl<$Res>
    implements $PosReceiptErrorCopyWith<$Res> {
  _$PosReceiptErrorCopyWithImpl(this._self, this._then);

  final PosReceiptError _self;
  final $Res Function(PosReceiptError) _then;

/// Create a copy of PosReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PosReceiptError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
