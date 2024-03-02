import 'package:flutter/material.dart';
import 'package:market_list/src/modules/categories/application/categories.controller.dart';
import 'package:market_list/src/shared/utils/validators.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

class BottomsheetEditCategory extends GSBottomSheetComponent<CategoriesController> {
  BottomsheetEditCategory({super.key}) {
    controller.nameController.text = controller.selectedCategory.value?.name ?? '';
  }

  @override
  Widget? get title => const FNBottomSheetTitle("Editar Categoria");

  @override
  Widget get body => Column(
        children: [
          Form(
            key: controller.formKey,
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
              validator: Validators.minLength(3),
            ),
          ),
        ],
      );

  @override
  List<Widget>? get buttons => [
        ElevatedButton(
          onPressed: controller.onEditCategory,
          child: Text(
            controller.isCreating.value ? 'Salvando...' : 'Salvar',
          ),
        )
      ];

  @override
  Future<void> afterClose<T>([T? result]) {
    controller.selectedCategory.value = null;
    controller.nameController.clear();

    return super.afterClose(result);
  }
}
