import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/offers/logic/cubits/offers_cubit.dart';

class CameraCaptureScreen extends StatelessWidget {
  const CameraCaptureScreen({super.key});

  static Route<String?> route(OffersCubit offersCubit) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: offersCubit,
        child: const CameraCaptureScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final offersCubit = context.read<OffersCubit>();
    offersCubit.initCamera();
    final cameraBackground = AppColors.cameraBackground;

    return Scaffold(
      backgroundColor: cameraBackground,
      appBar: AppBar(
        backgroundColor: cameraBackground,
        foregroundColor: AppColors.white,
        title: Text(AppStrings.camera),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder<String?>(
            valueListenable: offersCubit.cameraError,
            builder: (context, error, _) {
              if (error != null) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          error,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(12),
                        RetryWidget(onPressed: offersCubit.initCamera),
                      ],
                    ),
                  ),
                );
              }

              return ValueListenableBuilder<CameraController?>(
                valueListenable: offersCubit.cameraController,
                builder: (context, controller, __) {
                  return ValueListenableBuilder<Future<void>?>(
                    valueListenable: offersCubit.cameraInitFuture,
                    builder: (context, initFuture, ___) {
                      if (controller == null || initFuture == null) {
                        return const LoadingWidget();
                      }

                      return FutureBuilder<void>(
                        future: initFuture,
                        builder: (context, snap) {
                          if (snap.connectionState != ConnectionState.done) {
                            return const LoadingWidget();
                          }
                          return Center(
                            child: AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: CameraPreview(controller),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 24.h,
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  try {
                    final path = await offersCubit.captureFromCamera();
                    if (context.mounted && path != null) {
                      Navigator.of(context).pop(path);
                    }
                  } catch (e) {
                    if (!context.mounted) return;
                    showAppSnackBar(
                      context,
                      message: '${AppStrings.captureFailedPrefix}$e',
                    );
                  }
                },
                child: Container(
                  width: 72.r,
                  height: 72.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white.withValues(alpha: 0.15),
                    border: Border.all(color: AppColors.white, width: 3),
                  ),
                  child: Center(
                    child: Container(
                      width: 54.r,
                      height: 54.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
