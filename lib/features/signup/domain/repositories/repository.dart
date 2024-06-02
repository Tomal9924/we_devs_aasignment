import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';

abstract class SignUpRepository {
  Future<Either<Failure, void>> signUp({
    required String email,
    required String name,
    required String password,
  });
}
