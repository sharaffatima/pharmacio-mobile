import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/app_primary_button.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/cubits/sales_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/states/sales_state.dart';

class SaleSubmitButton extends StatelessWidget {
  const SaleSubmitButton({super.key, required this.salesCubit});

  final SalesCubit salesCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return AppPrimaryButton(
          label: 'Record Sale',
          isLoading: isLoading,
          backgroundColor: AppColors.bluePrimary,
          onPressed: () {
            final request = salesCubit.buildRequestIfValid();
            if (request != null) {
              context.read<SalesCubit>().recordSale(request);
            } else if (salesCubit.selectedInventoryId.value == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Select an inventory.'),
                  backgroundColor: AppColors.redError,
                ),
              );
            }
          },
        );
      },
    );
  }
}
