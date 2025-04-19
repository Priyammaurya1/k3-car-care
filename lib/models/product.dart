class Product {
  final String name;
  final double rating;

  Product({required this.name, required this.rating});
}

final List<Product> products = [
  Product(name: 'Premium Wash', rating: 5.0),
  Product(name: 'Interior Clean', rating: 4.5),
  Product(name: 'Full Detail', rating: 5.0),
  Product(name: 'Express Wash', rating: 4.8),
];