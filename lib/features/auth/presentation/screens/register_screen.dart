import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_labeled_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/auth/presentation/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            successLogin: (_) {},
            successRegister: (response) {
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
            successLogout: (_) {},
            successGetMe: (_) {},
            successChangePassword: (_) {},
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              verticalSpace(50.h),
              const AppLogoAndAppNameWidget(),
              verticalSpace(30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 27.h),
                width: 358.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                ),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create Account', style: AppTextStyles.s20w700),
                      verticalSpace(16.h),
                      AppLabeledTextFormField(
                        title: 'User name',
                        controller: cubit.usernameController,
                        hintText: 'Enter your username',
                      ),
                      verticalSpace(16.h),
                      AppLabeledTextFormField(
                        title: 'Password',
                        controller: cubit.passwordController,
                        hintText: 'Enter your password',
                        isPassword: true,
                      ),
                      verticalSpace(16.h),
                      AppLabeledTextFormField(
                        title: 'Confirm Password',
                        controller: cubit.confirmPasswordController,
                        hintText: 'Re-enter your password',
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
                            label: 'Register',
                            isLoading: isLoading,
                            backgroundColor: AppColors.forestGreen,
                            onPressed: () => cubit.register(),
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
                    'Already have an account? ',
                    style: AppTextStyles.s14w400,
                  ),
                  GestureDetector(
                    onTap: () => context.pushNamedAndRemoveUntil(
                      Routes.loginScreen,
                      predicate: (route) => false,
                    ),
                    child: Text(
                      'Login',
                      style: AppTextStyles.s14w500.copyWith(
                        color: AppColors.forestGreen,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.forestGreen,
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(50.h),
            ],
          ),
        ),
      ),
    );
  }
}
