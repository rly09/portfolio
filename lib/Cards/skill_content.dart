import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/section_header.dart';

class SkillsContent extends StatelessWidget {
  final bool isMobile;

  const SkillsContent({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final double headingFontSize = isMobile ? 32 : 60;
    final double spacing = isMobile ? 20 : 40;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: "Skills",
            iconPath: 'assets/icons/skills.png',
          ),
          const SizedBox(height: 16),

          // Heading
          RichText(
            text: TextSpan(
              style: GoogleFonts.exo2(
                fontSize: headingFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              children: const [
                TextSpan(text: 'My '),
                TextSpan(
                  text: 'Advantages',
                  style: TextStyle(color: Color(0xFF00FFC6)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Grid
          Center(
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              alignment: WrapAlignment.center,
              children: const [
                SkillCircle(iconPath: 'assets/icons/flutter.png', label: 'Flutter'),
                SkillCircle(iconPath: 'assets/icons/c++.png', label: 'C++'),
                SkillCircle(iconPath: 'assets/icons/python.png', label: 'Python'),
                SkillCircle(iconPath: 'assets/icons/supabase.png', label: 'Supabase'),
                SkillCircle(iconPath: 'assets/icons/firebase.png', label: 'Firebase'),
                SkillCircle(iconPath: 'assets/icons/mysql.png', label: 'MySQL'),
                SkillCircle(iconPath: 'assets/icons/github.png', label: 'GitHub'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SkillCircle extends StatelessWidget {
  final String iconPath;
  final String label;

  const SkillCircle({
    super.key,
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final double iconSize = isMobile ? 70 : 100;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: iconSize,
          width: iconSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24, width: 1.2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00FFC6).withOpacity(0.3), // Neon glow
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Image.asset(iconPath, fit: BoxFit.contain),
        ),
        const SizedBox(height: 12),
        Text(
          label.toUpperCase(),
          style: GoogleFonts.rajdhani(
            color: Colors.white.withOpacity(0.85),
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
