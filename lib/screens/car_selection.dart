import 'package:flutter/material.dart';

class CarBrand {
  final String id;
  final String name;
  final String logoUrl;
  final List<CarModel> models;

  const CarBrand({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.models,
  });
}

// Car model
class CarModel {
  final String id;
  final String name;
  final String imageUrl;

  const CarModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

// Mock data for brands and models
final List<CarBrand> carBrands = [
  CarBrand(
    id: '1',
    name: 'Toyota',
    logoUrl: 'assets/logos/toyota.png',
    models: [
      CarModel(id: '1', name: 'Camry', imageUrl: 'assets/models/camry.png'),
      CarModel(id: '2', name: 'Corolla', imageUrl: 'assets/models/corolla.png'),
      CarModel(id: '3', name: 'RAV4', imageUrl: 'assets/models/rav4.png'),
      CarModel(id: '4', name: 'Highlander', imageUrl: 'assets/models/highlander.png'),
      CarModel(id: '5', name: 'Tacoma', imageUrl: 'assets/models/tacoma.png'),
    ],
  ),
  CarBrand(
    id: '2',
    name: 'Honda',
    logoUrl: 'assets/logos/honda.png',
    models: [
      CarModel(id: '1', name: 'Civic', imageUrl: 'assets/models/civic.png'),
      CarModel(id: '2', name: 'Accord', imageUrl: 'assets/models/accord.png'),
      CarModel(id: '3', name: 'CR-V', imageUrl: 'assets/models/crv.png'),
      CarModel(id: '4', name: 'Pilot', imageUrl: 'assets/models/pilot.png'),
      CarModel(id: '5', name: 'HR-V', imageUrl: 'assets/models/hrv.png'),
    ],
  ),
  CarBrand(
    id: '3',
    name: 'Ford',
    logoUrl: 'assets/logos/ford.png',
    models: [
      CarModel(id: '1', name: 'F-150', imageUrl: 'assets/models/f150.png'),
      CarModel(id: '2', name: 'Mustang', imageUrl: 'assets/models/mustang.png'),
      CarModel(id: '3', name: 'Explorer', imageUrl: 'assets/models/explorer.png'),
      CarModel(id: '4', name: 'Escape', imageUrl: 'assets/models/escape.png'),
      CarModel(id: '5', name: 'Bronco', imageUrl: 'assets/models/bronco.png'),
    ],
  ),
  CarBrand(
    id: '4',
    name: 'BMW',
    logoUrl: 'assets/logos/bmw.png',
    models: [
      CarModel(id: '1', name: '3 Series', imageUrl: 'assets/models/3series.png'),
      CarModel(id: '2', name: '5 Series', imageUrl: 'assets/models/5series.png'),
      CarModel(id: '3', name: 'X3', imageUrl: 'assets/models/x3.png'),
      CarModel(id: '4', name: 'X5', imageUrl: 'assets/models/x5.png'),
      CarModel(id: '5', name: 'i4', imageUrl: 'assets/models/i4.png'),
    ],
  ),
  CarBrand(
    id: '5',
    name: 'Mercedes',
    logoUrl: 'assets/logos/mercedes.png',
    models: [
      CarModel(id: '1', name: 'C-Class', imageUrl: 'assets/models/cclass.png'),
      CarModel(id: '2', name: 'E-Class', imageUrl: 'assets/models/eclass.png'),
      CarModel(id: '3', name: 'GLC', imageUrl: 'assets/models/glc.png'),
      CarModel(id: '4', name: 'GLE', imageUrl: 'assets/models/gle.png'),
      CarModel(id: '5', name: 'S-Class', imageUrl: 'assets/models/sclass.png'),
    ],
  ),
  CarBrand(
    id: '6',
    name: 'Tesla',
    logoUrl: 'assets/logos/tesla.png',
    models: [
      CarModel(id: '1', name: 'Model 3', imageUrl: 'assets/models/model3.png'),
      CarModel(id: '2', name: 'Model Y', imageUrl: 'assets/models/modely.png'),
      CarModel(id: '3', name: 'Model S', imageUrl: 'assets/models/models.png'),
      CarModel(id: '4', name: 'Model X', imageUrl: 'assets/models/modelx.png'),
      CarModel(id: '5', name: 'Cybertruck', imageUrl: 'assets/models/cybertruck.png'),
    ],
  ),
];

class BrandSelectionScreen extends StatelessWidget {
  const BrandSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Car Brand'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'What brand is your car?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
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
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
            // This is where the logo would be displayed
            // For now, we're using a placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.directions_car,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              // In a real app, use this instead of the Icon:
              // Image.asset(
              //   brand.logoUrl,
              //   width: 80,
              //   height: 80,
              // ),
            ),
            const SizedBox(height: 12),
            Text(
              brand.name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
      appBar: AppBar(
        title: Text('${brand.name} Models'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Which ${brand.name} model do you have?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Navigate to the next screen after model selection
          // For now, just show a snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You selected ${brand.name} ${model.name}'),
              behavior: SnackBarBehavior.floating,
            ),
          );
          
          // In a real app, you would navigate to the dashboard or home screen
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DashboardScreen(brand: brand, model: model),
          //   ),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // This is where the model image would be displayed
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.directions_car,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                // In a real app, use this instead of the Icon:
                // Image.asset(
                //   model.imageUrl,
                //   width: 60,
                //   height: 60,
                // ),
              ),
              const SizedBox(width: 16),
              Text(
                model.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}