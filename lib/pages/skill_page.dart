import 'package:flutter/material.dart';
import 'package:portfolio/Cards/skill_content.dart';
import 'package:portfolio/Cards/intro_cards.dart';

class SkillPage extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const SkillPage({
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

          if (isMobileOrTablet) {
            // 📱 Mobile / Tablet: No IntroCard, scrollable content
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: const SkillsContent(isMobile: true),
            );
          }

          // 💻 Desktop: Show IntroCard and layout side-by-side
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 300,
                child: IntroCards(onContactPressed: () => onTap(5)),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: SkillsContent(isMobile: false),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
