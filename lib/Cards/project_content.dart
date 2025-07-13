import 'package:flutter/material.dart';
import '../utils/section_header.dart';

class ProjectsContent extends StatelessWidget {
  const ProjectsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.0 : 40.0,
        vertical: isMobile ? 20.0 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: "Project",
            iconPath: 'assets/icons/project.png',
          ),
          const SizedBox(height: 16),

          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: isMobile ? 32 : 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: const [
                TextSpan(text: 'Featured '),
                TextSpan(
                  text: 'Projects',
                  style: TextStyle(color: Color(0xFF00FF9F)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // ✅ Replace GridView with Wrap for scroll-safe layout
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: const [
              ProjectCard(
                imagePath: 'assets/icons/careerverse.png',
                title: 'Career Verse',
                tags: ['Flutter', 'Supabase'],
              ),
              // Add more ProjectCard widgets here if needed
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final List<String> tags;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SizedBox(
      width: isMobile ? double.infinity : 400, // Responsive card width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card with side stripes and image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Tags
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: tags
                .map(
                  (tag) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 10),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
