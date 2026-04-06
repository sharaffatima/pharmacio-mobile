import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_outlined_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/cubits/sales_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/states/sales_state.dart';
import 'package:pharmacio_flutter_mobile/features/sales/presentation/widgets/sale_inventory_dropdown.dart';
import 'package:pharmacio_flutter_mobile/features/sales/presentation/widgets/sale_submit_button.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final salesCubit = context.read<SalesCubit>();

    return BlocProvider(
      create: (context) => getIt<InventoryCubit>()..getInventoryList(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundBody,
        appBar: CustomAppBar(
          title: AppStrings.recordSale,
          subtitle: AppStrings.recordSaleSubtitle,
        ),
        body: BlocConsumer<SalesCubit, SalesState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (response) {
                showAppSnackBar(
                  context,
                  message: AppStrings.saleSuccess,
                  backgroundColor: AppColors.greenSuccess,
                );
                Navigator.pop(context); // Go back after success
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: salesCubit.formKey,
                child: ListView(
                  children: [
                    SaleInventoryDropdown(salesCubit: salesCubit),
                    verticalSpace(16),
                    AppOutlinedTextFormField(
                      controller: salesCubit.quantityController,
                      keyboardType: TextInputType.number,
                      labelText: AppStrings.quantitySold,
                      validator: (val) => val == null || val.isEmpty
                          ? AppStrings.requiredField
                          : null,
                    ),
                    verticalSpace(16),
                    AppOutlinedTextFormField(
                      controller: salesCubit.priceController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      labelText: AppStrings.unitPrice,
                      validator: (val) => val == null || val.isEmpty
                          ? AppStrings.requiredField
                          : null,
                    ),
                    verticalSpace(16),
                    AppOutlinedTextFormField(
                      controller: salesCubit.dateController,
                      labelText: AppStrings.soldAtIso,
                      validator: (val) => val == null || val.isEmpty
                          ? AppStrings.requiredField
                          : null,
                    ),
                    verticalSpace(24),
                    SaleSubmitButton(salesCubit: salesCubit),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
