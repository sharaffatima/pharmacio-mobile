import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:camera/camera.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/upload_offer_response.dart';
import '../../data/models/upload_status_response.dart';
import '../../data/repos/offers_repo.dart';

part '../states/offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  final OffersRepo _offersRepo;
  OffersCubit(this._offersRepo)
    : warehouseController = TextEditingController(text: 'Main Warehouse'),
      capturedPath = ValueNotifier<String?>(null),
      selectedFiles = ValueNotifier<List<PlatformFile>>([]),
      recentUploads = ValueNotifier<List<UploadOfferResponse>>([]),
      cameraController = ValueNotifier<CameraController?>(null),
      cameraInitFuture = ValueNotifier<Future<void>?>(null),
      cameraError = ValueNotifier<String?>(null),
      super(OffersState.initial());

  final TextEditingController warehouseController;
  final ValueNotifier<String?> capturedPath;
  final ValueNotifier<List<PlatformFile>> selectedFiles;
  final ValueNotifier<List<UploadOfferResponse>> recentUploads;
  final ValueNotifier<CameraController?> cameraController;
  final ValueNotifier<Future<void>?> cameraInitFuture;
  final ValueNotifier<String?> cameraError;

  Future<void> initCamera() async {
    if (cameraController.value != null) return;
    try {
      final cams = await availableCameras();
      final cam = cams.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cams.first,
      );

      final controller = CameraController(
        cam,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );
      cameraController.value = controller;
      cameraInitFuture.value = controller.initialize();
      cameraError.value = null;
    } catch (e) {
      cameraError.value = 'Camera init failed: $e';
    }
  }

  Future<String?> captureFromCamera() async {
    final controller = cameraController.value;
    final initFuture = cameraInitFuture.value;
    if (controller == null || initFuture == null) return null;
    await initFuture;
    final file = await controller.takePicture();
    return file.path;
  }

  void setCapturedPath(String? path) {
    capturedPath.value = path;
  }

  void addSelectedFiles(List<PlatformFile> files) {
    selectedFiles.value = [...selectedFiles.value, ...files];
  }

  void removeSelectedFile(PlatformFile file) {
    final updated = [...selectedFiles.value]..remove(file);
    selectedFiles.value = updated;
  }

  void clearSelectedFiles() {
    selectedFiles.value = [];
  }

  void clearCapturedPath() {
    capturedPath.value = null;
  }

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
      recentUploads.value = [response, ...recentUploads.value];
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
      final updated = [...recentUploads.value];
      final index = updated.indexWhere((u) => u.uploadId == response.uploadId);
      final mapped = UploadOfferResponse(
        uploadId: response.uploadId,
        originalFilename: response.originalFilename,
        fileUrl: response.fileUrl,
        status: response.status,
        message: response.message,
        createdAt: response.createdAt,
      );
      if (index == -1) {
        updated.insert(0, mapped);
      } else {
        updated[index] = mapped;
      }
      recentUploads.value = updated;
      emit(OffersState.statusSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(OffersState.error(error: message));
    }
  }

  @override
  Future<void> close() {
    warehouseController.dispose();
    capturedPath.dispose();
    selectedFiles.dispose();
    recentUploads.dispose();
    cameraController.value?.dispose();
    cameraController.dispose();
    cameraInitFuture.dispose();
    cameraError.dispose();
    return super.close();
  }
}
