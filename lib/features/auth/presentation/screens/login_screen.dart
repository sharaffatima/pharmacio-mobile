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
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';

import '../../../../core/constants/images.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            successLogin: (response) {
              context.pushNamedAndRemoveUntil(
                Routes.homeScreen,
                predicate: (route) => false,
              );
            },
            successRegister: (_) {},
            successLogout: (_) {},
            successGetMe: (_) {},
            successChangePassword: (_) {},
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
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AppLogoAndAppNameWidget(),
                      verticalSpace(24.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 27.h,
                        ),
                        width: 358.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: AppColors.surface,
                        ),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLabeledTextFormField(
                                title: AppStrings.userName,
                                controller: cubit.usernameController,
                                hintText: AppStrings.enterUserName,
                              ),
                              verticalSpace(16.h),
                              AppLabeledTextFormField(
                                title: AppStrings.password,
                                controller: cubit.passwordController,
                                hintText: AppStrings.enterPassword,
                                isPassword: true,
                              ),
                              verticalSpace(22.h),
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  final isLoading = state.maybeWhen(
                                    loading: () => true,
                                    orElse: () => false,
                                  );
                                  return AppPrimaryButton(
                                    label: AppStrings.login,
                                    isLoading: isLoading,
                                    backgroundColor: AppColors.forestGreen,
                                    onPressed: () => cubit.login(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.haveNoAccount,
                            style: AppTextStyles.s14w400,
                          ),
                          GestureDetector(
                            onTap: () =>
                                context.pushNamed(Routes.registerScreen),
                            child: Text(
                              AppStrings.register,
                              style: AppTextStyles.s14w500.copyWith(
                                color: AppColors.forestGreen,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.forestGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(12.h),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AppLogoAndAppNameWidget extends StatelessWidget {
  const AppLogoAndAppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 65.h,
          decoration: BoxDecoration(
            color: AppColors.backGroundBody,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Image.asset(AppImages.appLogo, width: 40.w, height: 40.h),
        ),

        verticalSpace(12.h),
        Text(AppStrings.pharmacistPortal, style: AppTextStyles.s15w500),
      ],
    );
  }
}
