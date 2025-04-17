import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/utils/constants.dart';

class CartScreen extends StatelessWidget {
  final List<Payment> payments = [
    Payment('2023-10-01', 5899.0, 4),
    Payment('2023-10-05', 2199.0, 5),
    Payment('2023-10-10', 1099.0, 3),
  ];

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: KColors.primaryBackground,
        title: Text(
          'My Cart',
          style: TextStyle(color: KColors.textTitle, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: ListView(
          children: [
            // Cart Container
            Text("Items In Cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: KColors.textTitle)),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: KColors.cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCartItem("Premium Monthly Service", "₹999"),
                  // _buildDashedDivider(),
                  SizedBox(height: 20),
                  _buildCartItem("Ultra Paint Protection", "₹1599"),
                  SizedBox(height: 5),
                  _buildDashedDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Amount", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KColors.textTitle)),
                      Text("₹2198", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KColors.primary)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),

            // Recommended Services
            Text("Recommended Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: KColors.textTitle)),
            SizedBox(height: 10),
            _buildRecommendedService("AC Disinfection", "₹399"),
            _buildRecommendedService("Tyre Polish", "₹199"),
            _buildRecommendedService("Interior Deep Clean", "₹799"),
            TextButton(onPressed: () {}, child: Text("View More", style: TextStyle(color: KColors.primary, fontSize: 15))),

            SizedBox(height: 10),

            // Recommended Products
            Text("Recommended Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: KColors.textTitle)),
            SizedBox(height: 10),
            _buildRecommendedService("Headlights", "₹1199"),
            _buildRecommendedService("Windshield filement", "₹499"),
            _buildRecommendedService("Music system", "₹4999"),
            TextButton(onPressed: () {}, child: Text("View More", style: TextStyle(color: KColors.primary, fontSize: 15))),

            SizedBox(height: 10),

            // History Section
            Text("History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: KColors.textTitle)),
            SizedBox(height: 10),
            ...payments.map((payment) => NewPaymentCard(payment: payment)),
            TextButton(onPressed: (){}, child: Text('View More', style: TextStyle(color: KColors.primary, fontSize: 15))),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String title, String price, ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: KColors.white,
            borderRadius: BorderRadius.circular(Dimensions.cardRadius),
          ),
          child: Icon(Icons.local_car_wash, size: 40, color: Colors.grey.shade400),
        ),
        SizedBox(width: 10.0),
        Text(title, style: TextStyle(fontSize: 16, color: KColors.textDesc)),
        Spacer(),
        Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: KColors.textTitle)),
      ],
    );
  }

  Widget _buildRecommendedService(String title, String price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: KColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: KColors.white,
              borderRadius: BorderRadius.circular(Dimensions.cardRadius)
            ),
            child: Icon(Icons.local_car_wash, size: 40, color: Colors.grey.shade400),
          ),
          SizedBox(width: 10),
          Text(title, style: TextStyle(color: KColors.textDesc)),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: KColors.primary),
            onPressed: () {},
            child: Text("Add ₹${price.replaceAll('₹', '')}", style: TextStyle(color: KColors.white),),
          ),
        ],
      ),
    );
  }

  Widget _buildDashedDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashWidth = 6.0;
          final dashCount = (constraints.constrainWidth() / (2 * dashWidth)).floor();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey.shade400),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}


class Payment {
  final String date;
  final double amount;
  final int rating;

  Payment(this.date, this.amount, this.rating);
}

class NewPaymentCard extends StatelessWidget {
  final Payment payment;

  const NewPaymentCard({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: KColors.cardColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.receipt_long, color: KColors.primary),
        title: Text('Paid ₹${payment.amount.toStringAsFixed(2)}',
            style: TextStyle(fontWeight: FontWeight.bold, color: KColors.textTitle)),
        subtitle: Text('Date: ${payment.date}',
        style: TextStyle(color: KColors.textDesc),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              index < payment.rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 18,
            );
          }),
        ),
      ),
    );
  }
}
