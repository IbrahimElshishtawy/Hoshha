import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase _loginUseCase;
  final LoginWithGoogleUseCase _loginWithGoogleUseCase;

  AuthCubit({
    required LoginUseCase loginUseCase,
    required LoginWithGoogleUseCase loginWithGoogleUseCase,
  })  : _loginUseCase = loginUseCase,
        _loginWithGoogleUseCase = loginWithGoogleUseCase,
        super(AuthInitial());

  Future<void> loginWithEmail(String email, String password) async {
    emit(AuthLoading());
    final result = await _loginUseCase(
      LoginParams(email: email, password: password),
    );

    if (result.isSuccess) {
      emit(AuthSuccess(result.successValue!));
    } else {
      emit(AuthFailure(result.errorValue!.message));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    final result = await _loginWithGoogleUseCase(NoParams());

    if (result.isSuccess) {
      emit(AuthSuccess(result.successValue!));
    } else {
      emit(AuthFailure(result.errorValue!.message));
    }
  }
}
