import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';

class AppLabeledTextFormField extends StatefulWidget {
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
  State<AppLabeledTextFormField> createState() =>
      _AppLabeledTextFormFieldState();
}

class _AppLabeledTextFormFieldState extends State<AppLabeledTextFormField> {
  late bool _obscurePassword;

  @override
  void initState() {
    super.initState();
    _obscurePassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: AppTextStyles.s14w500),
        SizedBox(height: 5.h),
        Container(
          height: 36.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceSoft,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: TextFormField(
            style: AppTextStyles.s14w500,
            cursorColor: AppColors.forestGreen,
            controller: widget.controller,
            obscureText: _obscurePassword,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: AppTextStyles.s14w500.copyWith(
                color: AppColors.textSecondary,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.textSecondary,
                        size: 20.r,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
