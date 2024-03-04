import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/products/application/products.controller.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

import '../widgets/products.form.widget.dart';

class BottomsheetProductsEdit extends GSBottomSheetComponent<ProductsController> {
  BottomsheetProductsEdit({super.key}) {
    controller.nameController.text = controller.selectedProduct.value?.name ?? '';
    controller.priceController.updateValue(controller.selectedProduct.value?.price ?? 0);
    controller.observationController.text = controller.selectedProduct.value?.observation ?? '';
  }

  @override
  Widget? get title => FNBottomSheetTitle("Editar Produto ${controller.selectedProduct.value?.name}");

  @override
  Widget get body => Form(
        key: controller.formKeyEdit,
        child: ProductsForm(
          categories: controller.categories,
          formKey: controller.formKeyEdit,
          nameController: controller.nameController,
          priceController: controller.priceController,
          observationController: controller.observationController,
          onCategoryChanged: (value) => controller.selectedProduct.value?.category = value,
        ),
      );

  @override
  List<Widget>? get buttons => [
        SizedBox(
          width: Get.width,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: () => controller.onUpdateProducts(),
            icon: const Icon(Icons.save),
            label: const Text('Editar'),
          ),
        ),
      ];

  @override
  Future<void> afterClose<T>([T? result]) {
    controller.selectedProduct.value = null;
    return super.afterClose(result);
  }
}
