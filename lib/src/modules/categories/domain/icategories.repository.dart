import 'entity/categories.entity.dart';

abstract interface class ICategoriesRepository {
  Future<(Exception?, List<CategoryEntity>)> searchAll();
  Future<(Exception?, CategoryEntity)> search(CategoryParam param);
  Future<(Exception?, void)> create(CategoryParam param);
  Future<(Exception?, void)> delete(CategoryParam param);
  Future<(Exception?, void)> update(CategoryParam param);
}
