import '../../../../core/shared/shared.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote.dart';
import '../model/user.dart';

class SignInRepositoryImpl extends SignInRepository {
  final SignInRemoteDataSource remoteDataSource;

  SignInRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.signIn(
        email: email,
        password: password,
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
