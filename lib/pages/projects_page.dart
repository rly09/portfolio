import 'package:flutter/material.dart';
import 'package:portfolio/Cards/project_content.dart';
import 'package:portfolio/Cards/intro_cards.dart';

class ProjectsPage extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const ProjectsPage({
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

          // ✅ Mobile/Tablet Layout (No IntroCard)
          if (isMobileOrTablet) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: const ProjectsContent(),
            );
          }

          // ✅ Desktop Layout (With IntroCard)
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
                  child: ProjectsContent(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
