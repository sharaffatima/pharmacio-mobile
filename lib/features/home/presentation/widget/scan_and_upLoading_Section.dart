import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/card_quick_action_widget.dart';

class scanAndUploadFileSectionWidget extends StatelessWidget {
  const scanAndUploadFileSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: 242.h,
      // width: 368.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 27.h),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: const Color.fromARGB(81, 158, 158, 158)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
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
            verticalSpace(16.h),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48.w - 12.w) / 2,
                  child: cardQuickActionswidget(
                    title: 'Scan Camera',
                    icon: Icons.camera_alt_outlined,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.scanScreen,
                      arguments: 0,
                    ),
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48.w - 12.w) / 2,
                  child: cardQuickActionswidget(
                    title: 'Upload File',
                    icon: Icons.file_upload_outlined,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.scanScreen,
                      arguments: 1,
                    ),
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48.w - 12.w) / 2,
                  child: cardQuickActionswidget(
                    title: 'Record Sale',
                    icon: Icons.point_of_sale_outlined,
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.saleScreen),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
