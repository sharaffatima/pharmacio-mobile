import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/me/me_response.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: const CustomAppBar(
        title: 'Profile & Settings',
        subtitle: 'Manage your account information',
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            successLogout: (response) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(response.message),
                  backgroundColor: AppColors.greenSuccess,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              );
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (route) => false,
              );
            },
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                  backgroundColor: AppColors.redError,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.forestGreen),
            ),
            successGetMe: (meResponse) =>
                _buildProfileContent(context, meResponse),
            error: (error) => _buildErrorState(context, error),
            orElse: () => const Center(
              child: CircularProgressIndicator(color: AppColors.forestGreen),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60.sp, color: AppColors.redError),
            verticalSpace(16),
            Text(
              error,
              style: AppTextStyles.s14w500,
              textAlign: TextAlign.center,
            ),
            verticalSpace(16),
            AppPrimaryButton(
              label: 'Retry',
              backgroundColor: AppColors.forestGreen,
              width: 140.w,
              onPressed: () => context.read<AuthCubit>().getMe(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, MeResponse meResponse) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Account Information Card
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
                  'Account Information',
                  style: AppTextStyles.accountInformation,
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Container(
                      width: 55.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: AppColors.blue.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.circelBorder),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 35.sp,
                        color: AppColors.blue,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meResponse.username,
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
                            meResponse.roles.isNotEmpty
                                ? meResponse.roles.first
                                : 'User',
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
                  value: meResponse.email.isNotEmpty
                      ? meResponse.email
                      : 'Not provided',
                ),
                DetailRowWidget(
                  icon: Icons.business_center_outlined,
                  label: "Role",
                  value: meResponse.roles.isNotEmpty
                      ? meResponse.roles.join(', ')
                      : 'N/A',
                ),
                DetailRowWidget(
                  icon: Icons.shield_outlined,
                  label: "User ID",
                  value: meResponse.id.toString(),
                ),
                if (meResponse.phoneNumber != null &&
                    meResponse.phoneNumber!.isNotEmpty)
                  DetailRowWidget(
                    icon: Icons.phone_outlined,
                    label: "Phone",
                    value: meResponse.phoneNumber!,
                  ),
              ],
            ),
          ),

          // App Information Card
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
                const AppInformation(label: "Version", value: "1.0.0"),
                const AppInformation(
                  label: "Last Updated",
                  value: "Feb 3, 2026",
                ),
              ],
            ),
          ),

          verticalSpace(13),

          // Change Password Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: AppPrimaryButton(
              label: 'Change Password',
              icon: Icons.lock_outline,
              backgroundColor: AppColors.forestGreen,
              height: 29.h,
              onPressed: () => context.pushNamed(Routes.changePasswordScreen),
            ),
          ),

          verticalSpace(10),

          // Logout Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );
                return AppPrimaryButton(
                  label: isLoading ? 'Logging out...' : 'Logout',
                  icon: isLoading ? null : Icons.logout,
                  isLoading: isLoading,
                  backgroundColor: const Color(0xFFD34343),
                  height: 29.h,
                  onPressed: () => _showLogoutDialog(context),
                );
              },
            ),
          ),

          verticalSpace(20),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthCubit>().logout();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Color(0xFFD34343)),
            ),
          ),
        ],
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
