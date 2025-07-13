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
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobileOrTablet = constraints.maxWidth < 1100;

          // ✅ Mobile/Tablet Layout: No IntroCard
          if (isMobileOrTablet) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: const AboutContent(),
            );
          }

          // ✅ Desktop Layout: Show IntroCard on left
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left: IntroCard
              SizedBox(
                width: 300,
                child: IntroCards(
                  onContactPressed: () => onTap(5),
                ),
              ),

              // Right: Main Content
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: AboutContent(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
