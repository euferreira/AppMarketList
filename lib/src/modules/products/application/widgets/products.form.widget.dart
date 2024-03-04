import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:market_list/src/modules/categories/domain/entity/categories.entity.dart';
import 'package:market_list/src/shared/utils/validators.dart';

class ProductsForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final MoneyMaskedTextController priceController;
  final TextEditingController observationController;
  final CategoryEntity? selectedCategory;
  final List<CategoryEntity> categories;
  final void Function(CategoryEntity?)? onCategoryChanged;

  const ProductsForm({
    super.key,
    this.selectedCategory,
    this.onCategoryChanged,
    required this.categories,
    required this.formKey,
    required this.nameController,
    required this.priceController,
    required this.observationController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          textInputAction: TextInputAction.next,
          validator: Validators.required(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            labelText: 'Nome',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: priceController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            labelText: 'Preço',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<CategoryEntity>(
          value: selectedCategory,
          decoration: const InputDecoration(
            labelText: 'Categoria',
            border: OutlineInputBorder(),
          ),
          items: categories
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: onCategoryChanged,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: observationController,
          decoration: const InputDecoration(
            labelText: 'Observação',
            border: OutlineInputBorder(),
          ),
          maxLines: 5,
        ),
      ],
    );
  }
}
