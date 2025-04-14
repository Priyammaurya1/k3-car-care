class ServiceModel {
  final int id;
  final String name;
  final String description;
  final String image;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  // Factory method to create a ServiceModel from a map (useful for JSON parsing)
  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}

// Sample data
List<ServiceModel> sampleServices = [
  ServiceModel(
    id: 1,
    name: 'Basic Car Wash',
    description: 'Quick and effective cleaning for your vehicle',
    image: 'image',
  ),
  ServiceModel(
    id: 2,
    name: 'Premium Car Wash',
    description: 'Thorough cleaning with premium products',
    image: 'image',
  ),
  ServiceModel(
    id: 3,
    name: 'Deluxe Car Wash',
    description: 'Complete car care with waxing and polishing',
    image: 'image',
  ),
];