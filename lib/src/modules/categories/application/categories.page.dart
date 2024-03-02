import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/src/modules/categories/application/categories.controller.dart';
import 'package:market_list/src/modules/categories/application/components/bottomsheet_action_category.component.dart';
import 'package:market_list/src/modules/categories/application/widgets/category.empty.widget.dart';
import 'package:market_list/src/shared/constants.dart';
import 'package:market_list/src/shared/utils/sizing.dart';

import 'components/bottomsheet_create_category.component copy.dart';

class CategoriesPage extends GetView<CategoriesController> {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorsPallet.light200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Todas as categorias aparecerão aqui",
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Sizing.lg),
              Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.categories.isEmpty
                        ? const CategoryEmpty()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              final category = controller.categories[index];
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(category.name),
                                    leading: category.icon != null ? Icon(category.icon) : null,
                                    trailing: IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        controller.selectedCategory.value = category;
                                        BottomsheetActionCategory().show();
                                      },
                                    ),
                                  ),
                                  if (index != controller.categories.length - 1) const Divider(),
                                  if (index == controller.categories.length - 1) const SizedBox(height: 60),
                                ],
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => BottomsheetCreateCategory().show(),
        label: const Text('Adicionar'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
