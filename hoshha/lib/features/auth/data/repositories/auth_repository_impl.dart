import '../../../../core/error/failure.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<UserEntity, Failure>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(user);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity, Failure>> loginWithGoogle() async {
    try {
      final user = await remoteDataSource.loginWithGoogle();
      return Success(user);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<UserEntity, Failure>> loginWithApple() async {
    try {
      final user = await remoteDataSource.loginWithApple();
      return Success(user);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}
