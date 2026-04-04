part of '../cubits/offers_cubit.dart';

@freezed
class OffersState with _$OffersState {
  const factory OffersState.initial() = _Initial;
  const factory OffersState.loading() = OffersLoading;
  const factory OffersState.uploadSuccess(
    UploadOfferResponse uploadOfferResponse,
  ) = UploadSuccess;
  const factory OffersState.statusSuccess(
    UploadStatusResponse uploadStatusResponse,
  ) = StatusSuccess;
  const factory OffersState.error({required String error}) = OffersError;
}
