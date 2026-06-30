import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity, Failure>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<UserEntity, Failure>> loginWithGoogle();
  Future<Result<UserEntity, Failure>> loginWithApple();
}
