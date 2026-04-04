import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/text_style.dart';
import 'package:pharmacio_flutter_mobile/features/home/presentation/screens/camera_capture_screen.dart';
import 'package:pharmacio_flutter_mobile/features/offers/data/models/upload_offer_response.dart';
import 'package:pharmacio_flutter_mobile/features/offers/logic/cubits/offers_cubit.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, this.initialTabIndex = 0});

  final int initialTabIndex;

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final TextEditingController _wareHouseController = TextEditingController(
    text: 'Main Warehouse',
  );

  final List<UploadOfferResponse> _recentUploads = [];

  @override
  void dispose() {
    _wareHouseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialTabIndex.clamp(0, 1),
      child: Scaffold(
        backgroundColor: AppColors.backGroundBody,
        body: BlocListener<OffersCubit, OffersState>(
          listener: (context, state) {
            state.whenOrNull(
              uploadSuccess: (response) {
                setState(() {
                  _recentUploads.insert(0, response);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(response.message),
                    backgroundColor: AppColors.greenGood,
                  ),
                );
              },
              statusSuccess: (statusResponse) {
                setState(() {
                  final index = _recentUploads.indexWhere(
                    (u) => u.uploadId == statusResponse.uploadId,
                  );
                  if (index != -1) {
                    _recentUploads[index] = UploadOfferResponse(
                      uploadId: statusResponse.uploadId,
                      originalFilename: statusResponse.originalFilename,
                      fileUrl: statusResponse.fileUrl,
                      status: statusResponse.status,
                      message: statusResponse.message,
                      createdAt: statusResponse.createdAt,
                    );
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Status: ${statusResponse.status}'),
                    backgroundColor: statusResponse.status == 'failed'
                        ? AppColors.redError
                        : AppColors.greenGood,
                  ),
                );
              },
              error: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: AppColors.redError,
                  ),
                );
              },
            );
          },
          child: Column(
            children: [
              _Header(),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    _WarehouseField(controller: _wareHouseController),
                    SizedBox(height: 12.h),
                    _SegmentedTabs(),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: TabBarView(
                  children: [
                    _CameraTab(wareHouseName: _wareHouseController.text),
                    _UploadTab(wareHouseName: _wareHouseController.text),
                  ],
                ),
              ),
              if (_recentUploads.isNotEmpty) ...[
                _RecentUploadsSection(
                  uploads: _recentUploads,
                  onCheckStatus: (id) {
                    context.read<OffersCubit>().getUploadStatus(id);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _WarehouseField extends StatelessWidget {
  final TextEditingController controller;
  const _WarehouseField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Warehouse Name',
            style: AppTextStyles.s12w400.copyWith(fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter warehouse name',
              border: InputBorder.none,
              hintStyle: AppTextStyles.s12w400.copyWith(color: AppColors.gray),
            ),
            style: AppTextStyles.s14w400,
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backGroundAppBar,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(18),
          bottomRight: Radius.circular(18),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Scan / Upload', style: AppTextStyles.appBar),
              SizedBox(height: 6.h),
              Text(
                'Upload offers via camera or files',
                style: AppTextStyles.descriptionAppbar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SegmentedTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(999),
      ),
      child: TabBar(
        dividerHeight: 0,
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(999),
        ),
        labelColor: AppColors.black,
        unselectedLabelColor: const Color(0xFF5A5A5A),
        labelStyle: AppTextStyles.s12w400.copyWith(fontWeight: FontWeight.w600),
        unselectedLabelStyle: AppTextStyles.s12w400.copyWith(
          fontWeight: FontWeight.w600,
        ),
        tabs: const [
          Tab(
            icon: Icon(Icons.camera_alt_outlined, size: 18),
            text: 'Camera Scan',
          ),
          Tab(
            icon: Icon(Icons.file_upload_outlined, size: 18),
            text: 'Upload File',
          ),
        ],
      ),
    );
  }
}

class _CameraTab extends StatelessWidget {
  final String wareHouseName;
  const _CameraTab({required this.wareHouseName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: _CameraContentCard(wareHouseName: wareHouseName),
    );
  }
}

class _CameraContentCard extends StatefulWidget {
  final String wareHouseName;
  const _CameraContentCard({required this.wareHouseName});

  @override
  State<_CameraContentCard> createState() => _CameraContentCardState();
}

class _CameraContentCardState extends State<_CameraContentCard> {
  String? _capturedPath;

  Future<void> _openCamera() async {
    final path = await Navigator.of(
      context,
    ).push<String?>(CameraCaptureScreen.route());

    if (!mounted) return;
    if (path == null) return;
    setState(() => _capturedPath = path);

    // Auto upload after capture? Or wait for another button?
    // Let's add an explicit upload button if captured.
  }

  Future<void> _uploadCaptured() async {
    if (_capturedPath == null) return;
    final file = File(_capturedPath!);
    final fileName = file.path.split('/').last;

    context.read<OffersCubit>().uploadOfferFile(
      filePath: _capturedPath!,
      fileName: fileName,
      wareHouseName: widget.wareHouseName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ContentCard(
          title: 'Camera Scan',
          subtitle: 'Scan documents using your device camera',
          actionIcon: Icons.camera_alt_outlined,
          actionLabel: 'Start Camera',
          placeholderIcon: Icons.camera_alt_outlined,
          previewPath: _capturedPath,
          onPrimaryAction: _openCamera,
          tips: const [
            'Ensure good lighting',
            'Hold camera steady',
            'Capture entire document in frame',
            'Avoid shadows and glare',
          ],
        ),
        if (_capturedPath != null) ...[
          SizedBox(height: 16.h),
          BlocBuilder<OffersCubit, OffersState>(
            builder: (context, state) {
              final isLoading = state is OffersLoading;
              return _PrimaryActionButton(
                icon: Icons.cloud_upload_outlined,
                label: isLoading ? 'Uploading...' : 'Confirm and Upload',
                onPressed: isLoading ? () {} : _uploadCaptured,
                backgroundColor: AppColors.forestGreen,
              );
            },
          ),
        ],
      ],
    );
  }
}

class _UploadTab extends StatelessWidget {
  final String wareHouseName;
  const _UploadTab({required this.wareHouseName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: _UploadContentCard(wareHouseName: wareHouseName),
    );
  }
}

class _UploadContentCard extends StatefulWidget {
  final String wareHouseName;
  const _UploadContentCard({required this.wareHouseName});

  @override
  State<_UploadContentCard> createState() => _UploadContentCardState();
}

class _UploadContentCardState extends State<_UploadContentCard> {
  List<PlatformFile> _selectedFiles = [];

  Future<void> _pickFile({
    required String label,
    required List<String> extensions,
  }) async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: extensions,
        allowMultiple: true,
        withData: false,
        withReadStream: false,
      );
    } on Error catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'File picking is not available on this platform/build.',
          ),
        ),
      );
      return;
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick file: $e')));
      return;
    }

    if (!mounted) return;
    if (result == null || result.files.isEmpty) return;

    setState(() => _selectedFiles = [..._selectedFiles, ...result!.files]);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${result.files.length} files added')),
    );
  }

  Future<void> _uploadFiles() async {
    if (_selectedFiles.isEmpty) return;

    for (final file in _selectedFiles) {
      if (file.path != null) {
        await context.read<OffersCubit>().uploadOfferFile(
          filePath: file.path!,
          fileName: file.name,
          wareHouseName: widget.wareHouseName,
        );
      }
    }
    setState(() {
      _selectedFiles = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upload File', style: AppTextStyles.s14w500),
          SizedBox(height: 4.h),
          Text(
            'Upload PDF, Excel, or Image files',
            style: AppTextStyles.s12w400.copyWith(
              color: const Color(0xFF6A6A6A),
            ),
          ),
          SizedBox(height: 14.h),
          _UploadOptionCard(
            icon: Icons.image_outlined,
            iconColor: const Color(0xFF2B66FF),
            title: 'Upload Image',
            subtitle: 'JPG, PNG, etc.',
            onTap: () => _pickFile(
              label: 'Image',
              extensions: const ['jpg', 'jpeg', 'png'],
            ),
          ),
          SizedBox(height: 12.h),
          _UploadOptionCard(
            icon: Icons.picture_as_pdf_outlined,
            iconColor: const Color(0xFFE53935),
            title: 'Upload PDF',
            subtitle: 'PDF documents',
            onTap: () => _pickFile(label: 'PDF', extensions: const ['pdf']),
          ),
          SizedBox(height: 12.h),
          _UploadOptionCard(
            icon: Icons.table_chart_outlined,
            iconColor: const Color(0xFF0F9D58),
            title: 'Upload Excel',
            subtitle: 'XLSX, XLS, CSV',
            onTap: () => _pickFile(
              label: 'Excel',
              extensions: const ['xlsx', 'xls', 'csv'],
            ),
          ),
          if (_selectedFiles.isNotEmpty) ...[
            SizedBox(height: 14.h),
            ..._selectedFiles.map(
              (file) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color(0xFFE3E3E3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 18.r,
                        color: AppColors.greenGood,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          'Selected: ${file.name}',
                          style: AppTextStyles.s12w400.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF4E4E4E),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 16.r, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _selectedFiles.remove(file);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<OffersCubit, OffersState>(
              builder: (context, state) {
                final isLoading = state is OffersLoading;
                return _PrimaryActionButton(
                  icon: Icons.cloud_upload_outlined,
                  label: isLoading ? 'Uploading...' : 'Upload All Files',
                  onPressed: isLoading ? () {} : _uploadFiles,
                  backgroundColor: AppColors.forestGreen,
                );
              },
            ),
          ],
          SizedBox(height: 16.h),
          Row(
            children: [
              Icon(
                Icons.description_outlined,
                size: 18.r,
                color: const Color(0xFF6A6A6A),
              ),
              SizedBox(width: 8.w),
              Text(
                'Supported formats:',
                style: AppTextStyles.s12w400.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF4E4E4E),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          _BulletLine(label: 'Images:', value: 'JPG, PNG, JPEG'),
          _BulletLine(label: 'Documents:', value: 'PDF'),
          _BulletLine(label: 'Spreadsheets:', value: 'XLSX, XLS, CSV'),
          SizedBox(height: 10.h),
          Text(
            'Maximum file size: 10 MB',
            style: AppTextStyles.s12w400.copyWith(
              color: const Color(0xFF4E4E4E),
            ),
          ),
        ],
      ),
    );
  }
}

class _UploadOptionCard extends StatelessWidget {
  const _UploadOptionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xFFE3E3E3), width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 36.r,
                height: 36.r,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: iconColor, size: 20.r),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.s12w400.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: AppTextStyles.s12w400.copyWith(
                        color: const Color(0xFF6A6A6A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Icon(
              Icons.circle,
              size: 8.r,
              color: const Color(0xFF6A6A6A),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.s12w400.copyWith(
                  color: const Color(0xFF6A6A6A),
                ),
                children: [
                  TextSpan(
                    text: '$label ',
                    style: AppTextStyles.s12w400.copyWith(
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF6A6A6A),
                    ),
                  ),
                  TextSpan(text: value),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    required this.title,
    required this.subtitle,
    required this.actionIcon,
    required this.actionLabel,
    required this.placeholderIcon,
    required this.tips,
    this.onPrimaryAction,
    this.previewPath,
  });

  final String title;
  final String subtitle;
  final IconData actionIcon;
  final String actionLabel;
  final IconData placeholderIcon;
  final List<String> tips;
  final VoidCallback? onPrimaryAction;
  final String? previewPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFE9E9E9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.s14w500),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: AppTextStyles.s12w400.copyWith(
              color: const Color(0xFF6A6A6A),
            ),
          ),
          SizedBox(height: 14.h),
          _Placeholder(icon: placeholderIcon, previewPath: previewPath),
          SizedBox(height: 12.h),
          _PrimaryActionButton(
            icon: actionIcon,
            label: actionLabel,
            onPressed: onPrimaryAction ?? () {},
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              const Text('📸'),
              SizedBox(width: 8.w),
              Text(
                'Tips for best results:',
                style: AppTextStyles.s12w400.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF4E4E4E),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          ...tips.map(
            (t) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Icon(
                      Icons.circle,
                      size: 5.r,
                      color: const Color(0xFF6A6A6A),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      t,
                      style: AppTextStyles.s12w400.copyWith(
                        color: const Color(0xFF6A6A6A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.icon, this.previewPath});

  final IconData icon;
  final String? previewPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0D1626), Color(0xFF0A101C)],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: (previewPath != null)
          ? Image.file(
              File(previewPath!),
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Center(
                child: Icon(icon, size: 54.r, color: const Color(0xFF7F8AA0)),
              ),
            )
          : Center(
              child: Icon(icon, size: 54.r, color: const Color(0xFF7F8AA0)),
            ),
    );
  }
}

class _PrimaryActionButton extends StatelessWidget {
  const _PrimaryActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(
          label,
          style: AppTextStyles.s12w400.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFF070B14),
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}

class _RecentUploadsSection extends StatelessWidget {
  final List<UploadOfferResponse> uploads;
  final Function(String) onCheckStatus;

  const _RecentUploadsSection({
    required this.uploads,
    required this.onCheckStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Uploads',
                style: AppTextStyles.s14w500.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${uploads.length} items',
                style: AppTextStyles.s12w400.copyWith(color: AppColors.gray),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Expanded(
            child: ListView.builder(
              itemCount: uploads.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final upload = uploads[index];
                return Container(
                  width: 220.w,
                  margin: EdgeInsets.only(right: 12.w),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: const Color(0xFFE9E9E9)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        upload.originalFilename,
                        style: AppTextStyles.s12w400.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          _StatusBadge(status: upload.status),
                          const Spacer(),
                          Text(
                            upload.createdAt.split('T').first,
                            style: AppTextStyles.s10w200,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 30.h,
                        child: OutlinedButton(
                          onPressed: () => onCheckStatus(upload.uploadId),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.forestGreen,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Check Status',
                            style: AppTextStyles.s10w200.copyWith(
                              color: AppColors.forestGreen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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
    Color color;
    switch (status.toLowerCase()) {
      case 'uploaded':
        color = AppColors.bluePrimary;
        break;
      case 'failed':
        color = AppColors.redError;
        break;
      case 'processing':
        color = AppColors.orangeWarning;
        break;
      default:
        color = AppColors.greenGood;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppTextStyles.s10w200.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
