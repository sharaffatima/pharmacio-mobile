import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';

class InventoryCreateScreen extends StatelessWidget {
  const InventoryCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<InventoryCubit>();
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: 'Add Item',
        subtitle: 'Add a new inventory item',
      ),
      body: BlocListener<InventoryCubit, InventoryState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            successList: (_) {},
            successCreate: (response) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${response.product} added successfully!',
                  ),
                  backgroundColor: AppColors.greenSuccess,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              );
              cubit.clearCreateForm();
              Navigator.of(context).pop(true);
            },
            successAdjust: (_) {},
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Form(
                key: cubit.createFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Inventory Item',
                      style: AppTextStyles.s20w700,
                    ),
                    verticalSpace(20),
                    TitleAndInputWidget(
                      title: 'Product Name',
                      controller: cubit.productNameController,
                      hintText: 'Enter product name',
                    ),
                    verticalSpace(16),
                    TitleAndInputWidget(
                      title: 'Strength',
                      controller: cubit.strengthController,
                      hintText: 'e.g. 500mg',
                    ),
                    verticalSpace(16),
                    TitleAndInputWidget(
                      title: 'Quantity on Hand',
                      controller: cubit.quantityOnHandController,
                      hintText: 'Enter quantity',
                    ),
                    verticalSpace(16),
                    TitleAndInputWidget(
                      title: 'Minimum Threshold',
                      controller: cubit.minThresholdController,
                      hintText: 'Enter min threshold',
                    ),
                    verticalSpace(24),
                    BlocBuilder<InventoryCubit, InventoryState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );
                        return CustomElevatedButton(
                          colorButton: AppColors.forestGreen,
                          textButton: Colors.white,
                          label: 'Add Item',
                          isLoading: isLoading,
                          onTap: () {
                            if (cubit.productNameController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Product name is required',
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
