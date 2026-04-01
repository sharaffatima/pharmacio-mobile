import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacio_flutter_mobile/core/networking/error/error_handler/network_exceptions.dart';

import '../../data/models/proposals_response_model.dart';
import '../../data/repos/proposals_repo.dart';

part '../states/proposals_state.dart';
part 'proposals_cubit.freezed.dart';

class ProposalsCubit extends Cubit<ProposalsState> {
  final ProposalsRepo _proposalsRepo;

  ProposalsCubit(this._proposalsRepo) : super(const ProposalsState.initial());

  Future<void> getProposals({required String token}) async {
    emit(const ProposalsState.loading());

    try {
      final proposals = await _proposalsRepo.getProposals(token: token);
      emit(ProposalsState.success(proposals));
    } catch (e) {
      final exception = e is NetworkExceptions
          ? e
          : NetworkExceptions.getException(e);
      emit(ProposalsState.error(NetworkExceptions.getErrorMessage(exception)));
    }
  }
}
