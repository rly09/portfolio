import 'package:flutter/material.dart';
import 'package:portfolio/Cards/about_content.dart';
import 'package:portfolio/Cards/intro_cards.dart';

class AboutPage extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AboutPage({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileOrTablet = screenWidth < 1100;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: isMobileOrTablet
          ? const AboutContent()
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: IntroCard
          const SizedBox(width: 40),
          // Right: About Content
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: AboutContent(),
            ),
          ),
        ],
      ),
    );
  }
}
