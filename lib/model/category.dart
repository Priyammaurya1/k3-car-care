import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

final List<Category> categories = [
  Category(name: 'Exterior', icon: Iconsax.car),
  Category(name: 'Interior', icon: Icons.airline_seat_recline_normal),
  Category(name: 'Packages', icon: Icons.card_giftcard),
  Category(name: 'Equipment', icon: Icons.build),
  Category(name: 'Accessories', icon: Icons.auto_fix_high_outlined),
  Category(name: 'Products', icon: Icons.shopping_bag),
  Category(name: 'Detailing', icon: Icons.auto_fix_high),
  Category(name: 'Booking', icon: Icons.calendar_today),
];
