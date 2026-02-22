

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/home_page.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/row_Action_widget.dart';

class recentActivityShowWidget extends StatelessWidget {
  const recentActivityShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 242.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 27.h),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(
        //   // color: const Color.fromARGB(81, 158, 158, 158),
        // ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Activity', style: AppTextStyles.s14w400),
          SizedBox(height: 12.h),
          Column(
            children: [
              RowActionWidget(
                title: 'New proposal generated',
                dataTime: '12 hour',
                type: EnumTypeAction.proposal,
              ),
              RowActionWidget(
                title: 'New proposal generated',
                dataTime: '12 hour',
                type: EnumTypeAction.alert,
              ),
              RowActionWidget(
                title: 'New proposal generated',
                dataTime: '12 hour',
                type: EnumTypeAction.inventory,
              ),
            ],
          ),
        ],
      ),
    );
  }
}