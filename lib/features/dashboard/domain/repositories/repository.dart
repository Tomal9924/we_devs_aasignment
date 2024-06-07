import 'package:dokan/features/dashboard/domain/entities/product.dart';

import '../../../../core/shared/shared.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> get product;
}
