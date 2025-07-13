import 'package:flutter/material.dart';
import '../utils/section_header.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: "Introduction",
            iconPath: 'assets/icons/home.png',
          ),
          const SizedBox(height: 24),

          // Intro Text
          Text(
            "Hello There, I'm",
            style: TextStyle(
              fontSize: isMobile ? 26 : 50,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),

          // Name + Role
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Roshan, ',
                  style: TextStyle(
                    fontSize: isMobile ? 34 : 68,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00FF9F),
                  ),
                ),
                TextSpan(
                  text: 'App Developer and\nFlutter Developer',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Description
          Text(
            "I create beautifully simple and intuitive mobile apps, blending clean design with purposeful code\n"
                "to craft experiences that feel as good as they work.",
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.white60,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
