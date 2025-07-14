import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/section_header.dart';

class EducationExperienceContent extends StatelessWidget {
  const EducationExperienceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 40.0,
            vertical: isMobile ? 20.0 : 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: "Resume",
                iconPath: 'assets/icons/education.png',
              ),
              const SizedBox(height: 16),

              // Heading
              RichText(
                text: TextSpan(
                  style: GoogleFonts.exo2(
                    fontSize: isMobile ? 30 : 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: const [
                    TextSpan(text: 'Education '),
                    TextSpan(
                      text: '& Experience',
                      style: TextStyle(color: Color(0xFF00FFC6)), // Mint neon
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Timeline entries
              Column(
                children: const [
                  AnimatedTimelineEntry(
                    year: '2021-2023',
                    title: 'Class X\nClass XII',
                    school: 'Kendriya Vidalaya No. 2',
                  ),
                  SizedBox(height: 40),
                  AnimatedTimelineEntry(
                    year: '2024 - Present',
                    title: 'Bachelor Of Technology (CSE - IT)',
                    school: 'SRM Institute of Science and Technology',
                    isCurrent: true,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// Animated wrapper
class AnimatedTimelineEntry extends StatefulWidget {
  final String year;
  final String title;
  final String school;
  final bool isCurrent;

  const AnimatedTimelineEntry({
    super.key,
    required this.year,
    required this.title,
    required this.school,
    this.isCurrent = false,
  });

  @override
  State<AnimatedTimelineEntry> createState() => _AnimatedTimelineEntryState();
}

class _AnimatedTimelineEntryState extends State<AnimatedTimelineEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: TimelineEntry(
          year: widget.year,
          title: widget.title,
          school: widget.school,
          isCurrent: widget.isCurrent,
        ),
      ),
    );
  }
}

// Timeline Entry
class TimelineEntry extends StatelessWidget {
  final String year;
  final String title;
  final String school;
  final bool isCurrent;

  const TimelineEntry({
    super.key,
    required this.year,
    required this.title,
    required this.school,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dot + line
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCurrent ? const Color(0xFF00FFC6) : Colors.white,
                  boxShadow: isCurrent
                      ? [
                    BoxShadow(
                      color: const Color(0xFF00FFC6).withOpacity(0.8),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ]
                      : [],
                ),
              ),
              Container(
                width: 2,
                height: 60,
                color: Colors.white30,
              )
            ],
          ),
          const SizedBox(width: 16),

          // Entry text
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: GoogleFonts.inter(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.exo2(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  school,
                  style: GoogleFonts.inter(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
