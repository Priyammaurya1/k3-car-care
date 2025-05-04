import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';

class CarBrand {
  final String id;
  final String name;
  final String logoUrl;
  final List<CarModel> models;
  final Color brandColor;

  const CarBrand({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.models,
    required this.brandColor,
  });
}

class CarModel {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> features;

  const CarModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description = '',
    this.features = const [],
  });
}

// Enhanced mock data with brand colors and model descriptions
final List<CarBrand> carBrands = [
  CarBrand(
    id: '1',
    name: 'Toyota',
    logoUrl: 'assets/logos/toyota.png',
    brandColor: KColors.primaryLight,
    models: [
      CarModel(
        id: '1',
        name: 'Camry',
        imageUrl: 'assets/models/camry.png',
        description: 'A midsize sedan with excellent reliability',
        features: ['Fuel Efficient', 'Spacious Interior', 'Advanced Safety'],
      ),
      CarModel(
        id: '2',
        name: 'Corolla',
        imageUrl: 'assets/models/corolla.png',
        description: 'Compact sedan with great value',
        features: ['Affordable', 'Low Maintenance', 'Good MPG'],
      ),
      CarModel(
        id: '3',
        name: 'RAV4',
        imageUrl: 'assets/models/rav4.png',
        description: 'Popular compact SUV with versatility',
        features: ['AWD Available', 'Cargo Space', 'Hybrid Option'],
      ),
      CarModel(
        id: '4',
        name: 'Highlander',
        imageUrl: 'assets/models/highlander.png',
        description: 'Three-row family SUV',
        features: ['Seats 7-8', 'Safety Features', 'Comfortable Ride'],
      ),
      CarModel(
        id: '5',
        name: 'Tacoma',
        imageUrl: 'assets/models/tacoma.png',
        description: 'Midsize pickup with off-road capability',
        features: ['Durable', 'Off-Road Ready', 'Towing Capacity'],
      ),
    ],
  ),
  CarBrand(
    id: '2',
    name: 'Honda',
    logoUrl: 'assets/logos/honda.png',
    brandColor: KColors.primaryLight,
    models: [
      CarModel(
        id: '1',
        name: 'Civic',
        imageUrl: 'assets/models/civic.png',
        description: 'Sporty compact with modern design',
        features: ['Fun to Drive', 'Efficient', 'Tech Features'],
      ),
      CarModel(
        id: '2',
        name: 'Accord',
        imageUrl: 'assets/models/accord.png',
        description: 'Award-winning midsize sedan',
        features: ['Spacious', 'Refined Interior', 'Reliable'],
      ),
      CarModel(
        id: '3',
        name: 'CR-V',
        imageUrl: 'assets/models/crv.png',
        description: 'Versatile compact SUV',
        features: ['Comfortable', 'Cargo Room', 'Fuel Efficient'],
      ),
      CarModel(
        id: '4',
        name: 'Pilot',
        imageUrl: 'assets/models/pilot.png',
        description: 'Three-row family SUV',
        features: ['Spacious', 'AWD Available', 'Safety Features'],
      ),
      CarModel(
        id: '5',
        name: 'HR-V',
        imageUrl: 'assets/models/hrv.png',
        description: 'Subcompact SUV with versatility',
        features: ['Magic Seats', 'Efficient', 'Affordable'],
      ),
    ],
  ),
  CarBrand(
    id: '3',
    name: 'Ford',
    logoUrl: 'assets/logos/ford.png',
    brandColor: KColors.primaryLight,
    models: [
      CarModel(
        id: '1',
        name: 'F-150',
        imageUrl: 'assets/models/f150.png',
        description: 'America\'s best-selling pickup truck',
        features: ['Tough', 'Powerful', 'Multiple Engine Options'],
      ),
      CarModel(
        id: '2',
        name: 'Mustang',
        imageUrl: 'assets/models/mustang.png',
        description: 'Iconic American sports car',
        features: ['Powerful', 'Historic', 'Driver Focused'],
      ),
      CarModel(
        id: '3',
        name: 'Explorer',
        imageUrl: 'assets/models/explorer.png',
        description: 'Popular three-row SUV',
        features: ['Spacious', 'Capable', 'Family Friendly'],
      ),
      CarModel(
        id: '4',
        name: 'Escape',
        imageUrl: 'assets/models/escape.png',
        description: 'Versatile compact SUV',
        features: ['Efficient', 'Tech Features', 'Comfortable'],
      ),
      CarModel(
        id: '5',
        name: 'Bronco',
        imageUrl: 'assets/models/bronco.png',
        description: 'Rugged off-road SUV',
        features: ['Off-Road Ready', 'Removable Top', 'Adventure Vehicle'],
      ),
    ],
  ),
  CarBrand(
    id: '4',
    name: 'BMW',
    logoUrl: 'assets/logos/bmw.png',
    brandColor: KColors.primaryLight,
    models: [
      CarModel(
        id: '1',
        name: '3 Series',
        imageUrl: 'assets/models/3series.png',
        description: 'Luxury sports sedan',
        features: ['Dynamic Handling', 'Luxury Interior', 'Advanced Tech'],
      ),
      CarModel(
        id: '2',
        name: '5 Series',
        imageUrl: 'assets/models/5series.png',
        description: 'Executive luxury sedan',
        features: ['Comfort', 'Premium Features', 'Powerful Engines'],
      ),
      CarModel(
        id: '3',
        name: 'X3',
        imageUrl: 'assets/models/x3.png',
        description: 'Compact luxury SUV',
        features: ['Agile', 'Versatile', 'Premium Quality'],
      ),
      CarModel(
        id: '4',
        name: 'X5',
        imageUrl: 'assets/models/x5.png',
        description: 'Midsize luxury SUV',
        features: ['Spacious', 'High-End Features', 'Refined Driving'],
      ),
      CarModel(
        id: '5',
        name: 'i4',
        imageUrl: 'assets/models/i4.png',
        description: 'All-electric gran coupe',
        features: ['Electric', 'Performance', 'Long Range'],
      ),
    ],
  ),
  CarBrand(
    id: '5',
    name: 'Mercedes',
    logoUrl: 'assets/logos/mercedes.png',
    brandColor: KColors.primaryLight,
    models: [
      CarModel(
        id: '1',
        name: 'C-Class',
        imageUrl: 'assets/models/cclass.png',
        description: 'Compact luxury sedan',
        features: ['Refined', 'Elegant', 'Comfortable'],
      ),
      CarModel(
        id: '2',
        name: 'E-Class',
        imageUrl: 'assets/models/eclass.png',
        description: 'Executive luxury sedan',
        features: ['Premium Interior', 'Advanced Tech', 'Smooth Ride'],
      ),
      CarModel(
        id: '3',
        name: 'GLC',
        imageUrl: 'assets/models/glc.png',
        description: 'Compact luxury SUV',
        features: ['Stylish', 'Luxurious', 'Capable'],
      ),
      CarModel(
        id: '4',
        name: 'GLE',
        imageUrl: 'assets/models/gle.png',
        description: 'Midsize luxury SUV',
        features: ['Spacious', 'Premium Features', 'Comfortable'],
      ),
      CarModel(
        id: '5',
        name: 'S-Class',
        imageUrl: 'assets/models/sclass.png',
        description: 'Flagship luxury sedan',
        features: ['Ultimate Luxury', 'Cutting-Edge Tech', 'Prestige'],
      ),
    ],
  ),
  CarBrand(
    id: '6',
    name: 'Tesla',
    logoUrl: 'assets/logos/tesla.png',
    brandColor: KColors.primaryLight,
    models: [
      CarModel(
        id: '1',
        name: 'Model 3',
        imageUrl: 'assets/models/model3.png',
        description: 'Popular electric sedan',
        features: ['Long Range', 'Fast Acceleration', 'Autopilot'],
      ),
      CarModel(
        id: '2',
        name: 'Model Y',
        imageUrl: 'assets/models/modely.png',
        description: 'Electric compact SUV',
        features: ['Spacious', 'Performance', 'Advanced Tech'],
      ),
      CarModel(
        id: '3',
        name: 'Model S',
        imageUrl: 'assets/models/models.png',
        description: 'Premium electric sedan',
        features: ['Ludicrous Speed', 'Long Range', 'Premium Interior'],
      ),
      CarModel(
        id: '4',
        name: 'Model X',
        imageUrl: 'assets/models/modelx.png',
        description: 'Premium electric SUV',
        features: ['Falcon Doors', 'Family Sized', 'All-Electric'],
      ),
      CarModel(
        id: '5',
        name: 'Cybertruck',
        imageUrl: 'assets/models/cybertruck.png',
        description: 'Futuristic electric pickup',
        features: ['Unique Design', 'Stainless Steel', 'Electric Performance'],
      ),
    ],
  ),
];

class BrandSelectionScreen extends StatelessWidget {
  const BrandSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(206, 255, 41, 41),
                Color.fromARGB(210, 254, 61, 61),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Car\'s Brand',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                'Select from a wide range of Brands',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.search, color: Colors.white, size: 20),
            ),
            onPressed: () {
              // will implement search functionality here
            },
          ),
          const SizedBox(width: 16),
        ],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Your Brand',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF303030),
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select from our wide range of car manufacturers',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF6E7181),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: carBrands.length,
                  itemBuilder: (context, index) {
                    return BrandCard(brand: carBrands[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  final CarBrand brand;

  const BrandCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModelSelectionScreen(brand: brand),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: brand.brandColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.directions_car,
                  size: 40,
                  color: brand.brandColor,
                ),
                // In a real app, use this instead of the Icon:
                // Image.asset(
                //   brand.logoUrl,
                //   width: 60,
                //   height: 60,
                // ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              brand.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF303030),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${brand.models.length} Models',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6E7181)),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelSelectionScreen extends StatelessWidget {
  final CarBrand brand;

  const ModelSelectionScreen({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(206, 255, 41, 41),
                Color.fromARGB(210, 254, 61, 61),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Column(
            children: [
              Text(
                brand.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                'Select from a wide range of ${brand.name}\'s brand.',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.search, color: Colors.white, size: 20),
            ),
            onPressed: () {
              // will implement search functionality here
            },
          ),
          const SizedBox(width: 16),
        ],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF303030)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Your ${brand.name} Model',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF303030),
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose the model that matches your vehicle',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF6E7181),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                itemCount: brand.models.length,
                itemBuilder: (context, index) {
                  final model = brand.models[index];
                  return ModelCard(brand: brand, model: model);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelCard extends StatelessWidget {
  final CarBrand brand;
  final CarModel model;

  const ModelCard({super.key, required this.brand, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ModelDetailScreen(brand: brand, model: model),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Hero(
                tag: '${brand.id}-${model.id}',
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: brand.brandColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.directions_car,
                    size: 40,
                    color: brand.brandColor,
                  ),
                  // In a real app, use this:
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(12),
                  //   child: Image.asset(
                  //     model.imageUrl,
                  //     width: 80,
                  //     height: 80,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF303030),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      model.description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6E7181),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: brand.brandColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: brand.brandColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New screen for model details
class ModelDetailScreen extends StatelessWidget {
  final CarBrand brand;
  final CarModel model;

  const ModelDetailScreen({
    super.key,
    required this.brand,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            backgroundColor: brand.brandColor,
            elevation: 0,
            pinned: true,
            stretch: true,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                model.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: brand.brandColor),
                  Center(
                    child: Hero(
                      tag: '${brand.id}-${model.id}',
                      child: Icon(
                        Icons.directions_car,
                        size: 100,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      // In a real app, use this:
                      // Image.asset(
                      //   model.imageUrl,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {
                  // Favorite functionality would go here
                },
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  // Share functionality would go here
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand badge
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: brand.brandColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.verified, size: 16, color: Colors.white),
                            const SizedBox(width: 4),
                            Text(
                              brand.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'About ${model.name}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF303030),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    model.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF6E7181),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Features
                  Text(
                    'Key Features',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF303030),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...model.features.map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: brand.brandColor.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_circle,
                              size: 18,
                              color: brand.brandColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            feature,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: const Color(0xFF303030)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Call to action button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'You selected ${brand.name} ${model.name}',
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: brand.brandColor,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: brand.brandColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Select This Vehicle',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Secondary action
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () {
                        // Support or more info functionality
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: brand.brandColor,
                        side: BorderSide(color: brand.brandColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Need More Information?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: brand.brandColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
