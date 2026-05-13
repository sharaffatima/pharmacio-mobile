import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/core/di/dependency_injection.dart';
import 'package:pharmacio_flutter_mobile/features/inventory/logic/cubits/inventory_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_checkout_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/pos/logic/cubits/pos_transactions_cubit.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/checkout_tab.dart';
import 'package:pharmacio_flutter_mobile/features/pos/presentation/widgets/transactions_tab.dart';

class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InventoryCubit>(
          create: (_) => getIt<InventoryCubit>()..getInventoryList(),
        ),
        BlocProvider<PosCheckoutCubit>(
          create: (_) => getIt<PosCheckoutCubit>(),
        ),
        BlocProvider<PosTransactionsCubit>(
          create: (_) => getIt<PosTransactionsCubit>()..getTransactions(),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.backGroundBody,
          appBar: AppBar(
            backgroundColor: AppColors.appBarBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15.r),
              ),
            ),
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.pos, style: AppTextStyles.appBar),
                  SizedBox(height: 2.h),
                  Text(
                    AppStrings.posSubtitle,
                    style: AppTextStyles.descriptionAppbar,
                  ),
                ],
              ),
            ),
            bottom: TabBar(
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.white.withValues(alpha: 0.7),
              indicatorColor: AppColors.white,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: AppStrings.checkout),
                Tab(text: AppStrings.posTransactions),
              ],
            ),
          ),
          body: const TabBarView(children: [CheckoutTab(), TransactionsTab()]),
        ),
      ),
    );
  }
}
