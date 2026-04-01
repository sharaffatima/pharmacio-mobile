import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/networking/api_services_impl.dart';
import 'package:pharmacio_flutter_mobile/core/networking/network_info.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/data/data_source/inventory_remote_data_source.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/data/models/inventory_item_model.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/data/repos/inventory_repo.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widgets/inventory_filter.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widgets/inventory_item_card.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widgets/search_bar.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widgets/state_card.dart';

class InventoryScreen extends StatefulWidget {
  InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InventoryCubit(
        InventoryRepo(
          inventoryRemoteDataSource: InventoryRemoteDataSourceImpl(
            apiServicesImpl: ApiServicesImpl(),
          ),
          networkInfo: NetworkInfoImp(
            internetConnectionChecker:
                InternetConnectionChecker.createInstance(),
          ),
        ),
      )..getInventory(),
      child: _InventoryView(searchController: _searchController),
    );
  }
}

class _InventoryView extends StatefulWidget {
  final TextEditingController searchController;

  const _InventoryView({required this.searchController});

  @override
  State<_InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<_InventoryView> {
  String _selectedFilter = 'allItems';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(() {
      setState(() {
        _searchQuery = widget.searchController.text.toLowerCase();
      });
    });
  }

  List<InventoryItemModel> _filterItems(List<InventoryItemModel> items) {
    return items.where((item) {
      final matchesSearch = item.product.toLowerCase().contains(_searchQuery);
      final matchesFilter =
          _selectedFilter == 'allItems' ||
          (_selectedFilter == 'inStock' && item.status == 'ok') ||
          (_selectedFilter == 'low' && item.status == 'low') ||
          (_selectedFilter == 'out' && item.status == 'out');
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: 'inventoryTitle'.tr(),
        subtitle: 'inventorySubTitle'.tr(),
      ),
      body: BlocBuilder<InventoryCubit, InventoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<InventoryCubit>().getInventory(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            success: (inventoryResponse) {
              final allItems = inventoryResponse.results;
              final filteredItems = _filterItems(allItems);

              final total = inventoryResponse.count;
              final inStock = allItems.where((i) => i.status == 'ok').length;
              final low = allItems.where((i) => i.status == 'low').length;
              final out = allItems.where((i) => i.status == 'out').length;

              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 14.h,
                      left: 16.w,
                      right: 15.w,
                      bottom: 18.h,
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        buildStatCard(
                          '$total',
                          'proposaltitle'.tr(),
                          AppColors.bluePrimary,
                        ),
                        buildStatCard(
                          '$inStock',
                          'inStock'.tr(),
                          AppColors.greenSuccess,
                        ),
                        buildStatCard(
                          '$low',
                          'low'.tr(),
                          AppColors.orangeWarning,
                        ),
                        buildStatCard('$out', 'out'.tr(), AppColors.redError),
                      ],
                    ),
                  ),
                  SearchBarWidget(searchController: widget.searchController),
                  InventoryFilter(
                    selectedValue: _selectedFilter,
                    onChanged: (value) {
                      setState(() {
                        _selectedFilter = value;
                      });
                    },
                  ),
                  ListView.builder(
                    itemCount: filteredItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return InventoryItemCard(
                        product: item.product,
                        quantity: item.quantity,
                        status: item.status,
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
