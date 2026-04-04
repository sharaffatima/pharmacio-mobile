import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 180.h,
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
                'Recent Uploads',
                style: AppTextStyles.s14w500.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${uploads.length} items',
                style: AppTextStyles.s12w400.copyWith(color: AppColors.gray),
              ),
            ],
          ),
          SizedBox(height: 12.h),
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
                    border: Border.all(color: const Color(0xFFE9E9E9)),
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
                      SizedBox(height: 4.h),
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
                            'Check Status',
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
