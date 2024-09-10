import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sort_test/view_models/product_view_model.dart';
import 'package:sort_test/widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Продукти'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: provider.selectedCategory,
                          items: ['Усі', 'Фрукти', 'Овочі', 'Напої']
                              .map((category) => DropdownMenuItem(value: category, child: Text(category)))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              provider.setCategory(value);
                            }
                          },
                        ),
                        const Spacer(),
                        Checkbox(
                          value: provider.inStockOnly,
                          onChanged: (value) {
                            if (value != null) {
                              provider.setInStock(value);
                            }
                          },
                        ),
                        const Text('Тільки в наявності'),
                      ],
                    ),
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: provider.sortCriteria,
                          items: ['Ціна', 'Рейтинг']
                              .map((criteria) => DropdownMenuItem(value: criteria, child: Text(criteria)))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              provider.setSortCriteria(value, provider.isAscending);
                            }
                          },
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(provider.isAscending ? Icons.arrow_upward : Icons.arrow_downward),
                          onPressed: () {
                            provider.setSortCriteria(provider.sortCriteria, !provider.isAscending);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return ProductCard(product: product);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
