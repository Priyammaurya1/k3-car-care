import 'package:intl/intl.dart';

class Payment {
  final String id;
  final DateTime date;
  final double amount;
  final int rating;
  final String serviceType;

  Payment({
    required this.id,
    required this.date,
    required this.amount,
    required this.rating,
    this.serviceType = "Car service",
  });

  String get formattedDate => DateFormat('yyyy-MM-dd').format(date);
}