import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

import '../constants/hive.consts.dart';

part 'categories.hive.g.dart';

@HiveType(typeId: HiveId.categories)
class CategoriesHive extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  IconData? icon;

  @HiveField(2)
  String? image;

  @HiveField(3)
  final String id;

  CategoriesHive({
    required this.name,
    this.icon,
    this.image,
    required this.id,
  });
}
