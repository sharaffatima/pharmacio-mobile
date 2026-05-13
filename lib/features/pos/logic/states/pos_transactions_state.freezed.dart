// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_transactions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PosTransactionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosTransactionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosTransactionsState()';
}


}

/// @nodoc
class $PosTransactionsStateCopyWith<$Res>  {
$PosTransactionsStateCopyWith(PosTransactionsState _, $Res Function(PosTransactionsState) __);
}


/// Adds pattern-matching-related methods to [PosTransactionsState].
extension PosTransactionsStatePatterns on PosTransactionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PosTransactionsInitial value)?  initial,TResult Function( PosTransactionsLoading value)?  loading,TResult Function( PosTransactionsLoaded value)?  loaded,TResult Function( PosTransactionsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PosTransactionsInitial() when initial != null:
return initial(_that);case PosTransactionsLoading() when loading != null:
return loading(_that);case PosTransactionsLoaded() when loaded != null:
return loaded(_that);case PosTransactionsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PosTransactionsInitial value)  initial,required TResult Function( PosTransactionsLoading value)  loading,required TResult Function( PosTransactionsLoaded value)  loaded,required TResult Function( PosTransactionsError value)  error,}){
final _that = this;
switch (_that) {
case _PosTransactionsInitial():
return initial(_that);case PosTransactionsLoading():
return loading(_that);case PosTransactionsLoaded():
return loaded(_that);case PosTransactionsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PosTransactionsInitial value)?  initial,TResult? Function( PosTransactionsLoading value)?  loading,TResult? Function( PosTransactionsLoaded value)?  loaded,TResult? Function( PosTransactionsError value)?  error,}){
final _that = this;
switch (_that) {
case _PosTransactionsInitial() when initial != null:
return initial(_that);case PosTransactionsLoading() when loading != null:
return loading(_that);case PosTransactionsLoaded() when loaded != null:
return loaded(_that);case PosTransactionsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<PosTransactionModel> transactions)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PosTransactionsInitial() when initial != null:
return initial();case PosTransactionsLoading() when loading != null:
return loading();case PosTransactionsLoaded() when loaded != null:
return loaded(_that.transactions);case PosTransactionsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<PosTransactionModel> transactions)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _PosTransactionsInitial():
return initial();case PosTransactionsLoading():
return loading();case PosTransactionsLoaded():
return loaded(_that.transactions);case PosTransactionsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<PosTransactionModel> transactions)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _PosTransactionsInitial() when initial != null:
return initial();case PosTransactionsLoading() when loading != null:
return loading();case PosTransactionsLoaded() when loaded != null:
return loaded(_that.transactions);case PosTransactionsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _PosTransactionsInitial implements PosTransactionsState {
  const _PosTransactionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PosTransactionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosTransactionsState.initial()';
}


}




/// @nodoc


class PosTransactionsLoading implements PosTransactionsState {
  const PosTransactionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosTransactionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosTransactionsState.loading()';
}


}




/// @nodoc


class PosTransactionsLoaded implements PosTransactionsState {
  const PosTransactionsLoaded(final  List<PosTransactionModel> transactions): _transactions = transactions;
  

 final  List<PosTransactionModel> _transactions;
 List<PosTransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of PosTransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosTransactionsLoadedCopyWith<PosTransactionsLoaded> get copyWith => _$PosTransactionsLoadedCopyWithImpl<PosTransactionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosTransactionsLoaded&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'PosTransactionsState.loaded(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $PosTransactionsLoadedCopyWith<$Res> implements $PosTransactionsStateCopyWith<$Res> {
  factory $PosTransactionsLoadedCopyWith(PosTransactionsLoaded value, $Res Function(PosTransactionsLoaded) _then) = _$PosTransactionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<PosTransactionModel> transactions
});




}
/// @nodoc
class _$PosTransactionsLoadedCopyWithImpl<$Res>
    implements $PosTransactionsLoadedCopyWith<$Res> {
  _$PosTransactionsLoadedCopyWithImpl(this._self, this._then);

  final PosTransactionsLoaded _self;
  final $Res Function(PosTransactionsLoaded) _then;

/// Create a copy of PosTransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transactions = null,}) {
  return _then(PosTransactionsLoaded(
null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<PosTransactionModel>,
  ));
}


}

/// @nodoc


class PosTransactionsError implements PosTransactionsState {
  const PosTransactionsError(this.message);
  

 final  String message;

/// Create a copy of PosTransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosTransactionsErrorCopyWith<PosTransactionsError> get copyWith => _$PosTransactionsErrorCopyWithImpl<PosTransactionsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosTransactionsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PosTransactionsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PosTransactionsErrorCopyWith<$Res> implements $PosTransactionsStateCopyWith<$Res> {
  factory $PosTransactionsErrorCopyWith(PosTransactionsError value, $Res Function(PosTransactionsError) _then) = _$PosTransactionsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PosTransactionsErrorCopyWithImpl<$Res>
    implements $PosTransactionsErrorCopyWith<$Res> {
  _$PosTransactionsErrorCopyWithImpl(this._self, this._then);

  final PosTransactionsError _self;
  final $Res Function(PosTransactionsError) _then;

/// Create a copy of PosTransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PosTransactionsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
