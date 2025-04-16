import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  final List<Payment> payments = [
    Payment('2023-10-01', 30.0, 4),
    Payment('2023-10-05', 25.0, 5),
    Payment('2023-10-10', 20.0, 3),
  ];

  PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payments')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: payments.length,
          itemBuilder: (context, index) {
            return PaymentCard(payment: payments[index]);
          },
        ),
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

class PaymentCard extends StatelessWidget {
  final Payment payment;

  const PaymentCard({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Date: ${payment.date}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Amount Paid: \$${payment.amount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < payment.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                );
              }),
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: 'Write your review here...',
                // suffixIcon: IconButton(
                //   icon: Icon(Icons.done),
                //   onPressed: () {
                //      _showReviewDialog(context);
                //   },
              // )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   void _showReviewDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Add Your Review'),
//           content: TextField(
//             decoration: InputDecoration(hintText: "Write your review here..."),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Submit'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
