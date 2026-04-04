import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
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
                      TitleAndInputWidget(
                        title: 'User name',
                        controller: cubit.usernameController,
                        hintText: 'Enter your username',
                      ),
                      SizedBox(height: 16.h),
                      TitleAndInputWidget(
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
                          return CustomElevatedButton(
                            colorButton: Colors.black,
                            textButton: Colors.white,
                            label: 'Log in',
                            isLoading: isLoading,
                            onTap: () => cubit.login(),
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
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.s14w400,
                  ),
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

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.wid,
    this.height,
    required this.textButton,
    required this.colorButton,
    required this.onTap,
    this.label = 'Log in',
    this.isLoading = false,
  });
  final double? wid;
  final double? height;
  final Color textButton;
  final Color colorButton;
  final VoidCallback onTap;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wid ?? double.infinity,
      height: height ?? 35.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          disabledBackgroundColor: colorButton.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: textButton,
                ),
              )
            : Text(
                label,
                style: AppTextStyles.s15w500.copyWith(color: textButton),
              ),
      ),
    );
  }
}

class TitleAndInputWidget extends StatelessWidget {
  const TitleAndInputWidget({
    super.key,
    required this.controller,
    required this.title,
    this.hintText = '',
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.s14w500),
        SizedBox(height: 5.h),
        CustomInputTextForm(
          controller: controller,
          hintText: hintText,
          isPassword: isPassword,
        ),
      ],
    );
  }
}

class CustomInputTextForm extends StatelessWidget {
  const CustomInputTextForm({
    super.key,
    required this.controller,
    this.hintText = '',
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xfff3f3f3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        cursorColor: Colors.green,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: AppTextStyles.s14w500.copyWith(
            color: const Color(0xff8A8080),
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
