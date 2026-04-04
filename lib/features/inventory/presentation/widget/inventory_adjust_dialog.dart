import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_labeled_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';

class InventoryAdjustDialog extends StatelessWidget {
  final int inventoryId;
  final String productName;

  const InventoryAdjustDialog({
    super.key,
    required this.inventoryId,
    required this.productName,
  });

  static Future<bool?> show(
    BuildContext context, {
    required int inventoryId,
    required String productName,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider<InventoryCubit>(
        create: (_) => getIt<InventoryCubit>(),
        child: InventoryAdjustDialog(
          inventoryId: inventoryId,
          productName: productName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InventoryCubit>();
    return BlocListener<InventoryCubit, InventoryState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          successList: (_) {},
          successCreate: (_) {},
          successAdjust: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${response.product}: ${response.previousQuantity} → ${response.quantity}',
                ),
                backgroundColor: AppColors.greenSuccess,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            );
            cubit.clearAdjustForm();
            Navigator.of(context).pop(true);
          },
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
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          child: Form(
            key: cubit.adjustFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.gray.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                verticalSpace(16),
                Text('Adjust Inventory', style: AppTextStyles.s20w700),
                verticalSpace(4),
                Text(
                  productName,
                  style: AppTextStyles.s14w400.copyWith(color: AppColors.gray),
                ),
                verticalSpace(20),
                AppLabeledTextFormField(
                  title: 'Adjustment (use negative for decrease)',
                  controller: cubit.adjustmentController,
                  hintText: 'e.g. -5 or 10',
                  keyboardType: TextInputType.number,
                ),
                verticalSpace(16),
                AppLabeledTextFormField(
                  title: 'Reason',
                  controller: cubit.reasonController,
                  hintText: 'e.g. Damaged units',
                ),
                verticalSpace(24),
                BlocBuilder<InventoryCubit, InventoryState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );
                    return AppPrimaryButton(
                      label: 'Adjust',
                      isLoading: isLoading,
                      backgroundColor: AppColors.forestGreen,
                      onPressed: () {
                        if (cubit.adjustmentController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Adjustment value is required',
                              ),
                              backgroundColor: AppColors.redError,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          );
                          return;
                        }
                        cubit.adjustInventory(inventoryId);
                      },
                    );
                  },
                ),
                verticalSpace(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
