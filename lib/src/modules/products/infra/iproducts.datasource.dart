import '../domain/entity/products.entity.dart';

abstract interface class IProductsHiveDataSource {
  (Exception?, List<ProductsEntity>) searchAll();

  (Exception?, ProductsEntity?) searchById(ProductsParams params);

  Future<(Exception?, ProductsEntity)> create(ProductsParams params);

  (Exception?, ProductsEntity?) update(ProductsParams params);

  (Exception?, void) delete(ProductsParams params);
}
