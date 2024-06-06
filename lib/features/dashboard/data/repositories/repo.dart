import 'package:dokan/features/dashboard/domain/entities/product.dart';

import '../../../../core/shared/shared.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/remote.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource local;

  ProductRepositoryImpl({
    required this.local,
  });

  @override
  Future<Either<Failure, List<Product>>> get product async {
    try {
      final List<Product> fixtures = await local.fetch;
      return Right(fixtures);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
