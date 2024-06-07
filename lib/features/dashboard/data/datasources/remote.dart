import 'package:dokan/features/dashboard/domain/entities/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> get fetch;
}
