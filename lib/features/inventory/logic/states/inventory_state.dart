part of '../cubits/inventory_cubit.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = InventoryLoading;
  const factory InventoryState.successList(
    InventoryListResponse inventoryListResponse,
  ) = SuccessInventoryList;
  const factory InventoryState.successCreate(
    InventoryCreateResponse inventoryCreateResponse,
  ) = SuccessInventoryCreate;
  const factory InventoryState.successAdjust(
    InventoryAdjustResponse inventoryAdjustResponse,
  ) = SuccessInventoryAdjust;
  const factory InventoryState.error({required String error}) = InventoryError;
}
