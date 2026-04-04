import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';

class AppLabeledTextFormField extends StatelessWidget {
  const AppLabeledTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.hintText = '',
    this.isPassword = false,
    this.keyboardType,
    this.validator,
  });

  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.s14w500),
        SizedBox(height: 5.h),
        Container(
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
            keyboardType: keyboardType,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: AppTextStyles.s14w500.copyWith(
                color: const Color(0xff8A8080),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
