import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroCards extends StatelessWidget {
  final VoidCallback onContactPressed;

  const IntroCards({
    super.key,
    required this.onContactPressed,
  });

  final String linkedinUrl = "https://www.linkedin.com/in/roshan-lal-yogi-495569316/";
  final String githubUrl = "https://github.com/rly09";
  final String resumeUrl = "https://drive.google.com/uc?export=download&id=1-qfIvV6U46vyYQGNaTfGNgvH2hN4m8cC";

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 500;
        final cardWidth = isMobile ? double.infinity : 300.0;
        final imageSize = isMobile ? 180.0 : 260.0;
        final titleSize = isMobile ? 22.0 : 28.0;
        final subtitleSize = isMobile ? 16.0 : 20.0;

        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                width: cardWidth,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.05),
                      Colors.white.withOpacity(0.02),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Roshan Lal Yogi",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.exo2(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "App Developer",
                      style: GoogleFonts.inter(
                        fontSize: subtitleSize,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Profile image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: imageSize,
                        width: imageSize,
                        child: Image.asset('assets/images/me.jpg', fit: BoxFit.cover),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Social Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL(linkedinUrl),
                          child: Image.asset(
                            "assets/icons/linkedin.png",
                            height: 28,
                            width: 28,
                              color: const Color(0xFF00FFC6),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _launchURL(githubUrl),
                          child: Image.asset(
                            "assets/icons/github.png",
                            height: 28,
                            width: 28,
                            color: const Color(0xFF00FFC6),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Contact Info
                    Text(
                      "yogiroshan2005@gmail.com",
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                    Text(
                      "Rajasthan, India",
                      style: GoogleFonts.inter(
                        color: Colors.white60,
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Contact Me Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00FFC6),
                          foregroundColor: Colors.black,
                          minimumSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: onContactPressed,
                        icon: const Icon(Icons.mail, size: 24, color: Colors.black),
                        label: const Text(
                          "Contact Me",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Resume Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white10,
                          foregroundColor: const Color(0xFF00FFC6),
                          minimumSize: const Size(100, 50),
                          side: const BorderSide(color: Color(0xFF00FFC6)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _launchURL(resumeUrl),
                        icon: const Icon(Icons.download, size: 20, color: Colors.greenAccent),
                        label: Text(
                          "Resume",
                          style: GoogleFonts.exo2(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00FFC6),
                          )
                      ),
                    ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
