import '../../../../core/shared/shared.dart';
import '../../signup.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.signUp(
        email: email,
        name: name,
        password: password,
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
