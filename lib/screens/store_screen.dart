import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:k3carcare/common/rounded_container.dart';
import 'package:k3carcare/common/rounded_images.dart';
import 'package:k3carcare/text/title_text.dart';
import 'package:k3carcare/widgets/banner_slider.dart';
import 'package:k3carcare/widgets/section_header.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Store',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Text(
              'Get everything for your car at one place',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.help_outline_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
            onPressed: () {
              // will implement help functionality here
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 1.0),
              child: _buildSearchBar(),
            ),

            // Banner Slider
            _buildBannerSlider(),

            // Categories Section
            _buildCategorySection(),

            // Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SectionHeader(title: 'Featured Products'),
            ),
            GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                mainAxisExtent: 293,
              ),
              itemBuilder: (_, index) => _buildProductsSection(products[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Color(0xFF9E9E9E), size: 20),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for Products',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xFFBDBDBD),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SectionHeader(title: 'Special Offers'),
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

class CategoryItem {
  final String name;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  CategoryItem({
    required this.name,
    required this.icon,
    this.backgroundColor = const Color(0xFFF5F6FA),
    this.iconColor = const Color(0xFF3B82F6),
  });
}

class CategorySection extends StatelessWidget {
  final String title;
  final List<CategoryItem> categories;
  final double itemSize;
  final double spacing;
  final EdgeInsets padding;
  final Function(int)? onCategoryTap;

  const CategorySection({
    super.key,
    this.title = 'Popular Categories',
    required this.categories,
    this.itemSize = 60,
    this.spacing = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding,
          child: SectionHeader(title: 'Popular Categories')
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: itemSize + 30, // Account for text below
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: padding.left),
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: EdgeInsets.only(right: spacing),
                child: _buildCategoryItem(context, category, index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, CategoryItem category, int index) {
    return GestureDetector(
      onTap: () => onCategoryTap?.call(index),
      child: Column(
        children: [
          Container(
            width: itemSize,
            height: itemSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                category.icon,
                color: Colors.redAccent,
                size: itemSize * 0.4,
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: itemSize,
            child: Text(
              category.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage:
Widget _buildCategorySection() {
  final List<CategoryItem> demoCategories = [
    CategoryItem(name: 'Tires', icon: Icons.tire_repair, iconColor: Colors.black),
    CategoryItem(name: 'Engine Parts', icon: Icons.engineering, iconColor: Colors.red),
    CategoryItem(name: 'Interior', icon: Icons.airline_seat_recline_normal, iconColor: Colors.brown),
    CategoryItem(name: 'Accessories', icon: Icons.car_repair, iconColor: Colors.blue),
    CategoryItem(name: 'Oil & Fluids', icon: Icons.opacity, iconColor: Colors.amber),
    CategoryItem(name: 'Electronics', icon: Icons.electrical_services, iconColor: Colors.purple),
    CategoryItem(name: 'Body Kits', icon: Icons.directions_car, iconColor: Colors.green),
    CategoryItem(name: 'Tools', icon: Icons.handyman, iconColor: Colors.grey),
  ];

  return CategorySection(
    categories: demoCategories,
    onCategoryTap: (index) {
    },
  );
}

Widget _buildProductsSection(Product product) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.only(top: 1, left: 1, right: 1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            MpRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(8),
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  MpRoundedImage(
                    imageUrl: product.imageUrl,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    top: 12,
                    child: MpRoundedContainer(
                      radius: 8,
                      backgroundColor: Colors.yellow.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        "${product.discount}%",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.heart5, color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KProductTitleText(title: product.title, smallSize: true),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        product.brand,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(width: 4),
                      Icon(Iconsax.verify5, color: Colors.blue, size: 12),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${product.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: const SizedBox(
                          width: 38.4,
                          height: 38.4,
                          child: Center(
                            child: Icon(Iconsax.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class Product {
  final String title;
  final String imageUrl;
  final String brand;
  final double price;
  final int discount;

  Product({
    required this.title,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.discount,
  });
}

final List<Product> products = [

  Product(
    title: 'BlueOxy Shine Protectant and Cleaner (200 ml)',
    imageUrl: 'assets/images/spray.png',
    brand: 'BlueOxy',
    price: 499,
    discount: 20,
  ),
  Product(
    title: 'Bluetooth Connector for Car',
    imageUrl: 'assets/images/light.png',
    brand: 'Portronics',
    price: 449,
    discount: 25,
  ),
  Product(
    title: 'Automaze Alloy Wheel Hub Rim Udge Protector',
    imageUrl: 'assets/images/rimline.png',
    brand: 'Automaze',
    price: 789,
    discount: 45,
  ),
  Product(
    title: 'BlueOxy Shine Protectant and Cleaner (200 ml)',
    imageUrl: 'assets/images/spray.png',
    brand: 'BlueOxy',
    price: 399,
    discount: 40,
  ),
  Product(
    title: '3M Maxx wash & wax',
    imageUrl: 'assets/images/sunglassesholder.png',
    brand: '3M',
    price: 699,
    discount: 80,
  ),
  Product(
    title: 'BlueOxy Shine Protectant and Cleaner (200 ml)',
    imageUrl: 'assets/images/spray.png',
    brand: 'BlueOxy',
    price: 499,
    discount: 20,
  ),
  Product(
    title: 'Bluetooth Connector for Car',
    imageUrl: 'assets/images/light.png',
    brand: 'Portronics',
    price: 449,
    discount: 25,
  ),
  Product(
    title: 'Automaze Alloy Wheel Hub Rim Udge Protector',
    imageUrl: 'assets/images/rimline.png',
    brand: 'Automaze',
    price: 789,
    discount: 45,
  ),
  Product(
    title: 'BlueOxy Shine Protectant and Cleaner (200 ml)',
    imageUrl: 'assets/images/spray.png',
    brand: 'BlueOxy',
    price: 399,
    discount: 40,
  ),
  Product(
    title: '3M Maxx wash & wax',
    imageUrl: 'assets/images/sunglassesholder.png',
    brand: '3M',
    price: 699,
    discount: 80,
  ),
];
