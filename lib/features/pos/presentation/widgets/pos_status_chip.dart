import 'package:flutter/material.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';

class PosStatusChip extends StatelessWidget {
  const PosStatusChip({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final String label;
    if (status == 'completed') {
      color = AppColors.greenSuccess;
      label = AppStrings.posStatusCompleted;
    } else if (status == 'refunded') {
      color = AppColors.orangeWarning;
      label = AppStrings.posStatusRefunded;
    } else {
      color = AppColors.textSecondary;
      label = status;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
