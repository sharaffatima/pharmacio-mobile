import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../../core/public_widgets/app_primary_button.dart';
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'File picking is not available on this platform/build.',
            ),
          ),
        );
        return;
      } catch (e) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to pick file: $e')));
        return;
      }

      if (!context.mounted) return;
      if (result == null || result.files.isEmpty) return;

      offersCubit.addSelectedFiles(result.files);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${result.files.length} files added')),
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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upload File', style: AppTextStyles.s14w500),
          SizedBox(height: 4.h),
          Text(
            'Upload PDF, Excel, or Image files',
            style: AppTextStyles.s12w400.copyWith(
              color: const Color(0xFF6A6A6A),
            ),
          ),
          SizedBox(height: 14.h),
          _UploadOptionCard(
            icon: Icons.image_outlined,
            iconColor: const Color(0xFF2B66FF),
            title: 'Upload Image',
            subtitle: 'JPG, PNG, etc.',
            onTap: () => pickFile(extensions: const ['jpg', 'jpeg', 'png']),
          ),
          SizedBox(height: 12.h),
          _UploadOptionCard(
            icon: Icons.picture_as_pdf_outlined,
            iconColor: const Color(0xFFE53935),
            title: 'Upload PDF',
            subtitle: 'PDF documents',
            onTap: () => pickFile(extensions: const ['pdf']),
          ),
          SizedBox(height: 12.h),
          _UploadOptionCard(
            icon: Icons.table_chart_outlined,
            iconColor: const Color(0xFF0F9D58),
            title: 'Upload Excel',
            subtitle: 'XLSX, XLS, CSV',
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
                  SizedBox(height: 14.h),
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
                          border: Border.all(
                            color: const Color(0xFFE3E3E3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 18.r,
                              color: AppColors.greenGood,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                'Selected: ${file.name}',
                                style: AppTextStyles.s12w400.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF4E4E4E),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 16.r,
                                color: Colors.red,
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
                  SizedBox(height: 16.h),
                  BlocBuilder<OffersCubit, OffersState>(
                    builder: (context, state) {
                      final isLoading = state is OffersLoading;
                      return AppPrimaryButton(
                        icon: Icons.cloud_upload_outlined,
                        label: isLoading ? 'Uploading...' : 'Upload All Files',
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
          SizedBox(height: 16.h),
          Row(
            children: [
              Icon(
                Icons.description_outlined,
                size: 18.r,
                color: const Color(0xFF6A6A6A),
              ),
              SizedBox(width: 8.w),
              Text(
                'Supported formats:',
                style: AppTextStyles.s12w400.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF4E4E4E),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          _BulletLine(label: 'Images:', value: 'JPG, PNG, JPEG'),
          _BulletLine(label: 'Documents:', value: 'PDF'),
          _BulletLine(label: 'Spreadsheets:', value: 'XLSX, XLS, CSV'),
          SizedBox(height: 10.h),
          Text(
            'Maximum file size: 10 MB',
            style: AppTextStyles.s12w400.copyWith(
              color: const Color(0xFF4E4E4E),
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
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xFFE3E3E3), width: 1),
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
              SizedBox(width: 12.w),
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
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: AppTextStyles.s12w400.copyWith(
                        color: const Color(0xFF6A6A6A),
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
            child: Icon(
              Icons.circle,
              size: 8.r,
              color: const Color(0xFF6A6A6A),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.s12w400.copyWith(
                  color: const Color(0xFF6A6A6A),
                ),
                children: [
                  TextSpan(
                    text: '$label ',
                    style: AppTextStyles.s12w400.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF6A6A6A),
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
