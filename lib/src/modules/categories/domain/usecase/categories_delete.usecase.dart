import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';

import '../entity/categories.entity.dart';
import '../icategories.repository.dart';

class CategoryDeleteUseCase implements ICategoryDeleteUseCase {
  final ICategoriesRepository _repository;

  CategoryDeleteUseCase({required ICategoriesRepository repository}) : _repository = repository;

  @override
  Future<(Exception?, void)> deleteCategory(CategoryParam param) async {
    if (param.id == null) {
      return (Exception('Id is required'), null);
    }

    return await _repository.delete(param);
  }
}
