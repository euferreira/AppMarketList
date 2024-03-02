import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';

class ProductsEntity {
  final String id;
  String name;
  double? price;
  CategoryEntity? category;
  String? image;
  String? observation;

  ProductsEntity({
    required this.id,
    required this.name,
    this.price,
    this.category,
    this.image,
    this.observation,
  });
}

class ProductsParams {
  final String? id;
  final String? name;
  final double? price;
  final CategoryEntity? category;
  final String? image;
  final String? observation;

  ProductsParams({
    this.id,
    this.name,
    this.price,
    this.category,
    this.image,
    this.observation,
  });
}
