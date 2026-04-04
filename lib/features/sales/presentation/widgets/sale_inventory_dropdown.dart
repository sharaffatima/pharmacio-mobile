import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
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
          loading: () => const Center(child: CircularProgressIndicator()),
          successList: (response) {
            final items = response.results;
            if (items.isEmpty) {
              return const Text('No inventory available to sell.');
            }
            return ValueListenableBuilder<int?>(
              valueListenable: salesCubit.selectedInventoryId,
              builder: (context, selectedId, _) => DropdownButtonFormField<int>(
                value: selectedId,
                decoration: const InputDecoration(
                  labelText: 'Select Inventory',
                  border: OutlineInputBorder(),
                ),
                items: items.map((item) {
                  final index = items.indexOf(item);
                  final inventoryId = index + 1;
                  return DropdownMenuItem<int>(
                    value: inventoryId,
                    child: Text('${item.product} (Qty: ${item.quantity})'),
                  );
                }).toList(),
                onChanged: salesCubit.setSelectedInventoryId,
              ),
            );
          },
          error: (err) => Text(
            'Error loading inventory: $err',
            style: const TextStyle(color: AppColors.redError),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
