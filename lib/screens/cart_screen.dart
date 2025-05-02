import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:k3carcare/bottom_nav_bar.dart';
import 'package:k3carcare/models/cart_item.dart';
import 'package:k3carcare/models/payment.dart';
import 'package:k3carcare/models/recommended_item.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/utils/styles.dart';
import 'package:k3carcare/widgets/cart_item_card.dart';
import 'package:k3carcare/widgets/cart_section_header.dart';
import 'package:k3carcare/widgets/checkout_bottom_sheet.dart';
import 'package:k3carcare/widgets/payment_card.dart';
import 'package:k3carcare/widgets/recommended_item_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample data - in a real app, this would come from a provider or API
  final List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      name: "Premium Monthly Service",
      price: 999.0,
      imageUrl: "assets/images/monthly_service.png",
    ),
    CartItem(
      id: '2',
      name: "Ultra Paint Protection",
      price: 1599.0,
      imageUrl: "assets/images/paint_protection.png",
    ),
  ];

  final List<RecommendedItem> _recommendedServices = [
    RecommendedItem(
      id: '1',
      name: "AC Disinfection",
      price: 399.0,
      imageUrl: "assets/images/ac_disinfection.png",
      type: "service",
      duration: "30-45 min",
    ),
    RecommendedItem(
      id: '2',
      name: "Tyre Polish",
      price: 199.0,
      imageUrl: "assets/images/tyre_polish.png",
      type: "service",
      duration: "15-20 min",
    ),
    RecommendedItem(
      id: '3',
      name: "Interior Deep Clean",
      price: 799.0,
      imageUrl: "assets/images/interior_clean.png",
      type: "service",
      duration: "60-90 min",
    ),
  ];

  final List<RecommendedItem> _recommendedProducts = [
    RecommendedItem(
      id: '4',
      name: "Headlights",
      price: 1199.0,
      imageUrl: "assets/images/headlights.png",
      type: "product",
    ),
    RecommendedItem(
      id: '5',
      name: "Windshield Film",
      price: 499.0,
      imageUrl: "assets/images/windshield.png",
      type: "product",
    ),
    RecommendedItem(
      id: '6',
      name: "Music System",
      price: 4999.0,
      imageUrl: "assets/images/music_system.png",
      type: "product",
    ),
  ];

  final List<Payment> _paymentHistory = [
    Payment(id: '1', date: DateTime(2023, 10, 1), amount: 5899.0, rating: 4),
    Payment(
      id: '2',
      date: DateTime(2023, 10, 5),
      amount: 2199.0,
      rating: 5,
      serviceType: "Exterior detailing",
    ),
    Payment(
      id: '3',
      date: DateTime(2023, 10, 10),
      amount: 1099.0,
      rating: 3,
      serviceType: "Oil change",
    ),
  ];

  double get _totalAmount =>
      _cartItems.fold(0, (sum, item) => sum + item.price);

  void _removeCartItem(String id) {
    setState(() {
      _cartItems.removeWhere((item) => item.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item removed from cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _addToCart(RecommendedItem item) {
    setState(() {
      _cartItems.add(
        CartItem(
          id: item.id,
          name: item.name,
          price: item.price,
          imageUrl: item.imageUrl,
          description: item.isService ? "One-time service" : "Accessory",
        ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item added to cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _checkout() {
    // In a real app, this would navigate to the checkout screen or process payment
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Proceeding to checkout...'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryBackground,
      appBar: _buildAppBar(),
      body: _cartItems.isEmpty ? _buildEmptyCart() : _buildCartContent(),
      bottomSheet:
          _cartItems.isEmpty
              ? null
              : CheckoutBottomSheet(
                totalAmount: _totalAmount,
                onCheckout: _checkout,
              ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: const Text(
        'My Cart',
        style: TextStyle(
          color: KColors.textTitle,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: KColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: KColors.primary,
            ),
          ),
          const SizedBox(height: 24),
          const Text("Your cart is empty", style: KStyles.heading2),
          const SizedBox(height: 12),
          Text(
            "Browse services and products to add them to your cart",
            style: KStyles.body2.copyWith(color: KColors.textDesc),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NavigationMenu()),
                ),
            style: KStyles.primaryButton,
            child: const Text("Browse Services"),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              // Cart Section
              SectionHeader(
                title: "Items In Cart",
                subtitle: "${_cartItems.length} items",
                onActionPressed: () {},
              ),
              _buildCartItemsContainer(),
              const SizedBox(height: 24),

              // Recommended Services Section
              SectionHeader(
                title: "Recommended Services",
                subtitle: "Based on your car",
                actionText: "View More",
                onActionPressed: () {},
              ),
              ..._recommendedServices.map(
                (service) => RecommendedItemCard(
                  item: service,
                  onAdd: () => _addToCart(service),
                ),
              ),
              const SizedBox(height: 24),

              // Recommended Products Section
              SectionHeader(
                title: "Recommended Products",
                subtitle: "Top accessories",
                actionText: "View More",
                onActionPressed: () {},
              ),
              ..._recommendedProducts.map(
                (product) => RecommendedItemCard(
                  item: product,
                  onAdd: () => _addToCart(product),
                ),
              ),
              const SizedBox(height: 24),

              // Payment History Section
              SectionHeader(
                title: "Payment History",
                subtitle: "Recent transactions",
                actionText: "View More",
                onActionPressed: () {},
              ),
              ..._paymentHistory.map(
                (payment) => PaymentCard(
                  payment: payment,
                  onTap: () {
                    // View payment details
                  },
                ),
              ),
              const SizedBox(height: 100), // Bottom padding for checkout button
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildCartItemsContainer() {
    return Container(
      decoration: KStyles.cardDecoration,
      child: Column(
        children: [
          // Cart items
          ..._cartItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return CartItemCard(
              item: item,
              onRemove: () => _removeCartItem(item.id),
              showDivider: index < _cartItems.length - 1,
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
                      "₹${_totalAmount.toStringAsFixed(0)}",
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

  Widget _buildDashedDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashWidth = 5.0;
          final dashCount =
              (constraints.constrainWidth() / (2 * dashWidth)).floor();
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
}
