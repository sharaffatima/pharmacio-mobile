part of '../cubits/inventory_cubit.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = _Loading;
  const factory InventoryState.success(InventoryResponse inventoryResponse) =
      _Success;
  const factory InventoryState.error({required String error}) = _Error;
}
