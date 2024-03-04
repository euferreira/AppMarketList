import 'package:get/get.dart';
import 'package:market_list/src/core/app.binding.dart';
import 'package:market_list/src/modules/categories/application/categories.binding.dart';
import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';
import 'package:market_list/src/modules/products/application/products.controller.dart';
import 'package:market_list/src/modules/products/domain/iproducts.usecase.dart';
import 'package:market_list/src/modules/products/domain/usecase/products_create.usecase.dart';
import 'package:market_list/src/modules/products/domain/usecase/products_delete.usecase.dart';
import 'package:market_list/src/modules/products/domain/usecase/products_search.usecase.dart';
import 'package:market_list/src/modules/products/domain/usecase/products_update.usecase.dart';
import 'package:market_list/src/modules/products/infra/datasource/products.hive.datasource.dart';
import 'package:market_list/src/modules/products/infra/repository/products.repository.dart';

class ProductsBinding extends Binding {
  @override
  void dependencies() {
    exports();
    Get.lazyPut(
      () => ProductsController(
        productsSearchRepository: Get.find<IProductsSearchUseCase>(),
        categoriesSearchRepository: Get.find<ICategoriesSearchUseCase>(),
        productsCreateRepository: Get.find<IProductsCreateUseCase>(),
        productsUpdateRepository: Get.find<IProductsUpdateUseCase>(),
        productsDeleteRepository: Get.find<IProductsDeleteUseCase>(),
      ),
    );
  }

  @override
  void exports() {
    CategoriesBinding().exports();

    final dataSource = ProductsHiveDataSource();
    final repository = ProductsRepository(dataSource: dataSource);
    Get.lazyPut<IProductsDeleteUseCase>(() => ProductsDeleteUseCase(repository: repository));
    Get.lazyPut<IProductsUpdateUseCase>(() => ProductsUpdateUseCase(repository: repository));
    Get.lazyPut<IProductsCreateUseCase>(() => ProductsCreateUseCase(repository: repository));
    Get.lazyPut<IProductsSearchUseCase>(() => ProductsSearchUseCase(repository: repository));
  }
}
