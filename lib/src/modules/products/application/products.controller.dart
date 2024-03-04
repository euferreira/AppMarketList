import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';
import 'package:market_list/src/modules/products/domain/entity/products.entity.dart';
import 'package:uuid/uuid.dart';

import '../domain/iproducts.usecase.dart';

class ProductsController extends GetxController {
  final IProductsSearchUseCase _productsSearchRepository;
  final IProductsCreateUseCase _productsCreateRepository;
  final IProductsUpdateUseCase _productsUpdateRepository;
  final IProductsDeleteUseCase _productsDeleteRepository;
  final ICategoriesSearchUseCase _categoriesSearchRepository;

  RxList<ProductsEntity> products = <ProductsEntity>[].obs;
  RxList<CategoryEntity> categories = <CategoryEntity>[].obs;
  Rxn<CategoryEntity> selectedCategory = Rxn<CategoryEntity>();
  Rxn<ProductsEntity> selectedProduct = Rxn<ProductsEntity>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyEdit = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  MoneyMaskedTextController priceController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
    decimalSeparator: ',',
  );
  TextEditingController observationController = TextEditingController();

  ProductsController({
    required IProductsSearchUseCase productsSearchRepository,
    required IProductsUpdateUseCase productsUpdateRepository,
    required IProductsDeleteUseCase productsDeleteRepository,
    required IProductsCreateUseCase productsCreateRepository,
    required ICategoriesSearchUseCase categoriesSearchRepository,
  })  : _productsSearchRepository = productsSearchRepository,
        _productsCreateRepository = productsCreateRepository,
        _productsUpdateRepository = productsUpdateRepository,
        _productsDeleteRepository = productsDeleteRepository,
        _categoriesSearchRepository = categoriesSearchRepository;

  @override
  void onInit() async {
    super.onInit();
    await _loadData();
  }

  Future<void> _loadData() async {
    final products = _productsSearchRepository.searchAll();
    final categories = await _categoriesSearchRepository.searchCategories();

    if (products.$1 != null || categories.$1 != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Error loading data'),
          backgroundColor: Colors.red,
        ),
      );
    }
    this.products.addAll(products.$2);
    this.categories.addAll(categories.$2);
  }

  void onCreateProducts() async {
    if (!formKey.currentState!.validate()) return;

    final result = await _productsCreateRepository(ProductsParams(
      id: const Uuid().v4(),
      name: nameController.text,
      price: priceController.numberValue,
      observation: observationController.text,
      category: selectedCategory.value,
    ));

    if (result.$1 != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Error creating product'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      products.add(result.$2);
      Get.back();
    }
  }

  void onUpdateProducts() async {
    if (!formKeyEdit.currentState!.validate()) return;

    final result = _productsUpdateRepository(ProductsParams(
      id: selectedProduct.value!.id,
      name: nameController.text,
      price: priceController.numberValue,
      observation: observationController.text,
      category: selectedCategory.value,
      image: selectedProduct.value!.image,
    ));

    if (result.$1 != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Error updating product'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      final index = products.indexWhere((element) => element.id == selectedProduct.value!.id);
      products[index] = result.$2!;
      Get.back();
    }
  }

  void onDeleteProducts() async {
    final result = _productsDeleteRepository(ProductsParams(
      id: selectedProduct.value?.id,
    ));

    if (result.$1 != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Error deleting product'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      products.removeWhere((element) => element.id == selectedProduct.value!.id);
      Get.back();
    }
  }
}
