// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( HomeLoading value)?  loading,TResult Function( HomeLoaded value)?  loaded,TResult Function( HomeError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case HomeLoading() when loading != null:
return loading(_that);case HomeLoaded() when loaded != null:
return loaded(_that);case HomeError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( HomeLoading value)  loading,required TResult Function( HomeLoaded value)  loaded,required TResult Function( HomeError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case HomeLoading():
return loading(_that);case HomeLoaded():
return loaded(_that);case HomeError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( HomeLoading value)?  loading,TResult? Function( HomeLoaded value)?  loaded,TResult? Function( HomeError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case HomeLoading() when loading != null:
return loading(_that);case HomeLoaded() when loaded != null:
return loaded(_that);case HomeError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem>? recentActivities)?  loading,TResult Function( DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem> recentActivities)?  loaded,TResult Function( String error,  DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem>? recentActivities)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case HomeLoading() when loading != null:
return loading(_that.dashboardStats,_that.recentActivities);case HomeLoaded() when loaded != null:
return loaded(_that.dashboardStats,_that.recentActivities);case HomeError() when error != null:
return error(_that.error,_that.dashboardStats,_that.recentActivities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem>? recentActivities)  loading,required TResult Function( DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem> recentActivities)  loaded,required TResult Function( String error,  DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem>? recentActivities)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case HomeLoading():
return loading(_that.dashboardStats,_that.recentActivities);case HomeLoaded():
return loaded(_that.dashboardStats,_that.recentActivities);case HomeError():
return error(_that.error,_that.dashboardStats,_that.recentActivities);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem>? recentActivities)?  loading,TResult? Function( DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem> recentActivities)?  loaded,TResult? Function( String error,  DashboardStatsResponse? dashboardStats,  List<DashboardRecentActivityItem>? recentActivities)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case HomeLoading() when loading != null:
return loading(_that.dashboardStats,_that.recentActivities);case HomeLoaded() when loaded != null:
return loaded(_that.dashboardStats,_that.recentActivities);case HomeError() when error != null:
return error(_that.error,_that.dashboardStats,_that.recentActivities);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class HomeLoading implements HomeState {
  const HomeLoading({this.dashboardStats, final  List<DashboardRecentActivityItem>? recentActivities}): _recentActivities = recentActivities;
  

 final  DashboardStatsResponse? dashboardStats;
 final  List<DashboardRecentActivityItem>? _recentActivities;
 List<DashboardRecentActivityItem>? get recentActivities {
  final value = _recentActivities;
  if (value == null) return null;
  if (_recentActivities is EqualUnmodifiableListView) return _recentActivities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeLoadingCopyWith<HomeLoading> get copyWith => _$HomeLoadingCopyWithImpl<HomeLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoading&&(identical(other.dashboardStats, dashboardStats) || other.dashboardStats == dashboardStats)&&const DeepCollectionEquality().equals(other._recentActivities, _recentActivities));
}


@override
int get hashCode => Object.hash(runtimeType,dashboardStats,const DeepCollectionEquality().hash(_recentActivities));

@override
String toString() {
  return 'HomeState.loading(dashboardStats: $dashboardStats, recentActivities: $recentActivities)';
}


}

/// @nodoc
abstract mixin class $HomeLoadingCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeLoadingCopyWith(HomeLoading value, $Res Function(HomeLoading) _then) = _$HomeLoadingCopyWithImpl;
@useResult
$Res call({
 DashboardStatsResponse? dashboardStats, List<DashboardRecentActivityItem>? recentActivities
});




}
/// @nodoc
class _$HomeLoadingCopyWithImpl<$Res>
    implements $HomeLoadingCopyWith<$Res> {
  _$HomeLoadingCopyWithImpl(this._self, this._then);

  final HomeLoading _self;
  final $Res Function(HomeLoading) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dashboardStats = freezed,Object? recentActivities = freezed,}) {
  return _then(HomeLoading(
dashboardStats: freezed == dashboardStats ? _self.dashboardStats : dashboardStats // ignore: cast_nullable_to_non_nullable
as DashboardStatsResponse?,recentActivities: freezed == recentActivities ? _self._recentActivities : recentActivities // ignore: cast_nullable_to_non_nullable
as List<DashboardRecentActivityItem>?,
  ));
}


}

/// @nodoc


class HomeLoaded implements HomeState {
  const HomeLoaded({this.dashboardStats, final  List<DashboardRecentActivityItem> recentActivities = const <DashboardRecentActivityItem>[]}): _recentActivities = recentActivities;
  

 final  DashboardStatsResponse? dashboardStats;
 final  List<DashboardRecentActivityItem> _recentActivities;
@JsonKey() List<DashboardRecentActivityItem> get recentActivities {
  if (_recentActivities is EqualUnmodifiableListView) return _recentActivities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentActivities);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeLoadedCopyWith<HomeLoaded> get copyWith => _$HomeLoadedCopyWithImpl<HomeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeLoaded&&(identical(other.dashboardStats, dashboardStats) || other.dashboardStats == dashboardStats)&&const DeepCollectionEquality().equals(other._recentActivities, _recentActivities));
}


@override
int get hashCode => Object.hash(runtimeType,dashboardStats,const DeepCollectionEquality().hash(_recentActivities));

@override
String toString() {
  return 'HomeState.loaded(dashboardStats: $dashboardStats, recentActivities: $recentActivities)';
}


}

/// @nodoc
abstract mixin class $HomeLoadedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeLoadedCopyWith(HomeLoaded value, $Res Function(HomeLoaded) _then) = _$HomeLoadedCopyWithImpl;
@useResult
$Res call({
 DashboardStatsResponse? dashboardStats, List<DashboardRecentActivityItem> recentActivities
});




}
/// @nodoc
class _$HomeLoadedCopyWithImpl<$Res>
    implements $HomeLoadedCopyWith<$Res> {
  _$HomeLoadedCopyWithImpl(this._self, this._then);

  final HomeLoaded _self;
  final $Res Function(HomeLoaded) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dashboardStats = freezed,Object? recentActivities = null,}) {
  return _then(HomeLoaded(
dashboardStats: freezed == dashboardStats ? _self.dashboardStats : dashboardStats // ignore: cast_nullable_to_non_nullable
as DashboardStatsResponse?,recentActivities: null == recentActivities ? _self._recentActivities : recentActivities // ignore: cast_nullable_to_non_nullable
as List<DashboardRecentActivityItem>,
  ));
}


}

/// @nodoc


class HomeError implements HomeState {
  const HomeError({required this.error, this.dashboardStats, final  List<DashboardRecentActivityItem>? recentActivities}): _recentActivities = recentActivities;
  

 final  String error;
 final  DashboardStatsResponse? dashboardStats;
 final  List<DashboardRecentActivityItem>? _recentActivities;
 List<DashboardRecentActivityItem>? get recentActivities {
  final value = _recentActivities;
  if (value == null) return null;
  if (_recentActivities is EqualUnmodifiableListView) return _recentActivities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeErrorCopyWith<HomeError> get copyWith => _$HomeErrorCopyWithImpl<HomeError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeError&&(identical(other.error, error) || other.error == error)&&(identical(other.dashboardStats, dashboardStats) || other.dashboardStats == dashboardStats)&&const DeepCollectionEquality().equals(other._recentActivities, _recentActivities));
}


@override
int get hashCode => Object.hash(runtimeType,error,dashboardStats,const DeepCollectionEquality().hash(_recentActivities));

@override
String toString() {
  return 'HomeState.error(error: $error, dashboardStats: $dashboardStats, recentActivities: $recentActivities)';
}


}

/// @nodoc
abstract mixin class $HomeErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeErrorCopyWith(HomeError value, $Res Function(HomeError) _then) = _$HomeErrorCopyWithImpl;
@useResult
$Res call({
 String error, DashboardStatsResponse? dashboardStats, List<DashboardRecentActivityItem>? recentActivities
});




}
/// @nodoc
class _$HomeErrorCopyWithImpl<$Res>
    implements $HomeErrorCopyWith<$Res> {
  _$HomeErrorCopyWithImpl(this._self, this._then);

  final HomeError _self;
  final $Res Function(HomeError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? dashboardStats = freezed,Object? recentActivities = freezed,}) {
  return _then(HomeError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,dashboardStats: freezed == dashboardStats ? _self.dashboardStats : dashboardStats // ignore: cast_nullable_to_non_nullable
as DashboardStatsResponse?,recentActivities: freezed == recentActivities ? _self._recentActivities : recentActivities // ignore: cast_nullable_to_non_nullable
as List<DashboardRecentActivityItem>?,
  ));
}


}

// dart format on
