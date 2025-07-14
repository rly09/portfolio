import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/education_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/pages/skill_page.dart';
import 'package:portfolio/utils/my_drawer.dart';
import 'package:portfolio/Cards/intro_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Roshan Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1115),
        primaryColor: const Color(0xFF00FFC6),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.exo2(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00FFC6),
          ),
          titleLarge: GoogleFonts.exo2(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: const Color(0xFFDEE4E7),
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 14,
            color: const Color(0xFFB0B8BB),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  // GlobalKeys for sections
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final educationKey = GlobalKey();
  final skillKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final sectionOffsets = <int, GlobalKey>{
      0: homeKey,
      1: aboutKey,
      2: educationKey,
      3: skillKey,
      4: projectsKey,
      5: contactKey,
    };

    for (var entry in sectionOffsets.entries) {
      final context = entry.value.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;
        if (position < 300 && position > -300) {
          setState(() => _selectedIndex = entry.key);
          break;
        }
      }
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final offset = box.localToGlobal(Offset.zero).dy + _scrollController.offset - 80;

      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1100;
    final isTablet = screenWidth >= 600 && screenWidth < 1100;
    final isMobile = screenWidth < 600;

    if (isDesktop) {
      return Scaffold(
        backgroundColor: Color(0xFF0F1115),
        body: Row(
          children: [
            // 🧊 Fixed IntroCard (Left Side)
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  IntroCards(onContactPressed: () => _scrollToSection(contactKey)),
                ],
              ),
            ),

            // 🔄 Scrollable Right Side
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        SectionWrapper(key: homeKey, child: HomePage(selectedIndex: _selectedIndex, onTap: (_) {})),
                        SectionWrapper(key: aboutKey, child: AboutPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                        SectionWrapper(key: educationKey, child: EducationPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                        SectionWrapper(key: skillKey, child: SkillPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                        SectionWrapper(key: projectsKey, child: ProjectsPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                        SectionWrapper(key: contactKey, child: ContactPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                      ],
                    ),
                  ),

                  // 🎯 Drawer at bottom center
                  Positioned(
                    bottom: 20,
                    left: 100,
                    right: 100,
                    child: MyDrawer(
                      selectedIndex: _selectedIndex,
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            _scrollToSection(homeKey);
                            break;
                          case 1:
                            _scrollToSection(aboutKey);
                            break;
                          case 2:
                            _scrollToSection(educationKey);
                            break;
                          case 3:
                            _scrollToSection(skillKey);
                            break;
                          case 4:
                            _scrollToSection(projectsKey);
                            break;
                          case 5:
                            _scrollToSection(contactKey);
                            break;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      // 📱 Tablet or Mobile
      return Scaffold(
        backgroundColor: Color(0xFF0F1115),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  IntroCards(onContactPressed: () => _scrollToSection(contactKey)),
                  SectionWrapper(key: homeKey, child: HomePage(selectedIndex: _selectedIndex, onTap: (_) {})),
                  SectionWrapper(key: aboutKey, child: AboutPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                  SectionWrapper(key: educationKey, child: EducationPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                  SectionWrapper(key: skillKey, child: SkillPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                  SectionWrapper(key: projectsKey, child: ProjectsPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                  SectionWrapper(key: contactKey, child: ContactPage(selectedIndex: _selectedIndex, onTap: (_) {})),
                ],
              ),
            ),

            // 🔽 Drawer for smaller screens
            Positioned(
              bottom: isMobile ? 10 : 20,
              left: isMobile
                  ? 20
                  : isTablet
                  ? screenWidth * 0.2
                  : screenWidth * 0.3,
              right: isMobile
                  ? 20
                  : isTablet
                  ? screenWidth * 0.2
                  : screenWidth * 0.3,
              child: MyDrawer(
                selectedIndex: _selectedIndex,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      _scrollToSection(homeKey);
                      break;
                    case 1:
                      _scrollToSection(aboutKey);
                      break;
                    case 2:
                      _scrollToSection(educationKey);
                      break;
                    case 3:
                      _scrollToSection(skillKey);
                      break;
                    case 4:
                      _scrollToSection(projectsKey);
                      break;
                    case 5:
                      _scrollToSection(contactKey);
                      break;
                  }
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}

// 🧩 Wrapper for each section
class SectionWrapper extends StatelessWidget {
  final Widget child;
  const SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 60),
        child: child,
      ),
    );
  }
}
