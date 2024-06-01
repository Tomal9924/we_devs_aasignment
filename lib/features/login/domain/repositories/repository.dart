import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';

abstract class SignInRepository {
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  });
}
