import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/repos/proposals_repo.dart';
import '../states/proposals_state.dart';

class ProposalsCubit extends Cubit<ProposalsState> {
  final ProposalsRepo proposalsRepo;

  ProposalsCubit(this.proposalsRepo) : super(const ProposalsState.initial());

  Future<void> getAvailableOffers() async {
    emit(const ProposalsState.availableOffersLoading());
    try {
      final response = await proposalsRepo.getAvailableOffers();
      emit(ProposalsState.availableOffersSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }

  Future<void> compareOffers(List<int> ocrResultIds) async {
    if (ocrResultIds.length < 2) {
      emit(const ProposalsState.error("Please select at least 2 offers to compare."));
      return;
    }
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.compareOffers(ocrResultIds: ocrResultIds);
      emit(ProposalsState.compareSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }

  Future<void> generateProposal(List<int> ocrResultIds) async {
    if (ocrResultIds.isEmpty) {
      emit(const ProposalsState.error("Please select offers to generate a proposal."));
      return;
    }
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.generateProposal(ocrResultIds: ocrResultIds);
      emit(ProposalsState.generateSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }

  Future<void> getProposals() async {
    emit(const ProposalsState.proposalsLoading());
    try {
      final response = await proposalsRepo.getProposals();
      emit(ProposalsState.proposalsSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }

  Future<void> getProposalDetail(int proposalId) async {
    emit(const ProposalsState.proposalDetailLoading());
    try {
      final response = await proposalsRepo.getProposalDetail(proposalId: proposalId);
      emit(ProposalsState.proposalDetailSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }

  Future<void> approveProposal(int proposalId) async {
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.approveProposal(proposalId: proposalId);
      emit(ProposalsState.approveSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }

  Future<void> rejectProposal(int proposalId) async {
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.rejectProposal(proposalId: proposalId);
      emit(ProposalsState.rejectSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }

  Future<void> getProposalStatus(int proposalId) async {
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.getProposalStatus(proposalId: proposalId);
      emit(ProposalsState.statusSuccess(response));
    } catch (e) {
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(e as NetworkExceptions)));
    }
  }
}

