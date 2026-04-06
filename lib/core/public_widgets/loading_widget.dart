import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(3.dg),
            child: SizedBox(
              height: 30.h,
              width: 30.w,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.appBarBackground,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
