import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/offers/data/models/upload_offer_response.dart';
import 'package:pharmacio_flutter_mobile/features/offers/logic/cubits/offers_cubit.dart';

import '../widget/scan_widgets/camera_tab.dart';
import '../widget/scan_widgets/header.dart';
import '../widget/scan_widgets/recent_uploads_section.dart';
import '../widget/scan_widgets/segmented_tabs.dart';
import '../widget/scan_widgets/upload_tab.dart';
import '../widget/scan_widgets/warehouse_field.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key, this.initialTabIndex = 0});

  final int initialTabIndex;

  @override
  Widget build(BuildContext context) {
    final offersCubit = context.read<OffersCubit>();

    return DefaultTabController(
      length: 2,
      initialIndex: initialTabIndex.clamp(0, 1),
      child: Scaffold(
        backgroundColor: AppColors.backGroundBody,
        body: BlocListener<OffersCubit, OffersState>(
          listener: (context, state) {
            state.whenOrNull(
              uploadSuccess: (response) {
                showAppSnackBar(
                  context,
                  message: response.message,
                  backgroundColor: AppColors.greenGood,
                );
              },
              statusSuccess: (statusResponse) {
                showAppSnackBar(
                  context,
                  message: '${AppStrings.statusPrefix}${statusResponse.status}',
                  backgroundColor: statusResponse.status == 'failed'
                      ? AppColors.redError
                      : AppColors.greenGood,
                );
              },
              error: (error) {
                showAppSnackBar(
                  context,
                  message: error,
                  backgroundColor: AppColors.redError,
                );
              },
            );
          },
          child: Column(
            children: [
              Header(),
              verticalSpace(12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    WarehouseField(controller: offersCubit.warehouseController),
                    verticalSpace(12.h),
                    SegmentedTabs(),
                  ],
                ),
              ),
              verticalSpace(12.h),
              Expanded(
                child: TabBarView(
                  children: [
                    CameraTab(
                      wareHouseName: offersCubit.warehouseController.text,
                    ),
                    UploadTab(
                      wareHouseName: offersCubit.warehouseController.text,
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder<List<UploadOfferResponse>>(
                valueListenable: offersCubit.recentUploads,
                builder: (context, uploads, _) {
                  if (uploads.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return RecentUploadsSection(
                    uploads: uploads,
                    onCheckStatus: (id) {
                      context.read<OffersCubit>().getUploadStatus(id);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
