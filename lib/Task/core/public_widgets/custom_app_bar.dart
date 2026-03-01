import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const CustomAppBar({super.key, required this.title, required this.subtitle});

  @override
  Size get preferredSize => Size.fromHeight(132.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 132.h,
      backgroundColor: AppColors.backGroundAppBar,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.r)),
      ),
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.appBar,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: AppTextStyles.descriptionAppbar,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
