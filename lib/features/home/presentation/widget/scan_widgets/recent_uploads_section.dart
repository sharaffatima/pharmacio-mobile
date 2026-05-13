import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';
import '../../../../offers/data/models/upload_offer_response.dart';

class RecentUploadsSection extends StatelessWidget {
  final List<UploadOfferResponse> uploads;
  final Function(String) onCheckStatus;

  const RecentUploadsSection({
    super.key,
    required this.uploads,
    required this.onCheckStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.recentUploads,
                style: AppTextStyles.s14w500.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${uploads.length} ${AppStrings.itemsCountSuffix}',
                style: AppTextStyles.s12w400.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          verticalSpace(12.h),
          Expanded(
            child: ListView.builder(
              itemCount: uploads.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final upload = uploads[index];
                return Container(
                  width: 220.w,
                  margin: EdgeInsets.only(right: 12.w),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        upload.originalFilename,
                        style: AppTextStyles.s12w400.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(4.h),
                      Row(
                        children: [
                          _StatusBadge(status: upload.status),
                          const Spacer(),
                          Text(
                            upload.createdAt.split('T').first,
                            style: AppTextStyles.s10w200,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 30.h,
                        child: OutlinedButton(
                          onPressed: () => onCheckStatus(upload.uploadId),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.forestGreen,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            AppStrings.checkStatus,
                            style: AppTextStyles.s10w200.copyWith(
                              color: AppColors.forestGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case 'uploaded':
        color = AppColors.bluePrimary;
        break;
      case 'failed':
        color = AppColors.redError;
        break;
      case 'processing':
        color = AppColors.orangeWarning;
        break;
      default:
        color = AppColors.greenGood;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppTextStyles.s10w200.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProcessingStatusCard extends StatefulWidget {
  const ProcessingStatusCard({super.key});

  @override
  State<ProcessingStatusCard> createState() => _ProcessingStatusCardState();
}

class _ProcessingStatusCardState extends State<ProcessingStatusCard>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  late AnimationController _spinController;

  final List<Map<String, dynamic>> _steps = [
    {'label': 'Uploading file...', 'status': 'done'},
    {'label': 'Processing document...', 'status': 'active'},
    {'label': 'Processing complete!', 'status': 'pending'},
  ];

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    // Simulate progress
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 80));
      if (!mounted) return false;
      setState(() => _progress += 0.01);
      return _progress < 1.0;
    });
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // // Title
            // const Text(
            //   'Processing Status',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            // ),
            // const SizedBox(height: 16),

            // Spinner + label
            Row(
              children: [
                // RotationTransition(
                //   turns: _spinController,
                //   child: SizedBox(
                //     width: 24,
                //     height: 24,
                //     child: CircularProgressIndicator(
                //       strokeWidth: 2.5,

                //       valueColor: AlwaysStoppedAnimation<Color>(
                //         Colors.blue.shade400,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(width: 10),
                // const Text(
                //   'Processing document...',
                //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                // ),
              ],
            ),
            const SizedBox(height: 4),

            // Padding(
            //   padding: const EdgeInsets.only(left: 34),
            //   child: Text(
            //     'Please wait...',
            //     style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            //   ),
            // ),
            // const SizedBox(height: 12),

            // Progress bar
            // LinearProgressIndicator(
            //   value: _progress,
            //   backgroundColor: Colors.grey.shade200,
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade400),
            //   borderRadius: BorderRadius.circular(4),
            //   minHeight: 6,
            // ),
            const SizedBox(height: 12),

            // Steps
            ..._steps.asMap().entries.map((entry) {
              final index = entry.key + 1;
              final step = entry.value;
              return _buildStep(index, step['label'], step['status']);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int number, String label, String status) {
    Widget icon;
    Color labelColor;

    switch (status) {
      case 'done':
        icon = Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, size: 14, color: Colors.white),
        );
        labelColor = Colors.grey.shade500;
        break;
      case 'active':
        icon = Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.blue.shade400,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
        labelColor = Colors.black87;
        break;
      default:
        icon = Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
            ),
          ),
        );
        labelColor = Colors.grey.shade400;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: labelColor,
              fontWeight: status == 'active'
                  ? FontWeight.w500
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
