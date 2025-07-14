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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileOrTablet = screenWidth < 1100;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: isMobileOrTablet
          ? const SkillsContent(isMobile: true)
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 40),
          // Right: Skills Content
          const Expanded(
            child: SkillsContent(isMobile: false),
          ),
        ],
      ),
    );
  }
}
