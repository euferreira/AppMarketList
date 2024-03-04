import 'package:market_list/src/modules/categories/infra/model/category.model.dart';
import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/shared/hive/adapters/products.hive.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel({
    required super.id,
    required super.name,
    super.category,
    super.image,
    super.observation,
    super.price,
  });

  factory ProductsModel.fromHive(ProductsHive hive) => ProductsModel(
        id: hive.id,
        name: hive.name,
        category: CategoryModel.fromHive(hive.category),
        image: hive.image,
        observation: hive.observation,
        price: hive.price,
      );
}
