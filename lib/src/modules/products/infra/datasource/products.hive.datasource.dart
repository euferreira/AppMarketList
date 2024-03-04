import 'package:hive_flutter/adapters.dart';
import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:market_list/src/modules/products/infra/iproducts.datasource.dart';
import 'package:market_list/src/modules/products/infra/model/products.model.dart';
import 'package:market_list/src/shared/hive/adapters/categories.hive.dart';
import 'package:market_list/src/shared/hive/adapters/products.hive.dart';
import 'package:market_list/src/shared/hive/constants/hive.consts.dart';
import 'package:uuid/uuid.dart';

class ProductsHiveDataSource implements IProductsHiveDataSource {
  @override
  Future<(Exception?, ProductsEntity)> create(ProductsParams params) async {
    final box = Hive.box<ProductsHive>(HiveName.products);
    final product = ProductsHive(
      id: params.id ?? const Uuid().v4(),
      name: params.name ?? '',
      price: params.price,
      observation: params.observation,
      category: CategoriesHive(
        id: params.category?.id ?? const Uuid().v4(),
        name: params.category?.name ?? '',
        icon: params.category?.icon,
        image: params.category?.image,
      ),
      image: params.image,
    );
    await box.add(product);
    return (null, ProductsModel.fromHive(product));
  }

  @override
  (Exception?, void) delete(ProductsParams params) {
    final box = Hive.box<ProductsHive>(HiveName.products);
    final product = box.values.firstWhere(
      (element) => element.id == params.id,
      orElse: () => ProductsHive(
        name: '',
        id: '',
      ),
    );
    if (product.id.isEmpty) {
      return (Exception('Product not found'), null);
    }

    box.delete(product.key);

    return (null, null);
  }

  @override
  (Exception?, List<ProductsEntity>) searchAll() {
    final box = Hive.box<ProductsHive>(HiveName.products);
    final products = box.values;
    return products.isEmpty
        ? (Exception('No products found'), [])
        : (null, products.map((e) => ProductsModel.fromHive(e)).toList());
  }

  @override
  (Exception?, ProductsEntity?) searchById(ProductsParams params) {
    // TODO: implement searchById
    throw UnimplementedError();
  }

  @override
  (Exception?, ProductsEntity?) update(ProductsParams params) {
    final box = Hive.box<ProductsHive>(HiveName.products);
    final product = box.values.firstWhere(
      (element) => element.id == params.id,
      orElse: () => ProductsHive(
        name: '',
        id: '',
      ),
    );
    product.name = params.name ?? product.name;
    product.price = params.price ?? product.price;
    product.observation = params.observation ?? product.observation;
    product.category = CategoriesHive(
      id: params.category?.id ?? product.category!.id,
      name: params.category?.name ?? product.category!.name,
      icon: params.category?.icon ?? product.category?.icon,
      image: params.category?.image ?? product.category?.image,
    );
    product.image = params.image ?? product.image;
    box.put(product.key, product);

    return (null, ProductsModel.fromHive(product));
  }
}
