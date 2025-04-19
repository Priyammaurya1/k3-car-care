import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: categories.map((category) => CategoryItem(category: category)).toList(),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(
            category.icon,
            color: Colors.blue,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        // Text(
        //   category.name,
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
      ],
    );
  }
}