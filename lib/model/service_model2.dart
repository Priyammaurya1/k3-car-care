// lib/models/service_model2.dart

class ServiceModel2 {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  ServiceModel2({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  // Sample data
  static List<ServiceModel2> getSampleServices() {
    return [
      ServiceModel2(
        id: '1',
        title: 'Monthly Services',
        description: 'Choose from basic to\npremium services.',
        imageUrl: 'assets/images/basic_wash.png',
      ),
      ServiceModel2(
        id: '2',
        title: 'Car Wash',
        description: 'Quick and effective cleaning, choose what you want.',
        imageUrl: 'assets/images/premium_wash.png',
      ),
      ServiceModel2(
        id: '3',
        title: 'Interior and Exterior',
        description:
            'Choose from our wide range\nof interior and exterior services.',
        imageUrl: 'assets/images/deluxe_wash.png',
      ),
      ServiceModel2(
        id: '4',
        title: 'Protection Film (PPF)',
        description: 'Choose from our wide range\nof protection films.',
        imageUrl: 'assets/images/interior_detail.png',
      ),
      ServiceModel2(
        id: '5',
        title: 'Ceramice Coating',
        description: 'Long lasting protection for\nyour vehicle.',
        imageUrl: 'assets/images/exterior_detail.png',
      ),
      ServiceModel2(
        id: '6',
        title: 'Customization',
        description: 'Get the right product at right price.',
        imageUrl: 'assets/images/full_detail.png',
      ),
    ];
  }
}
