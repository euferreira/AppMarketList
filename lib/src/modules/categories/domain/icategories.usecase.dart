import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';

abstract interface class ICategoriesSearchUseCase {
  Future<(Exception?, List<CategoryEntity>)> searchCategories();

  Future<(Exception?, CategoryEntity?)> searchCategory(CategoryParam param);
}

abstract interface class ICategoryCreateUseCase {
  Future<(Exception?, void)> createCategory(CategoryParam param);
}

abstract interface class ICategoryDeleteUseCase {
  Future<(Exception?, void)> deleteCategory(CategoryParam param);
}

abstract interface class ICategoryUpdateUseCase {
  Future<(Exception?, void)> updateCategory(CategoryParam param);
}
