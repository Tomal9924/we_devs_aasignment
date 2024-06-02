abstract class SignUpRemoteDataSource {
  Future<void> signUp({
    final String email,
    final String name,
    final String password,
  });
}
