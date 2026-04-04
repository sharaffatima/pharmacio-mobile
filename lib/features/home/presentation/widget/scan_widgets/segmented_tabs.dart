import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_style.dart';

class SegmentedTabs extends StatelessWidget {
  const SegmentedTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(999),
      ),
      child: TabBar(
        dividerHeight: 0,
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(999),
        ),
        labelColor: AppColors.black,
        unselectedLabelColor: const Color(0xFF5A5A5A),
        labelStyle: AppTextStyles.s12w400.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: AppTextStyles.s12w400.copyWith(
          fontWeight: FontWeight.w600,
        ),
        tabs: const [
          Tab(
            icon: Icon(Icons.camera_alt_outlined, size: 18),
            text: 'Camera Scan',
          ),
          Tab(
            icon: Icon(Icons.file_upload_outlined, size: 18),
            text: 'Upload File',
          ),
        ],
      ),
    );
  }
}
