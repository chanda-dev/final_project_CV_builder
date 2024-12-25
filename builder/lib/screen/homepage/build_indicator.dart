import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildIndicator extends StatelessWidget {
  const BuildIndicator(
      {super.key, required this.activeIndex, required this.slide});
  final int activeIndex;
  final List<String> slide;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: slide.length,
      effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
    );
  }
}
