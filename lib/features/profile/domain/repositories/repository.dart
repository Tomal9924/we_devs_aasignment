import 'package:dokan/features/profile/data/model/profile.dart';
import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> update({
    required String firstName,
    required String lastName,
    required String id,
    required String token,
  });
  Future<Either<Failure, ProfileModel>> fetch({
    required String token,
  });
}
