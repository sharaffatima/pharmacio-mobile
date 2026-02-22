import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';

class CardDashBourdWidget extends StatelessWidget {
  const CardDashBourdWidget({
    super.key,
    required this.type,
    required this.title,
    required this.value,
  });
  final EnumTypeAction type;
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      // height: 88.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.s12w400.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w200,
              color: Color(0xff4e4e4e),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$value',
                style: AppTextStyles.s14w600.copyWith(color: _setColorsIcons()),
              ),
              Icon(_setIcons(), color: _setColorsIcons(), size: 20.sp),
            ],
          ),
        ],
      ),
    );
  }

  Color? _setColorsIcons() {
    switch (type) {
      case EnumTypeAction.proposal:
        return Colors.blue;

      case EnumTypeAction.alert:
        return Colors.red;

      case EnumTypeAction.inventory:
        return Colors.green;

      case EnumTypeAction.stock:
        return Colors.red;
    }
  }

  IconData? _setIcons() {
    switch (type) {
      case EnumTypeAction.proposal:
        return Icons.insert_drive_file_rounded;
      case EnumTypeAction.alert:
        return Icons.trending_down_rounded;
      case EnumTypeAction.inventory:
        return Icons.inventory_2_outlined;
      case EnumTypeAction.stock:
        return Icons.warning_amber_rounded;
    }
  }
}