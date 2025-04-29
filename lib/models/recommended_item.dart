class RecommendedItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String duration;
  final String type; // "service" or "product"

  RecommendedItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.type,
    this.duration = "45-60 min",
  });

  bool get isService => type == "service";
}