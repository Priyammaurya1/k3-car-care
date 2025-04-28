import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k3carcare/utils/colors.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems = [
    CartItem("Premium Monthly Service", 999.0, "assets/images/monthly_service.png"),
    CartItem("Ultra Paint Protection", 1599.0, "assets/images/paint_protection.png"),
  ];

  final List<RecommendedItem> recommendedServices = [
    RecommendedItem("AC Disinfection", 399.0, "assets/images/ac_disinfection.png"),
    RecommendedItem("Tyre Polish", 199.0, "assets/images/tyre_polish.png"),
    RecommendedItem("Interior Deep Clean", 799.0, "assets/images/interior_clean.png"),
  ];

  final List<RecommendedItem> recommendedProducts = [
    RecommendedItem("Headlights", 1199.0, "assets/images/headlights.png"),
    RecommendedItem("Windshield Film", 499.0, "assets/images/windshield.png"),
    RecommendedItem("Music System", 4999.0, "assets/images/music_system.png"),
  ];

  final List<Payment> paymentHistory = [
    Payment('2023-10-01', 5899.0, 4),
    Payment('2023-10-05', 2199.0, 5),
    Payment('2023-10-10', 1099.0, 3),
  ];

  CartScreen({super.key});

  double get totalAmount => cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KColors.primaryBackground,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: KColors.textTitle, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(color: KColors.textTitle, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: KColors.textTitle),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Cart Section
                _buildSectionHeader("Items In Cart", "${cartItems.length} items"),
                _buildCartItemsContainer(),
                const SizedBox(height: 24),

                // Recommended Services Section
                _buildSectionHeader("Recommended Services", "Based on your car"),
                ...recommendedServices.map((service) => _buildRecommendedItem(service)),
                _buildViewMoreButton(),
                const SizedBox(height: 24),

                // Recommended Products Section
                _buildSectionHeader("Recommended Products", "Top accessories"),
                ...recommendedProducts.map((product) => _buildRecommendedItem(product)),
                _buildViewMoreButton(),
                const SizedBox(height: 24),

                // Payment History Section
                _buildSectionHeader("Payment History", "Recent transactions"),
                ...paymentHistory.map((payment) => PaymentCard(payment: payment)),
                _buildViewMoreButton(),
                const SizedBox(height: 100), // Bottom padding for checkout button
              ]),
            ),
          ),
        ],
      ),
      bottomSheet: _buildCheckoutBottomSheet(context),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: KColors.textTitle,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: KColors.textDesc.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsContainer() {
    return Container(
      decoration: BoxDecoration(
        color: KColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Cart items
          ...cartItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Column(
              children: [
                _buildCartItem(item),
                if (index < cartItems.length - 1) _buildDivider(),
              ],
            );
          }),
          
          // Total section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildDashedDivider(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Amount",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: KColors.textTitle,
                      ),
                    ),
                    Text(
                      "₹${totalAmount.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Including taxes & charges",
                      style: TextStyle(
                        fontSize: 12,
                        color: KColors.textDesc.withOpacity(0.6),
                      ),
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

  Widget _buildCartItem(CartItem item) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Item image
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: KColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.local_car_wash,
                size: 34,
                color: KColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: KColors.textTitle,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "One-time service",
                  style: TextStyle(
                    fontSize: 13,
                    color: KColors.textDesc.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          
          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹${item.price.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: KColors.textTitle,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: KColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete_outline,
                      size: 16,
                      color: KColors.primary,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "Remove",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: KColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedItem(RecommendedItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: KColors.cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Service image
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: KColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.local_car_wash,
                  size: 30,
                  color: KColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Service details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: KColors.textTitle,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 14,
                        color: KColors.textDesc.withOpacity(0.7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "45-60 min",
                        style: TextStyle(
                          fontSize: 13,
                          color: KColors.textDesc.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Price and add button
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₹${item.price.toStringAsFixed(0)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: KColors.textTitle,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: KColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewMoreButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: KColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "View More",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_forward,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Color(0xFFEEEEEE),
      height: 1,
      thickness: 1,
    );
  }

  Widget _buildDashedDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashWidth = 5.0;
          final dashCount = (constraints.constrainWidth() / (2 * dashWidth)).floor();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return Container(
                width: dashWidth,
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _buildCheckoutBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "₹${totalAmount.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: KColors.textTitle,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: KColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final String imageUrl;

  CartItem(this.name, this.price, this.imageUrl);
}

class RecommendedItem {
  final String name;
  final double price;
  final String imageUrl;

  RecommendedItem(this.name, this.price, this.imageUrl);
}

class Payment {
  final String date;
  final double amount;
  final int rating;

  Payment(this.date, this.amount, this.rating);
}

class PaymentCard extends StatelessWidget {
  final Payment payment;

  const PaymentCard({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: KColors.cardColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: KColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.receipt_long,
                  size: 24,
                  color: KColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹${payment.amount.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: KColors.textTitle,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    payment.date,
                    style: TextStyle(
                      fontSize: 13,
                      color: KColors.textDesc.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return Icon(
                  index < payment.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}