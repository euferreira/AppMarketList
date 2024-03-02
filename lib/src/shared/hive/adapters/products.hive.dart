import 'package:hive/hive.dart';
import 'package:market_list/src/shared/hive/constants/hive.consts.dart';

import 'categories.hive.dart';

part 'products.hive.g.dart';

@HiveType(typeId: HiveId.products)
class ProductsHive extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double? price;

  @HiveField(3)
  CategoriesHive? category;

  @HiveField(4)
  String? image;

  @HiveField(5)
  String? observation;

  ProductsHive({
    required this.id,
    required this.name,
    this.price,
    this.category,
    this.image,
    this.observation,
  });
}
