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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobileOrTablet = screenWidth < 1100;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: isMobileOrTablet
          ? const ProjectsContent()
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 40),
          // Right: Project content
          const Expanded(
            child: ProjectsContent(),
          ),
        ],
      ),
    );
  }
}
