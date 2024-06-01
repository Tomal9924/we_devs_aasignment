import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';
import '../repositories/repository.dart';

class SignInUseCase {
  final SignInRepository repository;
  SignInUseCase({required this.repository});

  Future<Either<Failure, void>> call({
    required String email,
    required String password,
  }) async {
    return await repository.signIn(
      email: email,
      password: password,
    );
  }
}
