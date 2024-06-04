import 'package:either_dart/either.dart';

import '../../../../core/shared/error/failure.dart';
import '../../data/model/profile.dart';
import '../repositories/repository.dart';

class ProfileUseCase {
  final ProfileRepository repository;
  ProfileUseCase({required this.repository});

  Future<Either<Failure, ProfileModel>> call({
    required String token,
  }) async {
    return await repository.fetch(
      token: token,
    );
  }
}
