import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/products/application/products.controller.dart';
import 'package:market_list/src/modules/products/application/widgets/products.form.widget.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

class BottomsheetProductsCreateComponent extends GSBottomSheetComponent<ProductsController> {
  BottomsheetProductsCreateComponent({super.key});

  @override
  Widget? get title => const FNBottomSheetTitle("Adicionar Produto");

  @override
  Widget get body => Form(
        key: controller.formKey,
        child: ProductsForm(
          categories: controller.categories,
          formKey: controller.formKey,
          nameController: controller.nameController,
          priceController: controller.priceController,
          observationController: controller.observationController,
          selectedCategory: controller.selectedCategory.value,
          onCategoryChanged: (value) => controller.selectedCategory.value = value,
        ),
      );

  @override
  List<Widget>? get buttons => [
        SizedBox(
          width: Get.width,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: () => controller.onCreateProducts(),
            icon: const Icon(Icons.save),
            label: const Text('Salvar'),
          ),
        ),
      ];

  @override
  Future<void> afterClose<T>([T? result]) {
    controller.nameController.clear();
    controller.priceController.clear();
    controller.observationController.clear();
    controller.selectedCategory.value = null;
    return super.afterClose(result);
  }
}
