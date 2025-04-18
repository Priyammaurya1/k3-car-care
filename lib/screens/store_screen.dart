import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import 'package:k3carcare/widgets/banner_section_store.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_grid.dart';
import '../widgets/product_list.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: KColors.primaryBackground,
        centerTitle: true,
        title: const Text(
          'Store',
          style: TextStyle(
            fontSize: 24,
            color: KColors.textTitle,
            fontWeight: FontWeight.bold,
          ), 
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(),
              SizedBox(height: 16),
              BannerSection(),
              SizedBox(height: 24),
              CategoryGrid(),
              SizedBox(height: 24),
              ProductList(),
            ],
          ),
        ),
      ),
    );
  }
}