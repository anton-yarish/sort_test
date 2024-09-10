import 'package:flutter/widgets.dart';
import 'package:sort_test/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(name: "Яблуко", category: "Фрукти", price: 1.99, inStock: true, rating: 3.5),
    Product(name: "Морква", category: "Овочі", price: 0.99, inStock: true, rating: 4.2),
    Product(name: "Кола", category: "Напої", price: 2.50, inStock: false, rating: 4.8),
    Product(name: "Живчик", category: "Напої", price: 2.3, inStock: true, rating: 4.8),
    Product(),
  ];

  List<Product> _filteredProducts = [];
  String _selectedCategory = 'Усі';
  bool _inStockOnly = false;
  String _sortCriteria = 'Ціна';
  bool _isAscending = true;

  List<Product> get products => _filteredProducts;
  String get selectedCategory => _selectedCategory;
  bool get inStockOnly => _inStockOnly;
  String get sortCriteria => _sortCriteria;
  bool get isAscending => _isAscending;

  ProductProvider() {
    _filteredProducts = _products;
  }

  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void setInStock(bool value) {
    _inStockOnly = value;
    _applyFilters();
  }

  void setSortCriteria(String criteria, bool isAscending) {
    _sortCriteria = criteria;
    _isAscending = isAscending;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredProducts = _products
        .where((product) =>
            (_selectedCategory == 'Усі' || product.category == _selectedCategory) && (!_inStockOnly || product.inStock))
        .toList();

    _filteredProducts.sort((a, b) {
      switch (_sortCriteria) {
        case 'Ціна':
          return _isAscending ? a.price.compareTo(b.price) : b.price.compareTo(a.price);
        case 'Рейтинг':
          return _isAscending ? a.rating.compareTo(b.rating) : b.rating.compareTo(a.rating);
        default:
          return 0;
      }
    });

    notifyListeners();
  }
}
