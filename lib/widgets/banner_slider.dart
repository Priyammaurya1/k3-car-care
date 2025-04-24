import 'package:flutter/material.dart';
import 'dart:async';

class BannerSlider extends StatefulWidget {
  final List<String> assetPaths;
  final double height;
  final Duration autoScrollDuration;

  const BannerSlider({
    super.key,
    required this.assetPaths,
    this.height = 200.0,
    this.autoScrollDuration = const Duration(seconds: 3),
  });

  @override
  // ignore: library_private_types_in_public_api
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize with a large number to simulate infinite scrolling
    _pageController = PageController(initialPage: 1000);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page % widget.assetPaths.length;
              });
            },
            itemBuilder: (context, index) {
              // Get the actual asset path using modulo to cycle through the list
              final assetPath = widget.assetPaths[index % widget.assetPaths.length];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover, // Ensures the image fits the banner size
                    width: double.infinity,
                    height: widget.height,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: const Center(
                          child: Text('Image not available'),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.assetPaths.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Colors.red
                    : Colors.grey.shade400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
