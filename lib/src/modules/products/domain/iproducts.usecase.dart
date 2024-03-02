import 'entity/products.entity.dart';

abstract interface class IProductsSearchUseCase {
  (Exception?, List<ProductsEntity>) searchAll();

  (Exception?, ProductsEntity?) searchById(ProductsParams params);
}

abstract interface class IProductsCreateUseCase {
  Future<(Exception?, ProductsEntity)> call(ProductsParams params);
}

abstract interface class IProductsUpdateUseCase {
  (Exception?, ProductsEntity?) call(ProductsParams params);
}

abstract interface class IProductsDeleteUseCase {
  (Exception?, void) call(ProductsParams params);
}
