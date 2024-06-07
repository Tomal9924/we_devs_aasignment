import 'package:dokan/features/dashboard/domain/entities/product.dart';

import '../../../../core/shared/shared.dart';
import '../repositories/repository.dart';

class ProductUseCase {
  final ProductRepository repository;
  ProductUseCase({required this.repository});

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.product;
  }
}
