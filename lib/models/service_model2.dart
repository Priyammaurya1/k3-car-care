// lib/models/service_model2.dart

class ServiceModel2 {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  ServiceModel2({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  // Sample data
  static List<ServiceModel2> getSampleServices() {
    return [
      ServiceModel2(
        id: '1',
        title: 'Basic Wash',
        description: 'Exterior wash with basic cleaning and drying',
        imageUrl: 'assets/images/basic_wash.png',
        price: 9.99,
      ),
      ServiceModel2(
        id: '2',
        title: 'Premium Wash',
        description: 'Exterior wash with wax and tire shine',
        imageUrl: 'assets/images/premium_wash.png',
        price: 14.99,
      ),
      ServiceModel2(
        id: '3',
        title: 'Deluxe Wash',
        description: 'Complete interior and \nexterior cleaning',
        imageUrl: 'assets/images/deluxe_wash.png',
        price: 19.99,
      ),
      ServiceModel2(
        id: '4',
        title: 'Interior Detail',
        description: 'Deep cleaning of all interior surfaces',
        imageUrl: 'assets/images/interior_detail.png',
        price: 29.99,
      ),
      ServiceModel2(
        id: '5',
        title: 'Exterior Detail',
        description: 'Clay bar treatment, polish\nand wax',
        imageUrl: 'assets/images/exterior_detail.png',
        price: 39.99,
      ),
      ServiceModel2(
        id: '6',
        title: 'Full Detail',
        description: 'Complete interior and \nexterior detailing',
        imageUrl: 'assets/images/full_detail.png',
        price: 69.99,
      ),
      ServiceModel2(
        id: '7',
        title: 'Ceramic Coating',
        description: 'Long-lasting protection for your vehicle',
        imageUrl: 'assets/images/ceramic_coating.png',
        price: 199.99,
      ),
      ServiceModel2(
        id: '8',
        title: 'Express Detail',
        description: 'Quick interior vacuum and exterior wash',
        imageUrl: 'assets/images/express_detail.png',
        price: 24.99,
      ),
    ];
  }
}