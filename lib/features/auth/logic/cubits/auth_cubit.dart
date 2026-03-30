import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/models/login_request_body.dart';
import 'package:pharmacio_flutter_mobile/features/auth/data/repos/auth_repo.dart';
import 'package:pharmacio_flutter_mobile/features/auth/logic/states/login_state.dart';

class AuthCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(LoginState.initial());

  void registerDataUser(LoginRequestBody loginRequestBody) async {
    emit(LoginState.initial());
    var result = await _authRepo.register(loginRequestBody);
    result.fold(
      (error) {
        emit(LoginState.error(error: error.message));
      },
      (data) {
        emit(LoginState.success(data));
      },
    );
  }
}
