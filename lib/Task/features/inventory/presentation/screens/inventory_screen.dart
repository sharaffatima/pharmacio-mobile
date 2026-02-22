import 'package:pharmacio_flutter_mobile/Task/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/Task/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/Task/core/helpers/space_helpers.dart';
import 'package:pharmacio_flutter_mobile/Task/features/inventory/presentation/widget/inventory_filter.dart';
import 'package:pharmacio_flutter_mobile/Task/features/inventory/presentation/widget/inventory_item_card.dart';
import 'package:pharmacio_flutter_mobile/Task/features/inventory/presentation/widget/search_bar.dart';
import 'package:pharmacio_flutter_mobile/Task/features/inventory/presentation/widget/state_card.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: AppBar(
        toolbarHeight: 132.h,
        backgroundColor: AppColors.backGroundAppBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.r)),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 8.w, top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.inventory, style: AppTextStyles.appBar),
              verticalSpace(4),
              Text(
                AppStrings.trackAndManage,
                style: AppTextStyles.descriptionAppbar,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            InventoryItemCard(
              name: "Panadol Advance 500mg",
              minStock: 20,
              currentStock: 45,
              lastUpdated: "2 hours ago",
            ),

            InventoryItemCard(
              name: "Aspirin 100mg",
              minStock: 30,
              currentStock: 12,
              lastUpdated: "5 hours ago",
            ),

            InventoryItemCard(
              name: "Amoxicillin 500mg",
              minStock: 15,
              currentStock: 0,
              lastUpdated: "1 day ago",
            ),

            InventoryItemCard(
              name: "Vitamin C 1000mg",
              minStock: 50,
              currentStock: 5,
              lastUpdated: "10 mins ago",
            ),

            InventoryItemCard(
              name: "Ibuprofen 400mg",
              minStock: 25,
              currentStock: 100,
              lastUpdated: "3 hours ago",
            ),
            InventoryItemCard(
              name: "Panadol Advance 500mg",
              minStock: 20,
              currentStock: 45,
              lastUpdated: "2 hours ago",
            ),

            InventoryItemCard(
              name: "Aspirin 100mg",
              minStock: 30,
              currentStock: 12,
              lastUpdated: "5 hours ago",
            ),

            InventoryItemCard(
              name: "Amoxicillin 500mg",
              minStock: 15,
              currentStock: 0,
              lastUpdated: "1 day ago",
            ),

            InventoryItemCard(
              name: "Vitamin C 1000mg",
              minStock: 50,
              currentStock: 5,
              lastUpdated: "10 mins ago",
            ),

            InventoryItemCard(
              name: "Ibuprofen 400mg",
              minStock: 25,
              currentStock: 100,
              lastUpdated: "3 hours ago",
            ),
          ],
        ),
      ),
    );
  }
}
