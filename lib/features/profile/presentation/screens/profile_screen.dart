import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/space_helpers.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.profileTitle,
        subtitle: AppStrings.profileSubTitle,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.circelBorder, width: 1),
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
                          border: Border.all(color: AppColors.circelBorder),
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
                            AppStrings.userName,
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
                              AppStrings.userType,
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
                    value: "pharmacist@pharmacy.com",
                  ),
                  DetailRowWidget(
                    icon: Icons.business_center_outlined,
                    label: "Role",
                    value: "pharmacist",
                  ),
                  DetailRowWidget(
                    icon: Icons.shield_outlined,
                    label: "User ID",
                    value: "2",
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
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
                  AppInformation(label: "Version", value: "1.0.0"),
                  AppInformation(label: "Last Updated", value: "Feb 3, 2026"),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
