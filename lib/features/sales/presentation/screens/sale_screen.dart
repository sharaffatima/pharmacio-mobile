import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/sales/data/models/sales_request.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/cubits/sales_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/sales/logic/states/sales_state.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final _formKey = GlobalKey<FormState>();
  int? _selectedInventoryId;
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
    text: DateTime.now().toIso8601String().split('.')[0] + 'Z',
  );

  @override
  Widget build(BuildContext context) {
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
                  SnackBar(content: Text('Sale recorded successfully!'), backgroundColor: AppColors.greenSuccess),
                );
                Navigator.pop(context); // Go back after success
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: AppColors.redError),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    _buildInventoryDropdown(),
                    verticalSpace(16),
                    TextFormField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantity Sold',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                    ),
                    verticalSpace(16),
                    TextFormField(
                      controller: _priceController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Unit Price',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                    ),
                    verticalSpace(16),
                    TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        labelText: 'Sold At (ISO 8601)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                    ),
                    verticalSpace(24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bluePrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate() && _selectedInventoryId != null) {
                                final request = SalesRequestModel(
                                  inventoryId: _selectedInventoryId!,
                                  quantitySold: int.parse(_quantityController.text),
                                  unitPrice: _priceController.text,
                                  soldAt: _dateController.text,
                                );
                                context.read<SalesCubit>().recordSale(request);
                              } else if (_selectedInventoryId == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Select an inventory.'), backgroundColor: AppColors.redError),
                                );
                              }
                            },
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Record Sale', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInventoryDropdown() {
    return BlocBuilder<InventoryCubit, InventoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          successList: (response) {
            final items = response.results;
            if (items.isEmpty) {
              return const Text('No inventory available to sell.');
            }
            return DropdownButtonFormField<int>(
              value: _selectedInventoryId,
              decoration: const InputDecoration(
                labelText: 'Select Inventory',
                border: OutlineInputBorder(),
              ),
              items: items.map((item) {
                final index = items.indexOf(item);
                // Assign a placeholder ID or use index if the API doesn't provide one
                final inventoryId = index + 1; // Or fallback to item.product hash
                return DropdownMenuItem<int>(
                  value: inventoryId,
                  child: Text('${item.product} (Qty: ${item.quantity})'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _selectedInventoryId = val),
            );
          },
          error: (err) => Text('Error loading inventory: \$err', style: TextStyle(color: AppColors.redError)),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
