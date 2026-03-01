

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';

class headerHomePagewidget extends StatelessWidget {
  const headerHomePagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      // height: MediaQuery.sizeOf(context).height * 0.2,
      decoration: BoxDecoration(
        color: Color(0xff24A448),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          Text(
            'Welcome Back!',
            style: AppTextStyles.s20w600.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'john pharmacist',
            style: AppTextStyles.s12w400.copyWith(color: Color(0xfff7f7f7)),
          ),
          SizedBox(height: 11.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xff0A932A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'pharmacist',
              style: AppTextStyles.s12w400.copyWith(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
