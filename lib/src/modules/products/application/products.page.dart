import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/products/application/components/bottomsheet_products_create.component.dart';
import 'package:market_list/src/modules/products/application/components/bottomsheet_products_delete.component.dart';
import 'package:market_list/src/modules/products/application/components/bottomsheet_products_edit.component.dart';
import 'package:market_list/src/modules/products/application/products.controller.dart';
import 'package:market_list/src/shared/widgets/bottomsheet_actions.widget.dart';
import 'package:market_list/src/shared/widgets/empty.widget.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Obx(() => controller.products.isEmpty
              ? const EmptyPage()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: product.category != null ? Text(product.category!.name) : null,
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => BottomsheetAction(
                          onEdit: () {
                            controller.selectedProduct.value = product;
                            BottomsheetProductsEdit().show();
                          },
                          onDelete: () {
                            controller.selectedProduct.value = product;
                            BottomsheetProductsDelete().show();
                          },
                        ).show(),
                      ),
                    );
                  },
                )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => BottomsheetProductsCreateComponent().show(),
        label: const Text('Adicionar'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
