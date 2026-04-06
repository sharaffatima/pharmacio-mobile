import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';

class RetryWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const RetryWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppPrimaryButton(
      label: AppStrings.retry,
      backgroundColor: AppColors.appBarBackground,
      width: 140.w,
      onPressed: onPressed,
    );
  }
}
