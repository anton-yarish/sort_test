class Product {
  final String name;
  final String category;
  final double price;
  final bool inStock;
  final double rating;

  Product({
    this.name = 'Unknown Product',
    this.category = 'Other',
    this.price = 0.0,
    this.inStock = false,
    this.rating = 0.0,
  });

  Product copyWith({
    String? name,
    String? category,
    double? price,
    bool? inStock,
    double? rating,
  }) {
    return Product(
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      inStock: inStock ?? this.inStock,
      rating: rating ?? this.rating,
    );
  }

  @override
  String toString() {
    return 'Product(name: $name, category: $category, price: $price, inStock: $inStock, rating: $rating)';
  }
}
