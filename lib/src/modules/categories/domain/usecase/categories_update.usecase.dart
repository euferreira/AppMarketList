import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/modules/categories/domain/icategories.repository.dart';
import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';

class CategoryUpdateUseCase implements ICategoryUpdateUseCase {
  final ICategoriesRepository _repository;

  CategoryUpdateUseCase({required ICategoriesRepository repository}) : _repository = repository;

  @override
  Future<(Exception?, void)> updateCategory(CategoryParam param) async {
    if (param.id == null) {
      return (Exception('Id is required'), null);
    }

    return await _repository.update(param);
  }
}
