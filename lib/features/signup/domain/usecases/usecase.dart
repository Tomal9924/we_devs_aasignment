import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';
import '../repositories/repository.dart';

class SignUpUseCase {
  final SignUpRepository repository;
  SignUpUseCase({required this.repository});

  Future<Either<Failure, void>> call({
    required String email,
    required String name,
    required String password,
  }) async {
    return await repository.signUp(
      email: email,
      name: name,
      password: password,
    );
  }
}
