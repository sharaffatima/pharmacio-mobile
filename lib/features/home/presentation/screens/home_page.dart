import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_application_pharmecy/core/style/app_text_style.dart';
// import 'package:flutter_application_pharmecy/core/theme/colors/app_colors.dart';
// import 'package:flutter_application_pharmecy/features/auth/data/enum/enum_type_action.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/fonts_weight.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';

// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/features/home/logic/cubits/home_cubit.dart';
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
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final homeCubit = context.read<HomeCubit>();
                  final stats = homeCubit.dashboardStats;
                  final recentActivities = homeCubit.recentActivities;

                  final isLoading = state is HomeLoading;
                  final errorMessage = state.maybeWhen(
                    error: (error, _, __) => error,
                    orElse: () => null,
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // OverviewFinancialReportWidget(),

                      ScanAndUploadFileSectionWidget(),
                      verticalSpace(18.h),
                      DashBourdWidget(
                        dashboardStats: stats,
                        isLoading: isLoading && stats == null,
                      ),
                      verticalSpace(18.h),
                      RecentActivityShowWidget(
                        recentActivities: recentActivities,
                        isLoading: isLoading && recentActivities.isEmpty,
                        errorMessage: errorMessage,
                        onRetry: () => homeCubit.loadHomeDashboard(),
                      ),
                      verticalSpace(18.h),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class OverviewFinancialReportWidget extends StatelessWidget {
  const OverviewFinancialReportWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 18,
      ),
      margin: EdgeInsets.only(bottom: 12.h),
      width: double.infinity,
      height: 500.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: AppTextStyles.valueProfile
                        .copyWith(
                          fontWeight: AppFontWeight.medium,
                        ),
                  ),
                  Text(
                    'Financial Report',
                    style: AppTextStyles.appBar.copyWith(
                      fontWeight: AppFontWeight.semiBold,
                      color: AppColors.greenTextColors,
                    ),
                  ),
                ],
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(Icons.bar_chart_rounded),
              ),
            ],
          ),
          verticalSpace(24.h),
          Text(
            'new profit',
            style: AppTextStyles.valueProfile.copyWith(
              fontWeight: AppFontWeight.medium,
            ),
          ),
          Text(
            '12,450.00 SYR',
            style: AppTextStyles.s36w500.copyWith(
              color: AppColors.greenTextColors,
            ),
          ),
          verticalSpace(24.h),
          Text(
            'Top Expense Categories',
            style: AppTextStyles.valueProfile.copyWith(
              fontWeight: AppFontWeight.medium,
            ),
          ),


        ],
      ),
    );
  }
}
