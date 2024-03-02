import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/modules/categories/domain/icategories.usecase.dart';
import 'package:uuid/uuid.dart';

class CategoriesController extends GetxController {
  final ICategoriesSearchUseCase _searchUseCase;
  final ICategoryCreateUseCase _createUseCase;
  final ICategoryUpdateUseCase _updateUseCase;
  final ICategoryDeleteUseCase _deleteUseCase;

  RxBool isLoading = false.obs;
  RxBool isCreating = false.obs;
  RxList<CategoryEntity> categories = <CategoryEntity>[].obs;
  Rxn<CategoryEntity> selectedCategory = Rxn<CategoryEntity>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  CategoriesController({
    required ICategoriesSearchUseCase searchUseCase,
    required ICategoryCreateUseCase createUseCase,
    required ICategoryUpdateUseCase updateUseCase,
    required ICategoryDeleteUseCase deleteUseCase,
  })  : _searchUseCase = searchUseCase,
        _createUseCase = createUseCase,
        _updateUseCase = updateUseCase,
        _deleteUseCase = deleteUseCase;

  @override
  void onInit() async {
    super.onInit();
    await _loadData();
  }

  Future<void> _loadData() async {
    isLoading.value = true;
    final result = await _searchUseCase.searchCategories();
    categories.value = result.$2;
    isLoading.value = false;
  }

  Future<void> onCreateCategory() async {
    isCreating.value = true;
    final result = await _createUseCase.createCategory(CategoryParam(
      id: const Uuid().v4(),
      name: nameController.text,
    ));
    if (result.$1 != null) {
      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(result.$1.toString()),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await _loadData();

    Get.back();
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Categoria criada com sucesso'),
        backgroundColor: Colors.green,
        showCloseIcon: true,
      ),
    );
    isCreating.value = false;
  }

  Future<void> onEditCategory() async {
    isCreating.value = true;
    final result = await _updateUseCase.updateCategory(CategoryParam(
      id: selectedCategory.value!.id,
      name: nameController.text,
    ));
    if (result.$1 != null) {
      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(result.$1.toString()),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await _loadData();
    Get.back();
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Categoria editada com sucesso'),
        backgroundColor: Colors.green,
        showCloseIcon: true,
      ),
    );
    isCreating.value = false;
  }

  Future<void> deleteCategory() async {
    final result = await _deleteUseCase.deleteCategory(CategoryParam(
      id: selectedCategory.value!.id,
      name: selectedCategory.value!.name,
    ));
    if (result.$1 != null) {
      ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(result.$1.toString()),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    await _loadData();
    Get.back();
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Categoria deletada com sucesso'),
        backgroundColor: Colors.green,
        showCloseIcon: true,
      ),
    );
  }
}
