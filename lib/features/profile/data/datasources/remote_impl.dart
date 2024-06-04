import 'dart:convert';

import 'package:dokan/features/profile/data/model/profile.dart';

import '../../../../core/shared/shared.dart';
import 'remote.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final Client client;

  ProfileRemoteDataSourceImpl({required this.client});

  @override
  Future<void> update({
    required String firstName,
    required String lastName,
    required String id,
    required String token,
  }) async {
    try {
      Map<String, dynamic> body = {
        "first_name": firstName,
        "last_name": lastName,
      };
      Map<String, String> headers = {
         "Authorization": "Bearer $token",
      };
      final response = await client.post(
        ApiConstants.url(api: "${ApiConstants.update}$id"),
        headers: headers,
        body: body,
      );

      if (response.statusCode == HttpStatus.ok) {
        return;
      } else if (response.statusCode == HttpStatus.internalServerError) {
        throw const InternalServerFailure();
      } else {
        throw const ServerRequestFailure();
      }
    } on Failure catch (e) {
      throw ServerRequestFailure(message: e.toString());
    } catch (e) {
      throw ServerRequestFailure(message: e.toString());
    }
  }

  @override
  Future<ProfileModel> fetch({
    required String token,
  }) async {
    try {
      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      final response = await client.post(
        ApiConstants.url(api: ApiConstants.profile),
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return ProfileModel.fromJson(json.decode(response.body));
      } else if (response.statusCode == HttpStatus.internalServerError) {
        throw const InternalServerFailure();
      } else {
        throw const ServerRequestFailure();
      }
    } on Failure catch (e) {
      throw ServerRequestFailure(message: e.toString());
    } catch (e) {
      throw ServerRequestFailure(message: e.toString());
    }
  }
}
