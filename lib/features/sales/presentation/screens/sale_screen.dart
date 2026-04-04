import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_outlined_text_form_field.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
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
        appBar: const CustomAppBar(
          title: 'Record Sale',
          subtitle: 'Create a new sale record',
        ),
        body: BlocConsumer<SalesCubit, SalesState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (response) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Sale recorded successfully!'),
                    backgroundColor: AppColors.greenSuccess,
                  ),
                );
                Navigator.pop(context); // Go back after success
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: AppColors.redError,
                  ),
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
                      labelText: 'Quantity Sold',
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Required' : null,
                    ),
                    verticalSpace(16),
                    AppOutlinedTextFormField(
                      controller: salesCubit.priceController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      labelText: 'Unit Price',
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Required' : null,
                    ),
                    verticalSpace(16),
                    AppOutlinedTextFormField(
                      controller: salesCubit.dateController,
                      labelText: 'Sold At (ISO 8601)',
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Required' : null,
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
