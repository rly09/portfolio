import 'package:flutter/material.dart';
import 'package:portfolio/Cards/intro_cards.dart';
import 'package:portfolio/Cards/main_content.dart';

class HomePage extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const HomePage({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileOrTablet = screenWidth < 1100;
    final isMobile = screenWidth < 700;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: isMobileOrTablet
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MainContent(),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 40),
          const Expanded(child: MainContent()),
        ],
      ),
    );
  }
}
