import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/sales_response.dart';

part 'sales_state.freezed.dart';

@freezed
class SalesState with _$SalesState {
  const factory SalesState.initial() = _Initial;
  const factory SalesState.loading() = SalesLoading;
  const factory SalesState.success(SalesResponseModel response) = SalesSuccess;
  const factory SalesState.error(String message) = SalesError;
}
