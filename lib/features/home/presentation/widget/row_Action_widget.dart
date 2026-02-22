import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_styles.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';

class RowActionWidget extends StatelessWidget {
  const RowActionWidget({
    super.key,
    required this.title,
    required this.dataTime,
    required this.type,
  });
  final String title;
  final String dataTime;
  final EnumTypeAction type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: _SetColorsBack(),
              // color: const Color.fromARGB(67, 68, 137, 255),
            ),
            child: Icon(_setIcons(), color: _setColorsIcons(), size: 16),
          ),
          SizedBox(width: 10.w,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(title, style: AppTextStyles.s12w400),
             Text(
          '$dataTime ',
          style: AppTextStyles.s12w400.copyWith(
            color: const Color.fromARGB(191, 78, 78, 78),
            fontSize: 10,
            fontWeight: FontWeight.w200
          ),)
          ],)
        ],
      ),
    );
    // return ListTile(
    //   titleAlignment: ListTileTitleAlignment.center,
    //   // isThreeLine: true,
    //   leading: Container(
    //     width: 30,
    //     height: 30,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(5.r),
    //       color: _SetColorsBack(),
    //       // color: const Color.fromARGB(67, 68, 137, 255),
    //     ),
    //     child: Icon(_setIcons(), color: _setColorsIcons(), size: 18),
    //   ),

    //   title: Text(title, style: AppTextStyles.s12w400),
    //   subtitle: Text(
    //     '12 hours',
    //     style: AppTextStyles.s12w400.copyWith(
    //       color: const Color.fromARGB(191, 78, 78, 78),
    //       fontSize: 10,
    //     ),
    //   ),
    // );
  }

  Color? _SetColorsBack() {
    switch (type) {
      case EnumTypeAction.proposal:
        return const Color.fromARGB(67, 68, 137, 255);

      case EnumTypeAction.alert:
        return const Color.fromARGB(47, 244, 67, 54);

      case EnumTypeAction.inventory:
        return const Color.fromARGB(62, 76, 175, 79);
      case EnumTypeAction.stock:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
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
        return Colors.deepOrange;
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