import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/core/routing/routes.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/inventory_item_card.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/search_bar.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/state_card.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.inventoryTitle,
        subtitle: AppStrings.inventorySubTitle,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.pushNamed(Routes.inventoryCreateScreen);
          if (result == true && context.mounted) {
            context.read<InventoryCubit>().getInventoryList();
          }
        },
        backgroundColor: AppColors.forestGreen,
        child: Icon(Icons.add, color: Colors.white, size: 28.sp),
      ),
      body: BlocBuilder<InventoryCubit, InventoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(
                color: AppColors.forestGreen,
              ),
            ),
            successList: (response) {
              final items = response.results;

              // Calculate stats
              final total = items.length;
              final inStock =
                  items.where((e) => e.status == 'ok').length;
              final low =
                  items.where((e) => e.status == 'low').length;
              final outOfStock =
                  items.where((e) => e.status == 'out').length;

              // Filter by search
              final filteredItems = _searchQuery.isEmpty
                  ? items
                  : items
                      .where((item) => item.product
                          .toLowerCase()
                          .contains(_searchQuery))
                      .toList();

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
                          "$total",
                          "Total",
                          AppColors.bluePrimary,
                        ),
                        buildStatCard(
                          "$inStock",
                          "In stock",
                          AppColors.greenSuccess,
                        ),
                        buildStatCard(
                          "$low",
                          "Low",
                          AppColors.orangeWarning,
                        ),
                        buildStatCard(
                          "$outOfStock",
                          "Out",
                          AppColors.redError,
                        ),
                      ],
                    ),
                  ),
                  SearchBarWidget(searchController: _searchController),
                  verticalSpace(12),
                  if (filteredItems.isEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Center(
                        child: Text(
                          'No items found',
                          style: AppTextStyles.s14w400.copyWith(
                            color: AppColors.gray,
                          ),
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount: filteredItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        // Determine stock values from status
                        final currentStock = item.quantity;
                        final minStock = item.status == 'ok' ? 20 : 
                                         item.status == 'low' ? currentStock + 10 : 0;

                        return InventoryItemCard(
                          name: item.product,
                          minStock: minStock,
                          currentStock: currentStock,
                          lastUpdated: 'Recently',
                        );
                      },
                    ),
                ],
              );
            },
            successCreate: (_) => const SizedBox.shrink(),
            successAdjust: (_) => const SizedBox.shrink(),
            error: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: AppColors.redError,
                    size: 48.sp,
                  ),
                  verticalSpace(12),
                  Text(
                    error,
                    style: AppTextStyles.s14w500.copyWith(
                      color: AppColors.redError,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<InventoryCubit>().getInventoryList();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.forestGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Retry',
                      style: AppTextStyles.s14w500.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
