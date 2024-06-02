import 'dart:convert';

import '../../../../core/shared/shared.dart';
import 'remote.dart';

class SignInRemoteDataSourceImpl extends SignInRemoteDataSource {
  final Client client;

  SignInRemoteDataSourceImpl({required this.client});

  @override
  Future<void> signIn({
    final String? email,
    final String? password,
  }) async {
    try {
      final response = await client.post(
        ApiConstants.url(
          api: "${ApiConstants.login}?username=$email&password=$password",
        ),
      );

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> result = json.decode(response.body);
        if (result['code'] == 200) {
          return;
        } else {
          throw const ServerRequestFailure();
        }
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
