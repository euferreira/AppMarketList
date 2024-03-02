import 'package:hive/hive.dart';
import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/modules/categories/infra/icategories.datasource.dart';
import 'package:market_list/src/modules/categories/infra/model/category.model.dart';
import 'package:market_list/src/shared/hive/adapters/categories.hive.dart';
import 'package:market_list/src/shared/hive/constants/hive.consts.dart';

class CategoryHiveDatasource implements ICategoryHiveDataSource {
  @override
  (Exception?, List<CategoryEntity>) searchAll() {
    final box = Hive.box<CategoriesHive>(HiveName.categories);
    final categories = box.values;

    return categories.isEmpty
        ? (Exception('No categories found'), [])
        : (null, categories.map((e) => CategoryModel.fromHive(e)).toList());
  }

  @override
  Future<(Exception?, void)> create(CategoryParam param) async {
    final box = Hive.box<CategoriesHive>(HiveName.categories);
    final category = CategoriesHive(
      id: param.id ?? box.length.toString(),
      name: param.name ?? '',
      icon: param.icon,
      image: param.image,
    );

    final result = await box.add(category);

    return result == -1 ? (Exception('Error creating category'), null) : (null, null);
  }

  @override
  (Exception?, void) delete(CategoryParam param) {
    final box = Hive.box<CategoriesHive>(HiveName.categories);
    final category = box.values.firstWhere(
      (element) => element.id == param.id,
      orElse: () => CategoriesHive(
        name: '',
        id: '',
      ),
    );
    if (category.id.isEmpty) {
      return (Exception('Category not found'), null);
    }

    box.delete(category.key);

    return (null, null);
  }

  @override
  (Exception?, CategoryEntity) search(CategoryParam param) {
    final box = Hive.box<CategoriesHive>(HiveName.categories);
    final category = box.values.firstWhere(
      (element) => element.id == param.id,
      orElse: () => CategoriesHive(
        name: '',
        id: '',
      ),
    );

    return category.id.isEmpty
        ? (Exception('Category not found'), CategoryModel.fromHive(category))
        : (null, CategoryModel.fromHive(category));
  }

  @override
  (Exception?, void) update(CategoryParam param) {
    final box = Hive.box<CategoriesHive>(HiveName.categories);
    final category = box.values.firstWhere(
      (element) => element.id == param.id,
      orElse: () => CategoriesHive(
        name: '',
        id: '',
      ),
    );
    if (category.id.isEmpty) {
      return (Exception('Category not found'), null);
    }

    final newCategory = CategoriesHive(
      id: param.id ?? category.id,
      name: param.name ?? category.name,
      icon: param.icon ?? category.icon,
      image: param.image ?? category.image,
    );

    box.put(category.key, newCategory);

    return (null, null);
  }
}
