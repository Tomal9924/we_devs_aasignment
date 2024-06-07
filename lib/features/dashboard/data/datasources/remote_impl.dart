import 'dart:convert';

import '../../../../core/shared/shared.dart';
import '../../domain/entities/product.dart';
import 'remote.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Product>> get fetch async {
    try {
      final String payload = await rootBundle.loadString(
        "assets/product.json",
      );
      final Response response = Response(payload, HttpStatus.ok);
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> result = json.decode(response.body);

        final List<Product?> products = result.map(
          (map) {
            try {
              return Product.fromJson(
                Map<String, dynamic>.from(map),
              );
            } catch (e) {
              return null;
            }
          },
        ).toList();

        return products.whereType<Product>().toList();
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
