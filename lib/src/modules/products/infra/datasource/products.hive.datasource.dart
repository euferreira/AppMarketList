import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/modules/products/infra/iproducts.datasource.dart';

class ProductsHiveDataSource implements IProductsHiveDataSource {
  @override
  Future<(Exception?, ProductsEntity)> create(ProductsParams params) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  (Exception?, void) delete(ProductsParams params) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  (Exception?, List<ProductsEntity>) searchAll() {
    // TODO: implement searchAll
    throw UnimplementedError();
  }

  @override
  (Exception?, ProductsEntity?) searchById(ProductsParams params) {
    // TODO: implement searchById
    throw UnimplementedError();
  }

  @override
  (Exception?, ProductsEntity?) update(ProductsParams params) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
