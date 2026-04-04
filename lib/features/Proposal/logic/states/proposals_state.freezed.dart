// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProposalsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState()';
}


}

/// @nodoc
class $ProposalsStateCopyWith<$Res>  {
$ProposalsStateCopyWith(ProposalsState _, $Res Function(ProposalsState) __);
}


/// Adds pattern-matching-related methods to [ProposalsState].
extension ProposalsStatePatterns on ProposalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( AvailableOffersLoading value)?  availableOffersLoading,TResult Function( AvailableOffersSuccess value)?  availableOffersSuccess,TResult Function( ProposalsLoading value)?  proposalsLoading,TResult Function( ProposalsSuccess value)?  proposalsSuccess,TResult Function( ProposalDetailLoading value)?  proposalDetailLoading,TResult Function( ProposalDetailSuccess value)?  proposalDetailSuccess,TResult Function( ActionLoading value)?  actionLoading,TResult Function( CompareSuccess value)?  compareSuccess,TResult Function( GenerateSuccess value)?  generateSuccess,TResult Function( ApproveSuccess value)?  approveSuccess,TResult Function( RejectSuccess value)?  rejectSuccess,TResult Function( StatusSuccess value)?  statusSuccess,TResult Function( ProposalsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AvailableOffersLoading() when availableOffersLoading != null:
return availableOffersLoading(_that);case AvailableOffersSuccess() when availableOffersSuccess != null:
return availableOffersSuccess(_that);case ProposalsLoading() when proposalsLoading != null:
return proposalsLoading(_that);case ProposalsSuccess() when proposalsSuccess != null:
return proposalsSuccess(_that);case ProposalDetailLoading() when proposalDetailLoading != null:
return proposalDetailLoading(_that);case ProposalDetailSuccess() when proposalDetailSuccess != null:
return proposalDetailSuccess(_that);case ActionLoading() when actionLoading != null:
return actionLoading(_that);case CompareSuccess() when compareSuccess != null:
return compareSuccess(_that);case GenerateSuccess() when generateSuccess != null:
return generateSuccess(_that);case ApproveSuccess() when approveSuccess != null:
return approveSuccess(_that);case RejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( AvailableOffersLoading value)  availableOffersLoading,required TResult Function( AvailableOffersSuccess value)  availableOffersSuccess,required TResult Function( ProposalsLoading value)  proposalsLoading,required TResult Function( ProposalsSuccess value)  proposalsSuccess,required TResult Function( ProposalDetailLoading value)  proposalDetailLoading,required TResult Function( ProposalDetailSuccess value)  proposalDetailSuccess,required TResult Function( ActionLoading value)  actionLoading,required TResult Function( CompareSuccess value)  compareSuccess,required TResult Function( GenerateSuccess value)  generateSuccess,required TResult Function( ApproveSuccess value)  approveSuccess,required TResult Function( RejectSuccess value)  rejectSuccess,required TResult Function( StatusSuccess value)  statusSuccess,required TResult Function( ProposalsError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case AvailableOffersLoading():
return availableOffersLoading(_that);case AvailableOffersSuccess():
return availableOffersSuccess(_that);case ProposalsLoading():
return proposalsLoading(_that);case ProposalsSuccess():
return proposalsSuccess(_that);case ProposalDetailLoading():
return proposalDetailLoading(_that);case ProposalDetailSuccess():
return proposalDetailSuccess(_that);case ActionLoading():
return actionLoading(_that);case CompareSuccess():
return compareSuccess(_that);case GenerateSuccess():
return generateSuccess(_that);case ApproveSuccess():
return approveSuccess(_that);case RejectSuccess():
return rejectSuccess(_that);case StatusSuccess():
return statusSuccess(_that);case ProposalsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( AvailableOffersLoading value)?  availableOffersLoading,TResult? Function( AvailableOffersSuccess value)?  availableOffersSuccess,TResult? Function( ProposalsLoading value)?  proposalsLoading,TResult? Function( ProposalsSuccess value)?  proposalsSuccess,TResult? Function( ProposalDetailLoading value)?  proposalDetailLoading,TResult? Function( ProposalDetailSuccess value)?  proposalDetailSuccess,TResult? Function( ActionLoading value)?  actionLoading,TResult? Function( CompareSuccess value)?  compareSuccess,TResult? Function( GenerateSuccess value)?  generateSuccess,TResult? Function( ApproveSuccess value)?  approveSuccess,TResult? Function( RejectSuccess value)?  rejectSuccess,TResult? Function( StatusSuccess value)?  statusSuccess,TResult? Function( ProposalsError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AvailableOffersLoading() when availableOffersLoading != null:
return availableOffersLoading(_that);case AvailableOffersSuccess() when availableOffersSuccess != null:
return availableOffersSuccess(_that);case ProposalsLoading() when proposalsLoading != null:
return proposalsLoading(_that);case ProposalsSuccess() when proposalsSuccess != null:
return proposalsSuccess(_that);case ProposalDetailLoading() when proposalDetailLoading != null:
return proposalDetailLoading(_that);case ProposalDetailSuccess() when proposalDetailSuccess != null:
return proposalDetailSuccess(_that);case ActionLoading() when actionLoading != null:
return actionLoading(_that);case CompareSuccess() when compareSuccess != null:
return compareSuccess(_that);case GenerateSuccess() when generateSuccess != null:
return generateSuccess(_that);case ApproveSuccess() when approveSuccess != null:
return approveSuccess(_that);case RejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  availableOffersLoading,TResult Function( AvailableOffersResponse response)?  availableOffersSuccess,TResult Function()?  proposalsLoading,TResult Function( ProposalListResponse response)?  proposalsSuccess,TResult Function()?  proposalDetailLoading,TResult Function( ProposalDetailResponse response)?  proposalDetailSuccess,TResult Function()?  actionLoading,TResult Function( CompareResponse response)?  compareSuccess,TResult Function( GenerateProposalResponse response)?  generateSuccess,TResult Function( ProposalActionResponse response)?  approveSuccess,TResult Function( ProposalActionResponse response)?  rejectSuccess,TResult Function( ProposalStatusResponse response)?  statusSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AvailableOffersLoading() when availableOffersLoading != null:
return availableOffersLoading();case AvailableOffersSuccess() when availableOffersSuccess != null:
return availableOffersSuccess(_that.response);case ProposalsLoading() when proposalsLoading != null:
return proposalsLoading();case ProposalsSuccess() when proposalsSuccess != null:
return proposalsSuccess(_that.response);case ProposalDetailLoading() when proposalDetailLoading != null:
return proposalDetailLoading();case ProposalDetailSuccess() when proposalDetailSuccess != null:
return proposalDetailSuccess(_that.response);case ActionLoading() when actionLoading != null:
return actionLoading();case CompareSuccess() when compareSuccess != null:
return compareSuccess(_that.response);case GenerateSuccess() when generateSuccess != null:
return generateSuccess(_that.response);case ApproveSuccess() when approveSuccess != null:
return approveSuccess(_that.response);case RejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that.response);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that.response);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  availableOffersLoading,required TResult Function( AvailableOffersResponse response)  availableOffersSuccess,required TResult Function()  proposalsLoading,required TResult Function( ProposalListResponse response)  proposalsSuccess,required TResult Function()  proposalDetailLoading,required TResult Function( ProposalDetailResponse response)  proposalDetailSuccess,required TResult Function()  actionLoading,required TResult Function( CompareResponse response)  compareSuccess,required TResult Function( GenerateProposalResponse response)  generateSuccess,required TResult Function( ProposalActionResponse response)  approveSuccess,required TResult Function( ProposalActionResponse response)  rejectSuccess,required TResult Function( ProposalStatusResponse response)  statusSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case AvailableOffersLoading():
return availableOffersLoading();case AvailableOffersSuccess():
return availableOffersSuccess(_that.response);case ProposalsLoading():
return proposalsLoading();case ProposalsSuccess():
return proposalsSuccess(_that.response);case ProposalDetailLoading():
return proposalDetailLoading();case ProposalDetailSuccess():
return proposalDetailSuccess(_that.response);case ActionLoading():
return actionLoading();case CompareSuccess():
return compareSuccess(_that.response);case GenerateSuccess():
return generateSuccess(_that.response);case ApproveSuccess():
return approveSuccess(_that.response);case RejectSuccess():
return rejectSuccess(_that.response);case StatusSuccess():
return statusSuccess(_that.response);case ProposalsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  availableOffersLoading,TResult? Function( AvailableOffersResponse response)?  availableOffersSuccess,TResult? Function()?  proposalsLoading,TResult? Function( ProposalListResponse response)?  proposalsSuccess,TResult? Function()?  proposalDetailLoading,TResult? Function( ProposalDetailResponse response)?  proposalDetailSuccess,TResult? Function()?  actionLoading,TResult? Function( CompareResponse response)?  compareSuccess,TResult? Function( GenerateProposalResponse response)?  generateSuccess,TResult? Function( ProposalActionResponse response)?  approveSuccess,TResult? Function( ProposalActionResponse response)?  rejectSuccess,TResult? Function( ProposalStatusResponse response)?  statusSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AvailableOffersLoading() when availableOffersLoading != null:
return availableOffersLoading();case AvailableOffersSuccess() when availableOffersSuccess != null:
return availableOffersSuccess(_that.response);case ProposalsLoading() when proposalsLoading != null:
return proposalsLoading();case ProposalsSuccess() when proposalsSuccess != null:
return proposalsSuccess(_that.response);case ProposalDetailLoading() when proposalDetailLoading != null:
return proposalDetailLoading();case ProposalDetailSuccess() when proposalDetailSuccess != null:
return proposalDetailSuccess(_that.response);case ActionLoading() when actionLoading != null:
return actionLoading();case CompareSuccess() when compareSuccess != null:
return compareSuccess(_that.response);case GenerateSuccess() when generateSuccess != null:
return generateSuccess(_that.response);case ApproveSuccess() when approveSuccess != null:
return approveSuccess(_that.response);case RejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that.response);case StatusSuccess() when statusSuccess != null:
return statusSuccess(_that.response);case ProposalsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProposalsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState.initial()';
}


}




/// @nodoc


class AvailableOffersLoading implements ProposalsState {
  const AvailableOffersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableOffersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState.availableOffersLoading()';
}


}




/// @nodoc


class AvailableOffersSuccess implements ProposalsState {
  const AvailableOffersSuccess(this.response);
  

 final  AvailableOffersResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableOffersSuccessCopyWith<AvailableOffersSuccess> get copyWith => _$AvailableOffersSuccessCopyWithImpl<AvailableOffersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableOffersSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.availableOffersSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $AvailableOffersSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $AvailableOffersSuccessCopyWith(AvailableOffersSuccess value, $Res Function(AvailableOffersSuccess) _then) = _$AvailableOffersSuccessCopyWithImpl;
@useResult
$Res call({
 AvailableOffersResponse response
});




}
/// @nodoc
class _$AvailableOffersSuccessCopyWithImpl<$Res>
    implements $AvailableOffersSuccessCopyWith<$Res> {
  _$AvailableOffersSuccessCopyWithImpl(this._self, this._then);

  final AvailableOffersSuccess _self;
  final $Res Function(AvailableOffersSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(AvailableOffersSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as AvailableOffersResponse,
  ));
}


}

/// @nodoc


class ProposalsLoading implements ProposalsState {
  const ProposalsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState.proposalsLoading()';
}


}




/// @nodoc


class ProposalsSuccess implements ProposalsState {
  const ProposalsSuccess(this.response);
  

 final  ProposalListResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsSuccessCopyWith<ProposalsSuccess> get copyWith => _$ProposalsSuccessCopyWithImpl<ProposalsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.proposalsSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $ProposalsSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsSuccessCopyWith(ProposalsSuccess value, $Res Function(ProposalsSuccess) _then) = _$ProposalsSuccessCopyWithImpl;
@useResult
$Res call({
 ProposalListResponse response
});




}
/// @nodoc
class _$ProposalsSuccessCopyWithImpl<$Res>
    implements $ProposalsSuccessCopyWith<$Res> {
  _$ProposalsSuccessCopyWithImpl(this._self, this._then);

  final ProposalsSuccess _self;
  final $Res Function(ProposalsSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(ProposalsSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ProposalListResponse,
  ));
}


}

/// @nodoc


class ProposalDetailLoading implements ProposalsState {
  const ProposalDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState.proposalDetailLoading()';
}


}




/// @nodoc


class ProposalDetailSuccess implements ProposalsState {
  const ProposalDetailSuccess(this.response);
  

 final  ProposalDetailResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalDetailSuccessCopyWith<ProposalDetailSuccess> get copyWith => _$ProposalDetailSuccessCopyWithImpl<ProposalDetailSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalDetailSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.proposalDetailSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $ProposalDetailSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalDetailSuccessCopyWith(ProposalDetailSuccess value, $Res Function(ProposalDetailSuccess) _then) = _$ProposalDetailSuccessCopyWithImpl;
@useResult
$Res call({
 ProposalDetailResponse response
});




}
/// @nodoc
class _$ProposalDetailSuccessCopyWithImpl<$Res>
    implements $ProposalDetailSuccessCopyWith<$Res> {
  _$ProposalDetailSuccessCopyWithImpl(this._self, this._then);

  final ProposalDetailSuccess _self;
  final $Res Function(ProposalDetailSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(ProposalDetailSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ProposalDetailResponse,
  ));
}


}

/// @nodoc


class ActionLoading implements ProposalsState {
  const ActionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState.actionLoading()';
}


}




/// @nodoc


class CompareSuccess implements ProposalsState {
  const CompareSuccess(this.response);
  

 final  CompareResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompareSuccessCopyWith<CompareSuccess> get copyWith => _$CompareSuccessCopyWithImpl<CompareSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompareSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.compareSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $CompareSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $CompareSuccessCopyWith(CompareSuccess value, $Res Function(CompareSuccess) _then) = _$CompareSuccessCopyWithImpl;
@useResult
$Res call({
 CompareResponse response
});




}
/// @nodoc
class _$CompareSuccessCopyWithImpl<$Res>
    implements $CompareSuccessCopyWith<$Res> {
  _$CompareSuccessCopyWithImpl(this._self, this._then);

  final CompareSuccess _self;
  final $Res Function(CompareSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CompareSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CompareResponse,
  ));
}


}

/// @nodoc


class GenerateSuccess implements ProposalsState {
  const GenerateSuccess(this.response);
  

 final  GenerateProposalResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateSuccessCopyWith<GenerateSuccess> get copyWith => _$GenerateSuccessCopyWithImpl<GenerateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.generateSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $GenerateSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $GenerateSuccessCopyWith(GenerateSuccess value, $Res Function(GenerateSuccess) _then) = _$GenerateSuccessCopyWithImpl;
@useResult
$Res call({
 GenerateProposalResponse response
});




}
/// @nodoc
class _$GenerateSuccessCopyWithImpl<$Res>
    implements $GenerateSuccessCopyWith<$Res> {
  _$GenerateSuccessCopyWithImpl(this._self, this._then);

  final GenerateSuccess _self;
  final $Res Function(GenerateSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(GenerateSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as GenerateProposalResponse,
  ));
}


}

/// @nodoc


class ApproveSuccess implements ProposalsState {
  const ApproveSuccess(this.response);
  

 final  ProposalActionResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApproveSuccessCopyWith<ApproveSuccess> get copyWith => _$ApproveSuccessCopyWithImpl<ApproveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApproveSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.approveSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $ApproveSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ApproveSuccessCopyWith(ApproveSuccess value, $Res Function(ApproveSuccess) _then) = _$ApproveSuccessCopyWithImpl;
@useResult
$Res call({
 ProposalActionResponse response
});




}
/// @nodoc
class _$ApproveSuccessCopyWithImpl<$Res>
    implements $ApproveSuccessCopyWith<$Res> {
  _$ApproveSuccessCopyWithImpl(this._self, this._then);

  final ApproveSuccess _self;
  final $Res Function(ApproveSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(ApproveSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ProposalActionResponse,
  ));
}


}

/// @nodoc


class RejectSuccess implements ProposalsState {
  const RejectSuccess(this.response);
  

 final  ProposalActionResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectSuccessCopyWith<RejectSuccess> get copyWith => _$RejectSuccessCopyWithImpl<RejectSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.rejectSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $RejectSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $RejectSuccessCopyWith(RejectSuccess value, $Res Function(RejectSuccess) _then) = _$RejectSuccessCopyWithImpl;
@useResult
$Res call({
 ProposalActionResponse response
});




}
/// @nodoc
class _$RejectSuccessCopyWithImpl<$Res>
    implements $RejectSuccessCopyWith<$Res> {
  _$RejectSuccessCopyWithImpl(this._self, this._then);

  final RejectSuccess _self;
  final $Res Function(RejectSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(RejectSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ProposalActionResponse,
  ));
}


}

/// @nodoc


class StatusSuccess implements ProposalsState {
  const StatusSuccess(this.response);
  

 final  ProposalStatusResponse response;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusSuccessCopyWith<StatusSuccess> get copyWith => _$StatusSuccessCopyWithImpl<StatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'ProposalsState.statusSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $StatusSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $StatusSuccessCopyWith(StatusSuccess value, $Res Function(StatusSuccess) _then) = _$StatusSuccessCopyWithImpl;
@useResult
$Res call({
 ProposalStatusResponse response
});




}
/// @nodoc
class _$StatusSuccessCopyWithImpl<$Res>
    implements $StatusSuccessCopyWith<$Res> {
  _$StatusSuccessCopyWithImpl(this._self, this._then);

  final StatusSuccess _self;
  final $Res Function(StatusSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(StatusSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ProposalStatusResponse,
  ));
}


}

/// @nodoc


class ProposalsError implements ProposalsState {
  const ProposalsError(this.message);
  

 final  String message;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsErrorCopyWith<ProposalsError> get copyWith => _$ProposalsErrorCopyWithImpl<ProposalsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProposalsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProposalsErrorCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsErrorCopyWith(ProposalsError value, $Res Function(ProposalsError) _then) = _$ProposalsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProposalsErrorCopyWithImpl<$Res>
    implements $ProposalsErrorCopyWith<$Res> {
  _$ProposalsErrorCopyWithImpl(this._self, this._then);

  final ProposalsError _self;
  final $Res Function(ProposalsError) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProposalsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
