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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SectionHeaderr(title: 'Featured Products'),
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
                      child: Icon(
                        Icons.category,
                        color: Colors.black,
                        size: 24,
                      ),
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
              color: Colors.grey.withOpacity(0.1),
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
                      backgroundColor: Colors.yellow.withOpacity(0.8),
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
                        '\$${product.price}',
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
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  Product(
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  Product(
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  Product(
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  Product(
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  Product(
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  Product(
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  Product(
    title: 'AlleXtreme Accessories Kit for Bike',
    imageUrl: 'assets/images/bike-kit.png',
    brand: 'AlleXtreme',
    price: 35.5,
    discount: 25,
  ),
  // Add 2 more for 4 total
];
