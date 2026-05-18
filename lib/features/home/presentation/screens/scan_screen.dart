import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/helpers/spacing.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/snack_bar_widget.dart';
import 'package:pharmacio_flutter_mobile/features/offers/data/models/upload_offer_response.dart';
import 'package:pharmacio_flutter_mobile/features/offers/logic/cubits/offers_cubit.dart';

import '../widget/scan_widgets/header.dart';
import '../widget/scan_widgets/recent_uploads_section.dart';
import '../widget/scan_widgets/upload_tab.dart';
import '../widget/scan_widgets/warehouse_field.dart';

// ignore: must_be_immutable
class ScanScreen extends StatelessWidget {
  ScanScreen({super.key, this.initialTabIndex = 0});

  final int initialTabIndex;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final offersCubit = context.read<OffersCubit>();

    return DefaultTabController(
      length: 1,
      initialIndex: initialTabIndex.clamp(0, 0),
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
                    Form(
                      key: _form,
                      child: WarehouseFields(
                        controller: offersCubit.warehouseController,
                      ),
                    ),
                    verticalSpace(12.h),
                    // SegmentedTabs(),
                  ],
                ),
              ),
              verticalSpace(12.h),
              Expanded(
                child: TabBarView(
                  children: [
                    /*
                    // Temporarily disabled for future releases.
                    CameraTab(
                      wareHouseName: offersCubit.warehouseController.text,
                    ),
                    */
                    UploadTabs(
                      wareHouseName: offersCubit.warehouseController.text,
                      form: _form,
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

class ProcessingStatusCard extends StatefulWidget {
  final Duration checkInterval;
  final Future<String> Function()
  onCheckStatus; // returns 'processing' or 'completed'

  const ProcessingStatusCard({
    super.key,
    this.checkInterval = const Duration(seconds: 5),
    required this.onCheckStatus,
  });

  @override
  State<ProcessingStatusCard> createState() => _ProcessingStatusCardState();
}

class _ProcessingStatusCardState extends State<ProcessingStatusCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _spinController;
  String _status = 'processing';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _startPolling();
  }

  void _startPolling() {
    _timer = Timer.periodic(widget.checkInterval, (_) async {
      final result = await widget.onCheckStatus();
      if (!mounted) return;
      if (result == 'completed') {
        setState(() => _status = 'completed');
        _spinController.stop();
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _spinController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  bool get _isCompleted => _status == 'completed';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Processing Status',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),

            // Spinner + label + badge
            Row(
              children: [
                _isCompleted
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 24,
                      )
                    : RotationTransition(
                        turns: _spinController,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue.shade400,
                            ),
                          ),
                        ),
                      ),
                const SizedBox(width: 10),
                Text(
                  _isCompleted
                      ? 'Processing complete!'
                      : 'Processing document...',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                _StatusBadge(status: _status),
              ],
            ),
            const SizedBox(height: 16),

            // Step 1 — always done
            _buildStep(number: 1, label: 'Uploading file...', status: 'done'),
            // Step 2
            _buildStep(
              number: 2,
              label: 'Processing document...',
              status: _isCompleted ? 'done' : 'active',
            ),
            // Step 3 (was step 5)
            _buildStep(
              number: 3,
              label: 'Processing complete!',
              status: _isCompleted ? 'done' : 'pending',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required int number,
    required String label,
    required String status,
  }) {
    Widget icon;
    Color labelColor;
    FontWeight labelWeight;

    switch (status) {
      case 'done':
        icon = Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, size: 14, color: Colors.white),
        );
        labelColor = Colors.grey.shade500;
        labelWeight = FontWeight.normal;
        break;
      case 'active':
        icon = Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.blue.shade400,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
        labelColor = Colors.black87;
        labelWeight = FontWeight.w500;
        break;
      default:
        icon = Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
            ),
          ),
        );
        labelColor = Colors.grey.shade400;
        labelWeight = FontWeight.normal;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: labelColor,
              fontWeight: labelWeight,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final isCompleted = status == 'completed';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.green.shade50 : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 11,
          color: isCompleted ? Colors.green.shade700 : Colors.blue.shade700,
        ),
      ),
    );
  }
}
