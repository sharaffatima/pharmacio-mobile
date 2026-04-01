import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/features/profile/data/repos/profile_repo.dart';
import 'package:pharmacio_flutter_mobile/features/profile/logic/cubits/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(getIt<ProfileRepo>())
        ..getProfile(
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzc1MTI1MzE5LCJpYXQiOjE3NzUwMzg5MTksImp0aSI6Ijc5MjYyYWNlYmRlZjQ2ZWRiN2RjOTBhNjJkYTZjYzFlIiwidXNlcl9pZCI6IjEifQ.jTuZa9lFWAQs0HWeSaJblpOZshEvwS6YCn5hSp8K-sA",
        ),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.profileTitle,
        subtitle: AppStrings.profileSubTitle,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (errMessage) => Center(child: Text(errMessage)),
            success: (profile) => SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 15.h,
                    ),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.whiteLaight,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.circelBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.accountInformation,
                          style: AppTextStyles.accountInformation,
                        ),
                        verticalSpace(16),
                        Row(
                          children: [
                            Container(
                              width: 55.w,
                              height: 55.h,
                              decoration: BoxDecoration(
                                color: AppColors.blue.withOpacity(0.2),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.circelBorder,
                                ),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 35.sp,
                                color: AppColors.blue,
                              ),
                            ),
                            horizontalSpace(12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profile.username,
                                  style: AppTextStyles.userName,
                                ),
                                verticalSpace(4),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    profile.roles.isNotEmpty
                                        ? profile.roles.first.toString()
                                        : AppStrings.userType,
                                    style: AppTextStyles.userType,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        verticalSpace(17),
                        const Divider(color: AppColors.circelBorder),
                        verticalSpace(14),
                        DetailRowWidget(
                          icon: Icons.email_outlined,
                          label: "Email",
                          value: profile.email,
                        ),
                        DetailRowWidget(
                          icon: Icons.business_center_outlined,
                          label: "Role",
                          value: profile.roles.isNotEmpty
                              ? profile.roles.first.toString()
                              : '-',
                        ),
                        DetailRowWidget(
                          icon: Icons.shield_outlined,
                          label: "User ID",
                          value: profile.id.toString(),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.whiteLaight,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.circelBorder),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "App Information",
                          style: AppTextStyles.accountInformation,
                        ),
                        verticalSpace(16),
                        // const AppInformation(label: "Version", value: "1.0.0"),
                        AppInformation(
                          label: "Last Updated",
                          value: profile.dateJoined.substring(0, 10),
                        ),
                      ],
                    ),
                  ),

                  verticalSpace(13),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.logout, size: 20.sp),
                      label: const Text("Logout"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD34343),
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 29.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailRowWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const DetailRowWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 20.sp),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.labelProfile),
              Text(value, style: AppTextStyles.valueProfile),
            ],
          ),
        ],
      ),
    );
  }
}

class AppInformation extends StatelessWidget {
  final String label;
  final String value;

  const AppInformation({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: AppColors.isDark ? AppColors.white : AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
