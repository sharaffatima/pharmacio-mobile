import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/card_quick_action_widget.dart';

class ScanAndUploadFileSectionWidget extends StatelessWidget {
  const ScanAndUploadFileSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: 242.h,
      // width: 368.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 27.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.quickActions, style: AppTextStyles.s14w500),
            Text(
              AppStrings.quickActionsSubtitle,
              style: AppTextStyles.s12w400.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            verticalSpace(16.h),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: [
                /*
                // Temporarily disabled for future releases.
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48.w - 12.w) / 2,
                  child: CardQuickActionswidget(
                    title: AppStrings.scanCamera,
                    icon: Icons.camera_alt_outlined,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.scanScreen,
                      arguments: 0,
                    ),
                  ),
                ),
                */
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48.w - 12.w) / 2,
                  child: CardQuickActionswidget(
                    title: AppStrings.uploadFile,
                    icon: Icons.file_upload_outlined,
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.scanScreen,
                      arguments: 0,
                    ),
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48.w - 12.w) / 2,
                  child: CardQuickActionswidget(
                    title: AppStrings.recordSale,
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
