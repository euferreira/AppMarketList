import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/modules/products/domain/iproducts.usecase.dart';

import '../iproducts.repository.dart';

class ProductsCreateUseCase implements IProductsCreateUseCase {
  final IProductsRepository _repository;

  ProductsCreateUseCase({
    required IProductsRepository repository,
  }) : _repository = repository;

  @override
  Future<(Exception?, ProductsEntity)> call(ProductsParams params) async {
    return await _repository.create(params);
  }
}
