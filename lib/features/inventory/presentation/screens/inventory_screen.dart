import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart'
    show CustomAppBar;
import 'package:pharmacio_flutter_mobile/features/inventory/data/dataSources/mock_data.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/inventory_filter.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/inventory_item_card.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/search_bar.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/presentation/widget/state_card.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: AppStrings.inventoryTitle,
        subtitle: AppStrings.profileSubTitle,
      ),
      body: ListView(
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
                buildStatCard("10", "Total", AppColors.bluePrimary),
                buildStatCard("5", "In stock", AppColors.greenSuccess),
                buildStatCard("3", "Low", AppColors.orangeWarning),
                buildStatCard("2", "Out", AppColors.redError),
              ],
            ),
          ),

          SearchBarWidget(searchController: _searchController),
          InventoryFilter(),

          ListView.builder(
            itemCount: mockInventoryList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = mockInventoryList[index];

              return InventoryItemCard(
                name: item.name,
                minStock: item.minStock,
                currentStock: item.currentStock,
                lastUpdated: item.lastUpdated,
              );
            },
          ),
        ],
      ),
    );
  }
}
