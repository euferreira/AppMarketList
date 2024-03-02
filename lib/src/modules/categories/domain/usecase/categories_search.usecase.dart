import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/modules/categories/domain/icategories.repository.dart';
import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';

class CategoriesSearchUseCase implements ICategoriesSearchUseCase {
  final ICategoriesRepository _repository;

  CategoriesSearchUseCase({required ICategoriesRepository repository}) : _repository = repository;

  @override
  Future<(Exception?, List<CategoryEntity>)> searchCategories() async {
    return await _repository.searchAll();
  }

  @override
  Future<(Exception?, CategoryEntity?)> searchCategory(CategoryParam param) async {
    return param.id == null ? (Exception('Id is required'), null) : await _repository.search(param);
  }
}
