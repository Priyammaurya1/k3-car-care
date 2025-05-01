import 'package:flutter/material.dart';
import 'package:k3carcare/widgets/banner_slider.dart';
import 'package:k3carcare/widgets/section_header.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Store',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            _buildSearchBar(),

            // Banner Slider
            _buildBannerSlider(),

            // Categories Section
            _buildCategorySection(), 
            
            // Products Section
            // _buildProductsSection(),              /////////////////////IGNORED///////////////////////
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  Widget _buildBannerSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SectionHeaderr(title: 'Special Offers'),
        ),
        const SizedBox(height: 12),
        BannerSlider(
          height: 180.0,
          assetPaths: [
            'assets/images/banner/banner-1.png',
            'assets/images/banner/banner-2.png',
            'assets/images/banner/banner-3.png',
            'assets/images/banner/banner-4.png',
          ],
          autoScrollDuration: const Duration(seconds: 3),
        ),
      ],
    );
  }
}

// Color _getBannerColor(int index) {
//   List<Color> colors = [
//     Colors.blue,
//     Colors.orange,
//     Colors.green,
//     Colors.purple,
//   ];
//   return colors[index % colors.length];
// }

// String _getBannerTitle(int index) {
//   List<String> titles = [
//     'New Arrivals',
//     'Special Offers',
//     'Limited Edition',
//     'Member Deals',
//   ];
//   return titles[index % titles.length];
// }

// String _getBannerSubtitle(int index) {
//   List<String> subtitles = [
//     'Fresh products just for you',
//     'Up to 50% off this week',
//     'Get them while they last',
//     'Exclusive to members only',
//   ];
//   return subtitles[index % subtitles.length];
// }

Widget _buildCategorySection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SectionHeaderr(title: 'Popular Categories'),
      ),
      const SizedBox(height: 16),

      Container(
        padding: const EdgeInsets.only(left: 16),
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      // child: Image(image: AssetImage(''), fit: BoxFit.cover, color: Colors.black,),
                      child: Icon(Icons.category, color: Colors.black, size: 24),
                    ),
                  ),
                  /// Text
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 55,
                    child: Text(
                      'Category',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  
                ],
              ),
            );
          },
        ),
      ),
     
    ],
  );
}

Widget _buildCategoryItem(String title, IconData icon, Color color) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 24),
      ),
      const SizedBox(height: 6),
      Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    ],
  );
}

Widget _buildProductsSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildProductCard(
            title: _getProductName(index),
            price: _getProductPrice(index),
            rating: _getProductRating(index),
            imageIndex: index + 1,
          );
        },
      ),
      const SizedBox(height: 24),
    ],
  );
}

Widget _buildProductCard({
  required String title,
  required double price,
  required double rating,
  required int imageIndex,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/product$imageIndex.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Product Info
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

String _getProductName(int index) {
  List<String> names = [
    'Wireless Earbuds',
    'Smart Watch',
    'Leather Wallet',
    'Portable Charger',
    'Fitness Tracker',
    'Sunglasses',
  ];
  return names[index % names.length];
}

double _getProductPrice(int index) {
  List<double> prices = [59.99, 129.99, 39.99, 49.99, 89.99, 79.99];
  return prices[index % prices.length];
}

double _getProductRating(int index) {
  List<double> ratings = [4.8, 4.5, 4.2, 4.7, 4.4, 4.6];
  return ratings[index % ratings.length];
}
