import 'package:flutter/material.dart';
import 'package:market_list/src/modules/categories/application/categories.controller.dart';
import 'package:market_list/src/shared/utils/validators.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

class BottomsheetCreateCategory extends GSBottomSheetComponent<CategoriesController> {
  BottomsheetCreateCategory({super.key});

  @override
  Widget? get title => const FNBottomSheetTitle("Criar Categoria");

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
          onPressed: () => controller.onCreateCategory(),
          child: Text(
            controller.isCreating.value ? 'Criando...' : 'Criar',
          ),
        )
      ];
}
