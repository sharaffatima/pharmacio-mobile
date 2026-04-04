import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_labeled_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/cubits/auth_cubit.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.h,
            children: [
              const Spacer(flex: 2),
              const AppLogoAndAppNameWidget(),
              const Spacer(),
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
                      AppLabeledTextFormField(
                        title: 'User name',
                        controller: cubit.usernameController,
                        hintText: 'Enter your username',
                      ),
                      SizedBox(height: 16.h),
                      AppLabeledTextFormField(
                        title: 'Password',
                        controller: cubit.passwordController,
                        hintText: 'Enter your password',
                        isPassword: true,
                      ),
                      SizedBox(height: 22.h),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          final isLoading = state.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );
                          return AppPrimaryButton(
                            label: 'Log in',
                            isLoading: isLoading,
                            backgroundColor: Colors.black,
                            onPressed: () => cubit.login(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: AppTextStyles.s14w400),
                  GestureDetector(
                    onTap: () => context.pushNamed(Routes.registerScreen),
                    child: Text(
                      'Register',
                      style: AppTextStyles.s14w500.copyWith(
                        color: AppColors.forestGreen,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.forestGreen,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 4),
            ],
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
          width: 105.w,
          height: 65.h,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(36.r),
          ),
        ),
        SizedBox(height: 41.h),
        Text('Pharmacio', style: AppTextStyles.s32w500),
        SizedBox(height: 12.h),
        Text('Pharmacist Portal', style: AppTextStyles.s15w500),
      ],
    );
  }
}
