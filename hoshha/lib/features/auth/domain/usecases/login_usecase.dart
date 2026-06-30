import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Result<UserEntity, Failure>> call(LoginParams params) {
    return repository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}
