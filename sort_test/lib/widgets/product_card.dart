import 'package:flutter/material.dart';
import 'package:sort_test/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('Категорія: ${product.category}, Ціна: ${product.price} грн'),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Рейтинг: ${product.rating.toStringAsFixed(1)}'),
            Text(product.inStock ? 'В наявності' : 'Немає в наявності'),
          ],
        ),
      ),
    );
  }
}
