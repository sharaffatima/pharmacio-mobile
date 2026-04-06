import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../../core/public_widgets/app_primary_button.dart';
import '../../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../../offers/logic/cubits/offers_cubit.dart';

class UploadTab extends StatelessWidget {
  final String wareHouseName;
  const UploadTab({super.key, required this.wareHouseName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: _UploadContentCard(wareHouseName: wareHouseName),
    );
  }
}

class _UploadContentCard extends StatelessWidget {
  final String wareHouseName;
  const _UploadContentCard({required this.wareHouseName});

  @override
  Widget build(BuildContext context) {
    final offersCubit = context.read<OffersCubit>();

    Future<void> pickFile({required List<String> extensions}) async {
      FilePickerResult? result;
      try {
        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: extensions,
          allowMultiple: true,
          withData: false,
          withReadStream: false,
        );
      } on Error catch (_) {
        if (!context.mounted) return;
        showAppSnackBar(context, message: AppStrings.filePickingNotAvailable);
        return;
      } catch (e) {
        if (!context.mounted) return;
        showAppSnackBar(
          context,
          message: '${AppStrings.failedToPickFilePrefix}$e',
        );
        return;
      }

      if (!context.mounted) return;
      if (result == null || result.files.isEmpty) return;

      offersCubit.addSelectedFiles(result.files);
      showAppSnackBar(
        context,
        message: '${result.files.length}${AppStrings.filesAddedSuffix}',
      );
    }

    Future<void> uploadFiles(List<PlatformFile> selectedFiles) async {
      if (selectedFiles.isEmpty) return;

      for (final file in selectedFiles) {
        if (file.path != null) {
          await context.read<OffersCubit>().uploadOfferFile(
            filePath: file.path!,
            fileName: file.name,
            wareHouseName: wareHouseName,
          );
        }
      }
      offersCubit.clearSelectedFiles();
    }

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
          Text(AppStrings.uploadFile, style: AppTextStyles.s14w500),
          verticalSpace(4.h),
          Text(
            AppStrings.uploadFileSubtitle,
            style: AppTextStyles.s12w400.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          verticalSpace(14.h),
          _UploadOptionCard(
            icon: Icons.image_outlined,
            iconColor: AppColors.bluePrimary,
            title: AppStrings.uploadImage,
            subtitle: AppStrings.imageFormats,
            onTap: () => pickFile(extensions: const ['jpg', 'jpeg', 'png']),
          ),
          verticalSpace(12.h),
          _UploadOptionCard(
            icon: Icons.picture_as_pdf_outlined,
            iconColor: AppColors.redError,
            title: AppStrings.uploadPdf,
            subtitle: AppStrings.pdfDocuments,
            onTap: () => pickFile(extensions: const ['pdf']),
          ),
          verticalSpace(12.h),
          _UploadOptionCard(
            icon: Icons.table_chart_outlined,
            iconColor: AppColors.greenSuccess,
            title: AppStrings.uploadExcel,
            subtitle: AppStrings.spreadsheetFormats,
            onTap: () => pickFile(extensions: const ['xlsx', 'xls', 'csv']),
          ),
          ValueListenableBuilder<List<PlatformFile>>(
            valueListenable: offersCubit.selectedFiles,
            builder: (context, selectedFiles, _) {
              if (selectedFiles.isEmpty) {
                return const SizedBox.shrink();
              }

              return Column(
                children: [
                  verticalSpace(14.h),
                  ...selectedFiles.map(
                    (file) => Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.offWhite,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.border, width: 1),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 18.r,
                              color: AppColors.greenGood,
                            ),
                            horizontalSpace(10.w),
                            Expanded(
                              child: Text(
                                '${AppStrings.selectedPrefix}${file.name}',
                                style: AppTextStyles.s12w400.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 16.r,
                                color: AppColors.redError,
                              ),
                              onPressed: () {
                                offersCubit.removeSelectedFile(file);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(16.h),
                  BlocBuilder<OffersCubit, OffersState>(
                    builder: (context, state) {
                      final isLoading = state is OffersLoading;
                      return AppPrimaryButton(
                        icon: Icons.cloud_upload_outlined,
                        label: isLoading
                            ? AppStrings.uploading
                            : AppStrings.uploadAllFiles,
                        isLoading: isLoading,
                        height: 44.h,
                        backgroundColor: AppColors.forestGreen,
                        onPressed: () => uploadFiles(selectedFiles),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          verticalSpace(16.h),
          Row(
            children: [
              Icon(
                Icons.description_outlined,
                size: 18.r,
                color: AppColors.textSecondary,
              ),
              horizontalSpace(8.w),
              Text(
                AppStrings.supportedFormats,
                style: AppTextStyles.s12w400.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          verticalSpace(10.h),
          _BulletLine(label: AppStrings.images, value: 'JPG, PNG, JPEG'),
          _BulletLine(label: AppStrings.documents, value: 'PDF'),
          _BulletLine(label: AppStrings.spreadsheets, value: 'XLSX, XLS, CSV'),
          verticalSpace(10.h),
          Text(
            AppStrings.maxFileSize,
            style: AppTextStyles.s12w400.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _UploadOptionCard extends StatelessWidget {
  const _UploadOptionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.r),
              ),
              horizontalSpace(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.s12w400.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    verticalSpace(2.h),
                    Text(
                      subtitle,
                      style: AppTextStyles.s12w400.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Icon(Icons.circle, size: 8.r, color: AppColors.iconMuted),
          ),
          horizontalSpace(10.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.s12w400.copyWith(
                  color: AppColors.textSecondary,
                ),
                children: [
                  TextSpan(
                    text: '$label ',
                    style: AppTextStyles.s12w400.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
