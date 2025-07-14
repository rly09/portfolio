import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
              style: GoogleFonts.exo2(
                fontSize: isMobile ? 32 : 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: const [
                TextSpan(text: 'Featured '),
                TextSpan(
                  text: 'Projects',
                  style: TextStyle(color: Color(0xFF00FFC6)), // Mint Neon
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: const [
              ProjectCard(
                imagePath: 'assets/icons/careerverse.png',
                title: 'Career Verse',
                tags: ['Flutter', 'Supabase','Isar'],
                projectUrl: 'https://career-navigation-app.vercel.app/',
              ),
              ProjectCard(
                imagePath: 'assets/icons/pdfbrain.png',
                title: 'PDF Brain',
                tags: ['Flutter'],
                projectUrl: 'https://pdf-brain.vercel.app/',
              ),
              ProjectCard(
                imagePath: 'assets/icons/tictactoe.png',
                title: 'Tic Tac Toe',
                tags: ['Flutter'],
                projectUrl: 'https://tic-tac-toe-bice-three-17.vercel.app/',
              ),
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
  final String projectUrl;

  const ProjectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.tags,
    required this.projectUrl,
  });

  Future<void> _launchProject() async {
    final uri = Uri.parse(projectUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $projectUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return GestureDetector(
      onTap: _launchProject,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: isMobile ? double.infinity : 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    Positioned(left: 0, top: 0, bottom: 0, child: Container(width: 10, color: Colors.black)),
                    Positioned(right: 0, top: 0, bottom: 0, child: Container(width: 10, color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: tags
                    .map((tag) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ))
                    .toList(),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: GoogleFonts.exo2(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
