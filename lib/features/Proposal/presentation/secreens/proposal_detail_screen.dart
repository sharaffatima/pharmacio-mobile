import 'package:flutter/material.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';

class ProposalDetailScreen extends StatelessWidget {
  final int proposalId;

  const ProposalDetailScreen({super.key, required this.proposalId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundBody,
      appBar: CustomAppBar(
        title: 'Proposal Details',
        subtitle: 'ID: $proposalId',
      ),
      body: Center(
        child: Text('Proposal Detail Screen'),
      ),
    );
  }
}
