
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/home_page.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/card_quick_action_widget.dart';

class scanAndUploadFileSectionWidget extends StatelessWidget {
  const scanAndUploadFileSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 242.h,
      width: 368.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 27.h),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: const Color.fromARGB(81, 158, 158, 158)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Actions', style: AppTextStyles.s14w500),
          Text(
            'Fast scan or upload offers',
            style: AppTextStyles.s12w400.copyWith(
              color: const Color(0xff4e4e4e),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: cardQuickActionswidget(
                  title: 'scan carema',
                  icon: Icons.camera_alt_outlined,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: cardQuickActionswidget(
                  title: 'upload File',
                  icon: Icons.file_upload_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
