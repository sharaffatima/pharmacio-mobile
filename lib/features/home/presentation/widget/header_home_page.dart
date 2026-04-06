import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';

class HeaderHomePagewidget extends StatelessWidget {
  const HeaderHomePagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      // height: MediaQuery.sizeOf(context).height * 0.2,
      decoration: BoxDecoration(
        color: AppColors.appBarBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(25.h),
          Text(
            AppStrings.welcomeBack,
            style: AppTextStyles.s20w700.copyWith(color: AppColors.white),
          ),

          verticalSpace(11.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.forestGreen.withValues(alpha: 0.78),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              AppStrings.pharmacist,
              style: AppTextStyles.s12w400.copyWith(
                color: AppColors.white,
                fontSize: 10,
              ),
            ),
          ),
          verticalSpace(25.h),
        ],
      ),
    );
  }
}
