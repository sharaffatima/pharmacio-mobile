import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/available_offers_response.dart';
import '../../data/models/proposal_placeholders.dart';
import '../../data/repos/proposals_repo.dart';
import '../states/proposals_state.dart';

class ProposalsCubit extends Cubit<ProposalsState> {
  final ProposalsRepo proposalsRepo;

  ProposalsCubit(this.proposalsRepo)
    : selectedOfferIds = ValueNotifier<Set<int>>(<int>{}),
      isProposalSelectionMode = ValueNotifier<bool>(false),
      selectedProposalIds = ValueNotifier<Set<int>>(<int>{}),
      super(const ProposalsState.initial());

  final ValueNotifier<Set<int>> selectedOfferIds;
  final ValueNotifier<bool> isProposalSelectionMode;
  final ValueNotifier<Set<int>> selectedProposalIds;
  AvailableOffersResponse? cachedAvailableOffers;
  ProposalListResponse? cachedProposals;
  CompareResponse? cachedCompareResponse;
  List<int> lastComparedOfferIds = const [];

  void toggleOfferSelection(int id, bool selected) {
    final current = Set<int>.from(selectedOfferIds.value);
    if (selected) {
      current.add(id);
    } else {
      current.remove(id);
    }
    selectedOfferIds.value = current;
  }

  void clearSelection() {
    selectedOfferIds.value = <int>{};
  }

  void enterProposalSelectionMode() {
    isProposalSelectionMode.value = true;
  }

  void exitProposalSelectionMode() {
    selectedProposalIds.value = <int>{};
    isProposalSelectionMode.value = false;
  }

  void toggleProposalSelection(int id) {
    final current = Set<int>.from(selectedProposalIds.value);
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    selectedProposalIds.value = current;
    if (current.isEmpty) {
      isProposalSelectionMode.value = false;
    }
  }

  Future<void> exportPdfProposals(List<int> ids) async {
    emit(const ProposalsState.pdfLoading());
    try {
      final filePath = await proposalsRepo.exportPdf(ids);
      emit(ProposalsState.pdfSuccess(filePath));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> getAvailableOffers() async {
    emit(const ProposalsState.availableOffersLoading());
    try {
      final response = await proposalsRepo.getAvailableOffers();
      cachedAvailableOffers = response;
      emit(ProposalsState.availableOffersSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> compareOffers(List<int> ocrResultIds) async {
    if (ocrResultIds.length < 1) {
      emit(
        const ProposalsState.error(
          "Please select at least 2 offers to compare.",
        ),
      );
      return;
    }
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.compareOffers(
        ocrResultIds: ocrResultIds,
      );
      cachedCompareResponse = response;
      lastComparedOfferIds = List<int>.from(ocrResultIds);
      emit(ProposalsState.compareSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> generateProposal(List<int> ocrResultIds) async {
    if (ocrResultIds.isEmpty) {
      emit(
        const ProposalsState.error(
          "Please select offers to generate a proposal.",
        ),
      );
      return;
    }
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.generateProposal(
        ocrResultIds: ocrResultIds,
      );
      emit(ProposalsState.generateSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> getProposals() async {
    emit(const ProposalsState.proposalsLoading());
    try {
      final response = await proposalsRepo.getProposals();
      cachedProposals = response;
      emit(ProposalsState.proposalsSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> getProposalDetail(int proposalId) async {
    emit(const ProposalsState.proposalDetailLoading());
    try {
      final response = await proposalsRepo.getProposalDetail(
        proposalId: proposalId,
      );
      emit(ProposalsState.proposalDetailSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> approveProposal(int proposalId) async {
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.approveProposal(
        proposalId: proposalId,
      );
      emit(ProposalsState.approveSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> rejectProposal(int proposalId) async {
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.rejectProposal(
        proposalId: proposalId,
      );
      emit(ProposalsState.rejectSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  Future<void> getProposalStatus(int proposalId) async {
    emit(const ProposalsState.actionLoading());
    try {
      final response = await proposalsRepo.getProposalStatus(
        proposalId: proposalId,
      );
      emit(ProposalsState.statusSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }

  @override
  Future<void> close() {
    selectedOfferIds.dispose();
    isProposalSelectionMode.dispose();
    selectedProposalIds.dispose();
    return super.close();
  }
}
