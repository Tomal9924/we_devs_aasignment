abstract class SignInRemoteDataSource {
  Future<void> signIn({
    final String email,
    final String password,
  });
}
