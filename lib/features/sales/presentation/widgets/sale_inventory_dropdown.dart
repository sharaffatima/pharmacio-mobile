import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/cubits/sales_cubit.dart';

class SaleInventoryDropdown extends StatelessWidget {
  const SaleInventoryDropdown({super.key, required this.salesCubit});

  final SalesCubit salesCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const LoadingWidget(),
          successList: (response) {
            final items = response.results;
            if (items.isEmpty) {
              return Text(AppStrings.noInventoryToSell);
            }
            return ValueListenableBuilder<int?>(
              valueListenable: salesCubit.selectedInventoryId,
              builder: (context, selectedId, _) => DropdownButtonFormField<int>(
                initialValue: selectedId,
                decoration: InputDecoration(
                  labelText: AppStrings.selectInventory,
                  border: OutlineInputBorder(),
                ),
                items: items.map((item) {
                  final index = items.indexOf(item);
                  final inventoryId = index + 1;
                  return DropdownMenuItem<int>(
                    value: inventoryId,
                    child: Text(
                      '${item.product} (${AppStrings.qtyShort}: ${item.quantity})',
                    ),
                  );
                }).toList(),
                onChanged: salesCubit.setSelectedInventoryId,
              ),
            );
          },
          error: (err) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppStrings.inventoryErrorPrefix}$err',
                style: const TextStyle(color: AppColors.redError),
              ),
              verticalSpace(12),
              RetryWidget(
                onPressed: () =>
                    context.read<InventoryCubit>().getInventoryList(),
              ),
            ],
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
