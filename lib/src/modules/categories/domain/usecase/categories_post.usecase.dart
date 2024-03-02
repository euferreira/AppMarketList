import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';

import '../entity/categories.entity.dart';
import '../icategories.repository.dart';

class CategoryCreateUseCase implements ICategoryCreateUseCase {
  final ICategoriesRepository _repository;

  CategoryCreateUseCase({required ICategoriesRepository repository}) : _repository = repository;

  @override
  Future<(Exception?, void)> createCategory(CategoryParam param) async {
    if (param.id == null) {
      return (Exception('Id must be null'), null);
    }

    return await _repository.create(param);
  }
}
