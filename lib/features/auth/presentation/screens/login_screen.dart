import 'package:flutter/material.dart';
// import 'package:flutter_application_pharmecy/core/style/app_text_style.dart';
// import 'package:flutter_application_pharmecy/core/theme/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
// import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primaryColors,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10.h,
          children: [
            Spacer(flex: 2),
            appLogoAndAppNameWidget(),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 27.h),
              width: 358.w,
              // height: 242.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndInputWidget(
                      title: 'User name',
                      controller: userNameController,
                    ),
                    SizedBox(height: 16.h),
                    TitleAndInputWidget(
                      title: 'password',
                      controller: password,
                    ),
                    SizedBox(height: 22.h),
                    CustomElevatedButtom(colorButton: Colors.black,textButton: Colors.white,onTap: (){},),
                  ],
                ),
              ),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButtom extends StatelessWidget {
  const CustomElevatedButtom({super.key, this.wid, this.height, required this.textButton, required this.colorButton, required this.onTap});
  final double? wid;
  final double? height;
  final Color textButton;
  final Color colorButton;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:wid?? double.infinity,
      height:height?? 35.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'log in',
          style: AppTextStyles.s16w500.copyWith(color: colorButton),
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
  });

  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.s14w500),
        SizedBox(height: 5.h),
        CustominputTextForm(controller: controller),
      ],
    );
  }
}

class CustominputTextForm extends StatelessWidget {
  const CustominputTextForm({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff3f3f3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        cursorColor: Colors.green,
        controller: controller,
        decoration: InputDecoration(
          hint: Text(
            'Enter your password',
            style: AppTextStyles.s14w500.copyWith(color: Color(0xff8A8080)),
          ),
        ),
      ),
    );
  }
}

class appLogoAndAppNameWidget extends StatelessWidget {
  const appLogoAndAppNameWidget({super.key});

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
        Text(
          'Pharmacio',
          style: AppTextStyles.s20w600.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 32.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Text('Pharmacist Portal', style: AppTextStyles.s16w500),
      ],
    );
  }
}
