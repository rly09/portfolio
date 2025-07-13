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
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobileOrTablet = constraints.maxWidth < 1100;
          final isMobile = constraints.maxWidth < 700;

          // ✅ Mobile / Tablet Layout
          if (isMobileOrTablet) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ✅ Show IntroCard only on mobile/tablet for HomePage
                  IntroCards(onContactPressed: () => onTap(5)),
                  const SizedBox(height: 24),
                  const MainContent(),
                ],
              ),
            );
          }

          // ✅ Desktop Layout
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left: Profile / Intro card
              SizedBox(
                width: 300,
                child: IntroCards(onContactPressed: () => onTap(5)),
              ),

              // Right: Main content area
              const Expanded(child: MainContent()),
            ],
          );
        },
      ),
    );
  }
}
