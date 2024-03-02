import '../domain/entity/categories.entity.dart';

abstract interface class ICategoryHiveDataSource {
  (Exception?, List<CategoryEntity>) searchAll();
  (Exception?, CategoryEntity) search(CategoryParam param);
  Future<(Exception?, void)> create(CategoryParam param);
  (Exception?, void) delete(CategoryParam param);
  (Exception?, void) update(CategoryParam param);
}
