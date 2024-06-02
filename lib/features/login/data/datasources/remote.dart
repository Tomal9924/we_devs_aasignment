import '../model/user.dart';

abstract class SignInRemoteDataSource {
  Future<User> signIn({
    final String email,
    final String password,
  });
}
