import 'package:flutter/widgets.dart';

class CategoryEntity {
  final String id;
  String name;
  IconData? icon;
  String? image;

  CategoryEntity({
    required this.id,
    required this.name,
    this.icon,
    this.image,
  });
}

class CategoryParam {
  final String? id;
  final String? name;
  final IconData? icon;
  final String? image;

  CategoryParam({
    this.id,
    this.name,
    this.icon,
    this.image,
  });
}
