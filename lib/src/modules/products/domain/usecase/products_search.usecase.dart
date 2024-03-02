import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/modules/products/domain/iproducts.repository.dart';
import 'package:market_list/src/modules/products/domain/iproducts.usecase.dart';

class ProductsSearchUseCase implements IProductsSearchUseCase {
  final IProductsRepository _repository;

  ProductsSearchUseCase({
    required IProductsRepository repository,
  }) : _repository = repository;

  @override
  (Exception?, List<ProductsEntity>) searchAll() {
    return _repository.searchAll();
  }

  @override
  (Exception?, ProductsEntity?) searchById(ProductsParams params) {
    if (params.id == null) {
      return (Exception('Id is required'), null);
    }

    return _repository.searchById(params);
  }
}
