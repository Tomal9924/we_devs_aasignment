import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';
import '../repositories/repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;
  UpdateProfileUseCase({required this.repository});

  Future<Either<Failure, void>> call({
    required String firstName,
    required String lastName,
    required String id,
    required String token,
  }) async {
    return await repository.update(
      firstName: firstName,
      lastName: lastName,
      id: id,
      token: token,
    );
  }
}
