import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/modules/categories/domain/icategories.repository.dart';
import 'package:market_list/src/modules/categories/infra/icategories.datasource.dart';

class CategoriesRepository implements ICategoriesRepository {
  final ICategoryHiveDataSource _dataSource;

  CategoriesRepository({required ICategoryHiveDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<(Exception?, void)> create(CategoryParam param) async {
    return await _dataSource.create(param);
  }

  @override
  Future<(Exception?, void)> delete(CategoryParam param) async {
    return _dataSource.delete(param);
  }

  @override
  Future<(Exception?, CategoryEntity)> search(CategoryParam param) async {
    return _dataSource.search(param);
  }

  @override
  Future<(Exception?, List<CategoryEntity>)> searchAll() async {
    return _dataSource.searchAll();
  }

  @override
  Future<(Exception?, void)> update(CategoryParam param) async {
    return _dataSource.update(param);
  }
}
