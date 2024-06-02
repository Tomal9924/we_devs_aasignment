import 'package:dokan/features/login/data/model/user.dart';
import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';

abstract class SignInRepository {
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });
}
