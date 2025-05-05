import 'package:flutter/material.dart';
import 'package:k3carcare/widgets/section_header.dart';
import 'package:k3carcare/widgets/service_widget.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
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
            // Main title
            const Text(
              'My Services',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            // Subtitle
            Text(
              'Get the best services for your car',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          // Help button
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
              // Help functionality will be implemented here
              // Maybe show a dialog with helpful information
            },
          ),
          const SizedBox(width: 16),
        ],
        // Rounded bottom corners for AppBar
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                const SectionHeader(title: 'Available Services'),
                ServiceWidget(),
                const SizedBox(height: 16),
                ServiceWidget(),
                const SizedBox(height: 16),
                ServiceWidget(),
                const SizedBox(height: 16),
                ServiceWidget(),
                const SizedBox(height: 16),
                ServiceWidget(),
                const SizedBox(height: 16),
                ServiceWidget(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
