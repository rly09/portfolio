import 'package:flutter/material.dart';
import '../utils/section_header.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: "About",
            iconPath: 'assets/icons/person.png',
          ),
          const SizedBox(height: 20),

          // Quote
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '"Start ',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 60,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00FF9F),
                  ),
                ),
                TextSpan(
                  text: 'where you are.',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: '\nUse ',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 60,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00FF9F),
                  ),
                ),
                TextSpan(
                  text: 'what you have.',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: '\nDo ',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 60,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF00FF9F),
                  ),
                ),
                TextSpan(
                  text: 'what you can."',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "~Arthur Ashe",
              style: TextStyle(
                color: Colors.white70,
                fontSize: isMobile ? 16 : 20,
              ),
            ),
          ),

          const SizedBox(height: 40),

          Text(
            "A passionate Flutter developer who believes that the best apps are not just functional—they're beautifully simple, intuitive, and built with purpose. "
                "I specialize in creating modern, responsive mobile applications with clean UIs, smooth user experiences, and robust architecture. "
                "With a strong foundation in Flutter and experience using tools like Supabase, Isar, and Hive, I enjoy crafting apps that feel fast, fluid, and ready for real-world use. "
                "I’m also expanding into backend technologies like Python and FastAPI to become a more complete full-stack app developer.",
            style: TextStyle(
              color: Colors.white60,
              fontSize: isMobile ? 14 : 16,
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 20),

          Text(
            "Every project I work on is a chance to solve real problems, learn something new, and turn ideas into polished, interactive experiences. "
                "I take pride in writing clean code, paying attention to detail, and constantly evolving my skills. "
                "When I’m not building apps, I’m usually exploring design trends, leveling up my coding abilities, or diving into new tech that inspires me.",
            style: TextStyle(
              color: Colors.white60,
              fontSize: isMobile ? 14 : 16,
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
