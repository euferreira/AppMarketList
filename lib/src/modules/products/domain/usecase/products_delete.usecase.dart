import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/modules/products/domain/iproducts.usecase.dart';

import '../iproducts.repository.dart';

class ProductsDeleteUseCase implements IProductsDeleteUseCase {
  final IProductsRepository _repository;

  ProductsDeleteUseCase({
    required IProductsRepository repository,
  }) : _repository = repository;

  @override
  (Exception?, void) call(ProductsParams params) {
    return _repository.delete(params);
  }
}
