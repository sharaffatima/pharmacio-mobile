import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/retry_widget.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_checkout_cubit.dart';

class PosInventoryDropdown extends StatelessWidget {
  const PosInventoryDropdown({super.key, required this.checkoutCubit});

  final PosCheckoutCubit checkoutCubit;

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
              valueListenable: checkoutCubit.selectedInventoryId,
              builder: (context, selectedId, _) => DropdownButtonFormField<int>(
                initialValue: selectedId,
                decoration: InputDecoration(
                  labelText: AppStrings.selectInventory,
                  border: const OutlineInputBorder(),
                ),
                items: items.map((item) {
                  return DropdownMenuItem<int>(
                    value: item.id,
                    child: Text(
                      '${item.product}${item.strength != null ? ' ${item.strength}' : ''} (${AppStrings.qtyShort}: ${item.quantity})',
                    ),
                  );
                }).toList(),
                onChanged: checkoutCubit.setSelectedInventoryId,
                validator: (_) =>
                    checkoutCubit.selectedInventoryId.value == null
                    ? AppStrings.inventoryRequired
                    : null,
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
