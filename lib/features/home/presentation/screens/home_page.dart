import 'package:flutter/material.dart';
// import 'package:flutter_application_pharmecy/core/style/app_text_style.dart';
// import 'package:flutter_application_pharmecy/core/theme/colors/app_colors.dart';
// import 'package:flutter_application_pharmecy/features/auth/data/enum/enum_type_action.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/dash_board_widget.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/header_home_page.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/recent_activity_show_widget.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/widget/scan_and_uploading_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      body: Column(
        children: [
          HeaderHomePagewidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScanAndUploadFileSectionWidget(),
                  verticalSpace(18.h),
                  DashBourdWidget(),
                  verticalSpace(18.h),
                  RecentActivityShowWidget(),
                  verticalSpace(18.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
