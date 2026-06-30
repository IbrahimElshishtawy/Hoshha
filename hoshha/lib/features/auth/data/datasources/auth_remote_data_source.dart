import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> loginWithGoogle();
  Future<UserModel> loginWithApple();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // Simulate network latency
    await Future.delayed(const Duration(seconds: 1));
    if (email == "error@test.com") {
      throw Exception("Invalid credentials");
    }
    return UserModel(
      id: "mock-uid-123",
      email: email,
      name: email.split('@').first,
    );
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(
      id: "google-uid-123",
      email: "google.user@gmail.com",
      name: "Google User",
    );
  }

  @override
  Future<UserModel> loginWithApple() async {
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(
      id: "apple-uid-123",
      email: "apple.user@icloud.com",
      name: "Apple User",
    );
  }
}
