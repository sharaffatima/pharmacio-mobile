import 'package:flutter/material.dart';
import 'package:pharmacio_flutter_mobile/core/constants/colors.dart';
import 'package:pharmacio_flutter_mobile/core/constants/strings.dart';
import 'package:pharmacio_flutter_mobile/core/public_widgets/custom_app_bar.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/secreens/available_offers_screen.dart';
import 'package:pharmacio_flutter_mobile/features/proposal/presentation/widget/proposals_tab.dart';

class ProposalScreen extends StatelessWidget {
  const ProposalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backGroundBody,
        appBar: CustomAppBar(
          title: AppStrings.proposalTitle,
          subtitle: AppStrings.proposalSubTitle,
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.backGroundBody,
              child: TabBar(
                labelColor: AppColors.textPrimary,
                unselectedLabelColor: AppColors.textSecondary,
                indicatorColor: AppColors.textPrimary,
                tabs: [
                  Tab(text: AppStrings.availableOffers),
                  Tab(text: AppStrings.proposals),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [AvailableOffersTab(), ProposalsTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
