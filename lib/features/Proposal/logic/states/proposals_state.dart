import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/available_offers_response.dart';
import '../../data/models/proposal_placeholders.dart';

part 'proposals_state.freezed.dart';

@freezed
class ProposalsState with _$ProposalsState {
  const factory ProposalsState.initial() = _Initial;
  
  // Available Offers
  const factory ProposalsState.availableOffersLoading() = AvailableOffersLoading;
  const factory ProposalsState.availableOffersSuccess(AvailableOffersResponse response) = AvailableOffersSuccess;
  
  // Proposals List
  const factory ProposalsState.proposalsLoading() = ProposalsLoading;
  const factory ProposalsState.proposalsSuccess(ProposalListResponse response) = ProposalsSuccess;
  
  // Proposal Detail
  const factory ProposalsState.proposalDetailLoading() = ProposalDetailLoading;
  const factory ProposalsState.proposalDetailSuccess(ProposalDetailResponse response) = ProposalDetailSuccess;

  // Actions (Compare, Generate, Approve, Reject, Status)
  const factory ProposalsState.actionLoading() = ActionLoading;
  const factory ProposalsState.compareSuccess(CompareResponse response) = CompareSuccess;
  const factory ProposalsState.generateSuccess(GenerateProposalResponse response) = GenerateSuccess;
  const factory ProposalsState.approveSuccess(ProposalActionResponse response) = ApproveSuccess;
  const factory ProposalsState.rejectSuccess(ProposalActionResponse response) = RejectSuccess;
  const factory ProposalsState.statusSuccess(ProposalStatusResponse response) = StatusSuccess;
  
  const factory ProposalsState.error(String message) = ProposalsError;
}
