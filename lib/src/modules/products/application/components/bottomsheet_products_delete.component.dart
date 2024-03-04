import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/products/application/products.controller.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

class BottomsheetProductsDelete extends GSBottomSheetComponent<ProductsController> {
  BottomsheetProductsDelete({super.key});

  @override
  Widget? get title => const FNBottomSheetTitle("Excluir o produto?");

  @override
  Widget get body => Text("Deseja realmente excluir o produto ${controller.selectedProduct.value?.name}?");

  @override
  List<Widget>? get buttons => [
        SizedBox(
          width: Get.width,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              controller.onDeleteProducts();
            },
            child: const Text("Excluir"),
          ),
        ),
      ];

  @override
  Future<void> afterClose<T>([T? result]) {
    controller.selectedProduct.value = null;
    return super.afterClose(result);
  }
}
