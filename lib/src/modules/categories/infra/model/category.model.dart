import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/shared/hive/adapters/categories.hive.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    super.icon,
    super.image,
  });

  factory CategoryModel.fromHive(CategoriesHive? hive) {
    return CategoryModel(
      id: hive?.id ?? '',
      name: hive?.name ?? '',
      icon: hive?.icon,
      image: hive?.image,
    );
  }
}
