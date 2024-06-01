import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../../../core/shared/error/failure.dart';
import '../../../../core/shared/network/api_constants.dart';
import 'remote.dart';

class SignUpRemoteDataSourceImpl extends SignUpRemoteDataSource {
  final Client client;

  SignUpRemoteDataSourceImpl({required this.client});

  @override
  Future<void> signUp({
    final String? email,
    final String? name,
    final String? password,
  }) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      Map<String, dynamic> body = {
        "username": name ?? "",
        "email": email ?? "",
        "password": password ?? "",
      };
      final response = await client.post(
        ApiConstants.url(api: ApiConstants.signUp),
        headers: headers,
        body: json.encoder.convert(body).trim(),
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
