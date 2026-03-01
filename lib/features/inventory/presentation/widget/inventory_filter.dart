import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';

class InventoryFilter extends StatefulWidget {
  const InventoryFilter({super.key});

  @override
  _InventoryFilterState createState() => _InventoryFilterState();
}

class _InventoryFilterState extends State<InventoryFilter> {
  String selectedValue = 'All items';

  final List<String> items = [
    'All items',
    'In stock',
    'Low stock',
    'Out stock',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.w),
      child: Row(
        spacing: 5.w,
        children: [
          Icon(Icons.filter_alt_outlined, color: Colors.grey, size: 24),

          Container(
            height: 34.h,
            width: 153.w,
            padding: EdgeInsets.only(left: 9.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.r),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                icon: Icon(Icons.keyboard_arrow_down, color: AppColors.gray),
                style: AppTextStyles.filter,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
