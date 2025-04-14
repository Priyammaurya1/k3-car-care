import 'package:flutter/material.dart';
import 'package:k3carcare/utils/colors.dart';
import '../utils/constants.dart';

class BannerSlider extends StatefulWidget {
  final int bannerCount;
  
  const BannerSlider({
    super.key,
    this.bannerCount = 5,
  });

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 190,
          decoration: BoxDecoration(
            color: KColors.white,
            borderRadius: BorderRadius.circular(Dimensions.cardRadius),
            border: Border.all(color: KColors.borderPrimary),
          ),
          child: Center(
            child: Text(
              '"banners"',
              style: TextStyle(color: KColors.textPrimary),
            ),
          ),
        ),
        const SizedBox(height: Dimensions.smallSpacing),
        // Dots for banner slides
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.bannerCount,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _currentSlide = index;
                });
              },
              child: Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentSlide == index
                      ? KColors.primary
                      : KColors.darkGrey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}