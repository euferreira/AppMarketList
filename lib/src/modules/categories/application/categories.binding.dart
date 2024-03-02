import 'package:get/get.dart';
import 'package:market_list/src/core/app.binding.dart';
import 'package:market_list/src/modules/categories/application/categories.controller.dart';
import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';
import 'package:market_list/src/modules/categories/domain/usecase/categories_delete.usecase.dart';
import 'package:market_list/src/modules/categories/domain/usecase/categories_post.usecase.dart';
import 'package:market_list/src/modules/categories/domain/usecase/categories_search.usecase.dart';
import 'package:market_list/src/modules/categories/domain/usecase/categories_update.usecase.dart';
import 'package:market_list/src/modules/categories/infra/datasource/categories.hive.datasource.dart';
import 'package:market_list/src/modules/categories/infra/repository/categories.repository.dart';

class CategoriesBinding extends Binding {
  @override
  void dependencies() {
    exports();
    Get.lazyPut(
      () => CategoriesController(
        searchUseCase: Get.find<ICategoriesSearchUseCase>(),
        createUseCase: Get.find<ICategoryCreateUseCase>(),
        updateUseCase: Get.find<ICategoryUpdateUseCase>(),
        deleteUseCase: Get.find<ICategoryDeleteUseCase>(),
      ),
    );
  }

  @override
  void exports() {
    final dataSource = CategoryHiveDatasource();
    final repository = CategoriesRepository(dataSource: dataSource);
    Get.lazyPut<ICategoriesSearchUseCase>(() => CategoriesSearchUseCase(repository: repository));
    Get.lazyPut<ICategoryUpdateUseCase>(() => CategoryUpdateUseCase(repository: repository));
    Get.lazyPut<ICategoryDeleteUseCase>(() => CategoryDeleteUseCase(repository: repository));
    Get.lazyPut<ICategoryCreateUseCase>(() => CategoryCreateUseCase(repository: repository));
  }
}
