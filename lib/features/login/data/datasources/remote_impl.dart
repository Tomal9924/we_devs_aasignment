import 'dart:convert';

import '../../../../core/shared/shared.dart';
import '../model/user.dart';
import 'remote.dart';

class SignInRemoteDataSourceImpl extends SignInRemoteDataSource {
  final Client client;

  SignInRemoteDataSourceImpl({required this.client});

  @override
  Future<User> signIn({
    final String? email,
    final String? password,
  }) async {
    try {
      Map<String, dynamic> body = {
        "username": email ?? "",
        "password": password ?? "",
      };
      final response = await client.post(
        ApiConstants.url(api: ApiConstants.login),
        body: body,
      );

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> result = json.decode(response.body);
        return User.fromJson(result);
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
