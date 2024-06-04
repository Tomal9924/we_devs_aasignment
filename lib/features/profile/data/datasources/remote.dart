import 'package:dokan/features/profile/data/model/profile.dart';

abstract class ProfileRemoteDataSource {
  Future<void> update({
    required String firstName,
    required String lastName,
    required String id,
  });
  Future<ProfileModel> fetch({
    required String token,
  });
}
