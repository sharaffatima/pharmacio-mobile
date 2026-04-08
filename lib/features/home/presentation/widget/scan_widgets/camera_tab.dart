import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../../core/public_widgets/app_primary_button.dart';
import '../../../../offers/logic/cubits/offers_cubit.dart';
import '../../screens/camera_capture_screen.dart';

class CameraTab extends StatelessWidget {
  final String wareHouseName;
  const CameraTab({super.key, required this.wareHouseName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: _CameraContentCard(wareHouseName: wareHouseName),
    );
  }
}

class _CameraContentCard extends StatelessWidget {
  final String wareHouseName;
  const _CameraContentCard({required this.wareHouseName});

  @override
  Widget build(BuildContext context) {
    final offersCubit = context.read<OffersCubit>();

    return ValueListenableBuilder<String?>(
      valueListenable: offersCubit.capturedPath,
      builder: (context, capturedPath, _) {
        return Column(
          children: [
            _ContentCard(
              title: AppStrings.cameraScan,
              subtitle: AppStrings.cameraScanSubtitle,
              actionIcon: Icons.camera_alt_outlined,
              actionLabel: AppStrings.startCamera,
              placeholderIcon: Icons.camera_alt_outlined,
              previewPath: capturedPath,
              onPrimaryAction: () async {
                final path = await Navigator.of(
                  context,
                ).push<String?>(CameraCaptureScreen.route(offersCubit));
                if (path != null) {
                  offersCubit.setCapturedPath(path);
                }
              },
              tips: [
                AppStrings.tipGoodLighting,
                AppStrings.tipHoldSteady,
                AppStrings.tipCaptureWholeDocument,
                AppStrings.tipAvoidShadows,
              ],
            ),
            if (capturedPath != null) ...[
              /*
              // Temporarily disabled for future releases.
              verticalSpace(16.h),
              BlocBuilder<OffersCubit, OffersState>(
                builder: (context, state) {
                  final isLoading = state is OffersLoading;
                  return AppPrimaryButton(
                    icon: Icons.cloud_upload_outlined,
                    label: isLoading
                        ? AppStrings.uploading
                        : AppStrings.confirmAndUpload,
                    isLoading: isLoading,
                    height: 44.h,
                    backgroundColor: AppColors.forestGreen,
                    onPressed: () {
                      final file = File(capturedPath);
                      final fileName = file.path.split('/').last;

                      context.read<OffersCubit>().uploadOfferFile(
                        filePath: capturedPath,
                        fileName: fileName,
                        wareHouseName: wareHouseName,
                      );
                    },
                  );
                },
              ),
              */
            ],
          ],
        );
      },
    );
  }
}

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    required this.title,
    required this.subtitle,
    required this.actionIcon,
    required this.actionLabel,
    required this.placeholderIcon,
    required this.tips,
    this.onPrimaryAction,
    this.previewPath,
  });

  final String title;
  final String subtitle;
  final IconData actionIcon;
  final String actionLabel;
  final IconData placeholderIcon;
  final List<String> tips;
  final VoidCallback? onPrimaryAction;
  final String? previewPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.s14w500),
          verticalSpace(4.h),
          Text(
            subtitle,
            style: AppTextStyles.s12w400.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          verticalSpace(14.h),
          _Placeholder(icon: placeholderIcon, previewPath: previewPath),
          verticalSpace(12.h),
          AppPrimaryButton(
            icon: actionIcon,
            label: actionLabel,
            height: 44.h,
            backgroundColor: AppColors.textPrimary,
            onPressed: onPrimaryAction ?? () {},
          ),
          verticalSpace(16.h),
          Row(
            children: [
              const Text('📸'),
              horizontalSpace(8.w),
              Text(
                AppStrings.tipsForBestResults,
                style: AppTextStyles.s12w400.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          verticalSpace(8.h),
          ...tips.map(
            (t) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Icon(
                      Icons.circle,
                      size: 5.r,
                      color: AppColors.iconMuted,
                    ),
                  ),
                  horizontalSpace(10.w),
                  Expanded(
                    child: Text(
                      t,
                      style: AppTextStyles.s12w400.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.icon, this.previewPath});

  final IconData icon;
  final String? previewPath;

  @override
  Widget build(BuildContext context) {
    final gradientColors = AppColors.isDarkMode
        ? [
            AppColors.surfaceSoft.withValues(alpha: 0.95),
            AppColors.surface.withValues(alpha: 0.98),
          ]
        : [
            AppColors.navSelected.withValues(alpha: 0.16),
            AppColors.navSelected.withValues(alpha: 0.08),
          ];
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: (previewPath != null)
          ? Image.file(
              File(previewPath!),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(
                child: Icon(icon, size: 54.r, color: AppColors.iconMuted),
              ),
            )
          : Center(
              child: Icon(icon, size: 54.r, color: AppColors.iconMuted),
            ),
    );
  }
}
