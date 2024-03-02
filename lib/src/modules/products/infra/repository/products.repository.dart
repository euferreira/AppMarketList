import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/modules/products/domain/iproducts.repository.dart';
import 'package:market_list/src/modules/products/infra/iproducts.datasource.dart';

class ProductsRepository implements IProductsRepository {
  final IProductsHiveDataSource _dataSource;

  ProductsRepository({
    required IProductsHiveDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<(Exception?, ProductsEntity)> create(ProductsParams params) async {
    return await _dataSource.create(params);
  }

  @override
  (Exception?, void) delete(ProductsParams params) {
    return _dataSource.delete(params);
  }

  @override
  (Exception?, List<ProductsEntity>) searchAll() {
    return _dataSource.searchAll();
  }

  @override
  (Exception?, ProductsEntity?) searchById(ProductsParams params) {
    return _dataSource.searchById(params);
  }

  @override
  (Exception?, ProductsEntity?) update(ProductsParams params) {
    return _dataSource.update(params);
  }
}
