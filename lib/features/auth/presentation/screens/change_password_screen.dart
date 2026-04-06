import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_labeled_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.changePasswordTitle,
        subtitle: AppStrings.changePasswordSubtitle,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            successLogin: (_) {},
            successRegister: (_) {},
            successLogout: (_) {},
            successGetMe: (_) {},
            successChangePassword: (response) {
              showAppSnackBar(
                context,
                message: response.message,
                backgroundColor: AppColors.greenSuccess,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
              context.pop();
            },
            error: (error) {
              showAppSnackBar(
                context,
                message: error,
                backgroundColor: AppColors.redError,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.border, width: 1),
              ),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.updatePassword,
                      style: AppTextStyles.accountInformation,
                    ),
                    verticalSpace(8.h),
                    Text(
                      AppStrings.passwordUpdateHint,
                      style: AppTextStyles.s12w400.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    verticalSpace(24.h),
                    AppLabeledTextFormField(
                      title: AppStrings.currentPassword,
                      controller: cubit.oldPasswordController,
                      hintText: AppStrings.enterCurrentPassword,
                      isPassword: true,
                    ),
                    verticalSpace(16.h),
                    AppLabeledTextFormField(
                      title: AppStrings.newPassword,
                      controller: cubit.newPasswordController,
                      hintText: AppStrings.enterNewPassword,
                      isPassword: true,
                    ),
                    verticalSpace(16.h),
                    AppLabeledTextFormField(
                      title: AppStrings.confirmNewPassword,
                      controller: cubit.confirmNewPasswordController,
                      hintText: AppStrings.reEnterNewPassword,
                      isPassword: true,
                    ),
                    verticalSpace(24.h),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return AppPrimaryButton(
                          label: AppStrings.changePasswordTitle,
                          isLoading: isLoading,
                          backgroundColor: AppColors.forestGreen,
                          onPressed: () => cubit.changePassword(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
