import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_labeled_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';

class InventoryCreateScreen extends StatelessWidget {
  const InventoryCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InventoryCubit>();
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.addItem,
        subtitle: AppStrings.addItemSubtitle,
      ),
      body: BlocListener<InventoryCubit, InventoryState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            successList: (_) {},
            successCreate: (response) {
              showAppSnackBar(
                context,
                message:
                    '${response.product}${AppStrings.addedSuccessfullySuffix}',
                backgroundColor: AppColors.greenSuccess,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
              cubit.clearCreateForm();
              Navigator.of(context).pop(true);
            },
            successAdjust: (_) {},
            error: (error) {
              showAppSnackBar(
                context,
                message: error,
                backgroundColor: AppColors.redError,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.border),
              ),
              child: Form(
                key: cubit.createFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.newInventoryItem,
                      style: AppTextStyles.s20w700,
                    ),
                    verticalSpace(20),
                    AppLabeledTextFormField(
                      title: AppStrings.productName,
                      controller: cubit.productNameController,
                      hintText: AppStrings.enterProductName,
                    ),
                    verticalSpace(16),
                    AppLabeledTextFormField(
                      title: AppStrings.strength,
                      controller: cubit.strengthController,
                      hintText: AppStrings.strengthExample,
                    ),
                    verticalSpace(16),
                    AppLabeledTextFormField(
                      title: AppStrings.quantityOnHand,
                      controller: cubit.quantityOnHandController,
                      hintText: AppStrings.enterQuantity,
                      keyboardType: TextInputType.number,
                    ),
                    verticalSpace(16),
                    AppLabeledTextFormField(
                      title: AppStrings.minThreshold,
                      controller: cubit.minThresholdController,
                      hintText: AppStrings.enterMinThreshold,
                      keyboardType: TextInputType.number,
                    ),
                    verticalSpace(24),
                    BlocBuilder<InventoryCubit, InventoryState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return AppPrimaryButton(
                          label: AppStrings.addItem,
                          isLoading: isLoading,
                          backgroundColor: AppColors.forestGreen,
                          onPressed: () {
                            if (cubit.productNameController.text.isEmpty) {
                              showAppSnackBar(
                                context,
                                message: AppStrings.productRequired,
                                backgroundColor: AppColors.redError,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              );
                              return;
                            }
                            cubit.createInventory();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
