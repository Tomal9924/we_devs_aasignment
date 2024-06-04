import 'package:dokan/features/profile/data/model/profile.dart';

import '../../../../core/shared/shared.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> update({
    required String firstName,
    required String lastName,
    required String id,
    required String token,
  }) async {
    try {
      final result = await remoteDataSource.update(
        firstName: firstName,
        lastName: lastName,
        id: id,
        token: token,
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> fetch({
    required String token,
  }) async {
    try {
      final result = await remoteDataSource.fetch(token: token);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
