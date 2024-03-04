import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/shared/widgets/fn_bottomsheet/main.dart';

class BottomsheetAction extends GSBottomSheetComponent {
  final void Function()? onEdit;
  final void Function()? onDelete;

  BottomsheetAction({
    this.onEdit,
    this.onDelete,
    super.key,
  });

  @override
  Widget? get title => const FNBottomSheetTitle("O que deseja fazer?");

  @override
  Widget get body => const SizedBox();

  @override
  List<Widget>? get buttons => [
        SizedBox(
          width: Get.width,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              onEdit?.call();
            },
            child: const Text('Editar'),
          ),
        ),
        SizedBox(
          width: Get.width,
          height: 48,
          child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              Get.back();
              onDelete?.call();
            },
            icon: const Icon(Icons.delete),
            label: const Text('Excluir'),
          ),
        ),
      ];
}
