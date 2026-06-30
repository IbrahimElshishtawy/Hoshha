import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithGoogleUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  LoginWithGoogleUseCase(this.repository);

  @override
  Future<Result<UserEntity, Failure>> call(NoParams params) {
    return repository.loginWithGoogle();
  }
}
