import 'package:flutter/material.dart';
import 'package:market_list/src/modules/categories/application/categories.controller.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

class BottomsheetDeleteCategory extends GSBottomSheetComponent<CategoriesController> {
  BottomsheetDeleteCategory({super.key});

  @override
  Widget? get title => FNBottomSheetTitle("Deseja excluir ${controller.selectedCategory.value?.name}");

  @override
  Widget get body => const SizedBox();

  @override
  List<Widget>? get buttons => [
        ElevatedButton(
          onPressed: () => controller.deleteCategory(),
          child: const Text('Excluir'),
        ),
      ];

  @override
  Future<void> afterClose<T>([T? result]) {
    controller.selectedCategory.value = null;
    return super.afterClose(result);
  }
}
