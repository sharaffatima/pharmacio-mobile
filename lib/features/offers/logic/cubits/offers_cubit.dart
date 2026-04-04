import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/upload_offer_response.dart';
import '../../data/models/upload_status_response.dart';
import '../../data/repos/offers_repo.dart';

part '../states/offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  final OffersRepo _offersRepo;
  OffersCubit(this._offersRepo) : super(OffersState.initial());

  Future<void> uploadOfferFile({
    required String filePath,
    required String fileName,
    required String wareHouseName,
  }) async {
    emit(OffersState.loading());
    try {
      final response = await _offersRepo.uploadOfferFile(
        filePath: filePath,
        fileName: fileName,
        wareHouseName: wareHouseName,
      );
      emit(OffersState.uploadSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(OffersState.error(error: message));
    }
  }

  Future<void> getUploadStatus(String uploadId) async {
    emit(OffersState.loading());
    try {
      final response = await _offersRepo.getUploadStatus(uploadId);
      emit(OffersState.statusSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(OffersState.error(error: message));
    }
  }
}
