import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/logic/cubits/language_cubit.dart';
import 'package:pharmacio_flutter_mobile/core/logic/cubits/theme_cubit.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/me/me_response.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: AppStrings.profileTitle,
        subtitle: AppStrings.profileSubTitle,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            successLogout: (response) {
              showAppSnackBar(
                context,
                message: response.message,
                backgroundColor: AppColors.greenSuccess,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (route) => false,
              );
            },
            error: (error) {
              showAppSnackBar(
                context,
                message: error,
                backgroundColor: AppColors.danger,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const LoadingWidget(),
            successGetMe: (meResponse) =>
                _buildProfileContent(context, meResponse),
            error: (error) => _buildErrorState(context, error),
            orElse: () => const LoadingWidget(),
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
            RetryWidget(onPressed: () => context.read<AuthCubit>().getMe()),
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
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.border, width: 1),
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
                        color: AppColors.navSelected.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 35.sp,
                        color: AppColors.navSelected,
                      ),
                    ),
                    horizontalSpace(12.w),
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
                            color: AppColors.forestGreen,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            meResponse.roles.isNotEmpty
                                ? meResponse.roles.first
                                : AppStrings.user,
                            style: AppTextStyles.userType,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(17),
                Divider(color: AppColors.border),
                verticalSpace(14),
                DetailRowWidget(
                  icon: Icons.email_outlined,
                  label: AppStrings.email,
                  value: meResponse.email.isNotEmpty
                      ? meResponse.email
                      : AppStrings.notProvided,
                ),
                DetailRowWidget(
                  icon: Icons.business_center_outlined,
                  label: AppStrings.role,
                  value: meResponse.roles.isNotEmpty
                      ? meResponse.roles.join(', ')
                      : AppStrings.notAvailable,
                ),
                DetailRowWidget(
                  icon: Icons.shield_outlined,
                  label: AppStrings.userId,
                  value: meResponse.id.toString(),
                ),
                if (meResponse.phoneNumber != null &&
                    meResponse.phoneNumber!.isNotEmpty)
                  DetailRowWidget(
                    icon: Icons.phone_outlined,
                    label: AppStrings.phone,
                    value: meResponse.phoneNumber!,
                  ),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.settingsTitle,
                  style: AppTextStyles.accountInformation,
                ),
                verticalSpace(8),
                BlocBuilder<LanguageCubit, String>(
                  builder: (context, currentLanguage) {
                    return SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        AppStrings.language,
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: Text(
                        currentLanguage == 'ar'
                            ? AppStrings.arabic
                            : AppStrings.english,
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      value: currentLanguage == 'ar',
                      onChanged: (_) {
                        context.read<LanguageCubit>().toggleLanguage();
                      },
                    );
                  },
                ),
                BlocBuilder<ThemeCubit, bool>(
                  builder: (context, isDarkMode) {
                    return SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        AppStrings.themeMode,
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                      subtitle: Text(
                        isDarkMode ? AppStrings.on : AppStrings.off,
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      value: isDarkMode,
                      onChanged: (_) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          verticalSpace(13),

          // App Information Card
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.appInformation,
                  style: AppTextStyles.accountInformation,
                ),
                verticalSpace(16),
                AppInformation(
                  label: AppStrings.version,
                  value: AppStrings.appVersionValue,
                ),
                AppInformation(
                  label: AppStrings.profileLastUpdated,
                  value: AppStrings.profileLastUpdatedValue,
                ),
              ],
            ),
          ),

          verticalSpace(13),

          // Change Password Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: AppPrimaryButton(
              label: AppStrings.changePassword,
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
                  label: isLoading
                      ? AppStrings.logoutLoading
                      : AppStrings.logout,
                  icon: isLoading ? null : Icons.logout,
                  isLoading: isLoading,
                  backgroundColor: AppColors.danger,
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
        backgroundColor: AppColors.surface,
        title: Text(
          AppStrings.logoutConfirmTitle,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          AppStrings.logoutConfirmMessage,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              AppStrings.cancel,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthCubit>().logout();
            },
            child: Text(
              AppStrings.logout,
              style: TextStyle(color: AppColors.danger),
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
          Icon(icon, color: AppColors.textSecondary, size: 20.sp),
          horizontalSpace(12.w),
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
            style: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
