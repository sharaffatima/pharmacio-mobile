import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_outlined_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_checkout_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/states/pos_checkout_state.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/payment_rows_section.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/pos_inventory_dropdown.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/pos_summary_card.dart';

class CheckoutTab extends StatelessWidget {
  const CheckoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.read<PosCheckoutCubit>();

    return BlocConsumer<PosCheckoutCubit, PosCheckoutState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (transaction) {
            showAppSnackBar(
              context,
              message:
                  '${AppStrings.checkoutSuccess} (${transaction.receiptNumber})',
              backgroundColor: AppColors.greenSuccess,
            );
            checkoutCubit.resetForm();
          },
          error: (message) {
            showAppSnackBar(
              context,
              message: message,
              backgroundColor: AppColors.redError,
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: checkoutCubit.formKey,
            child: ListView(
              children: [
                PosInventoryDropdown(checkoutCubit: checkoutCubit),
                verticalSpace(16),
                AppOutlinedTextFormField(
                  controller: checkoutCubit.quantityController,
                  keyboardType: TextInputType.number,
                  labelText: AppStrings.quantitySold,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.requiredField;
                    }
                    final n = int.tryParse(val);
                    if (n == null || n <= 0) return AppStrings.requiredField;
                    return null;
                  },
                ),
                verticalSpace(16),
                AppOutlinedTextFormField(
                  controller: checkoutCubit.priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  labelText: AppStrings.unitPrice,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.requiredField;
                    }
                    final n = double.tryParse(val);
                    if (n == null || n <= 0) return AppStrings.requiredField;
                    return null;
                  },
                ),
                verticalSpace(16),
                AppOutlinedTextFormField(
                  controller: checkoutCubit.discountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  labelText: AppStrings.discountPercentage,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return AppStrings.requiredField;
                    }
                    final n = double.tryParse(val);
                    if (n == null || n < 0 || n > 100) {
                      return AppStrings.requiredField;
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                PosSummaryCard(checkoutCubit: checkoutCubit),
                verticalSpace(16),
                PaymentRowsSection(checkoutCubit: checkoutCubit),
                verticalSpace(24),
                AppPrimaryButton(
                  label: AppStrings.checkout,
                  isLoading: isLoading,
                  backgroundColor: AppColors.forestGreen,
                  onPressed: () {
                    if (checkoutCubit.selectedInventoryId.value == null) {
                      showAppSnackBar(
                        context,
                        message: AppStrings.inventoryRequired,
                        backgroundColor: AppColors.redError,
                      );
                      return;
                    }
                    final paymentError = checkoutCubit.validatePayments();
                    if (paymentError != null) {
                      showAppSnackBar(
                        context,
                        message: paymentError,
                        backgroundColor: AppColors.redError,
                      );
                      return;
                    }
                    final request = checkoutCubit.buildRequestIfValid();
                    if (request != null) {
                      context.read<PosCheckoutCubit>().checkout(request);
                    }
                  },
                ),
                verticalSpace(24),
              ],
            ),
          ),
        );
      },
    );
  }
}
