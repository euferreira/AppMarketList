import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/categories/application/components/bottomsheet_delete.category.dart';
import 'package:market_list/src/modules/categories/application/components/bottomsheet_edit_category.component.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

class BottomsheetActionCategory extends GSBottomSheetComponent {
  BottomsheetActionCategory({super.key});

  @override
  Widget? get title => const FNBottomSheetTitle("O que deseja fazer?");

  @override
  Widget get body => const SizedBox();

  @override
  List<Widget>? get buttons => [
        ElevatedButton(
          onPressed: () {
            Get.back();
            BottomsheetEditCategory().show();
          },
          child: const Text('Editar'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Get.back();
            BottomsheetDeleteCategory().show();
          },
          icon: const Icon(Icons.delete),
          label: const Text('Excluir'),
        ),
      ];
}
