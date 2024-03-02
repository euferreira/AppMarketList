import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/modules/products/domain/iproducts.usecase.dart';

import '../iproducts.repository.dart';

class ProductsUpdateUseCase implements IProductsUpdateUseCase {
  final IProductsRepository _repository;

  ProductsUpdateUseCase({
    required IProductsRepository repository,
  }) : _repository = repository;

  @override
  (Exception?, ProductsEntity?) call(ProductsParams params) {
    if (params.id == null) {
      return (Exception('Id is required'), null);
    }

    return _repository.update(params);
  }
}
