import 'package:flutter/material.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/education_page.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/pages/skill_page.dart';
import 'package:portfolio/utils/my_drawer.dart';

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
      theme: ThemeData.dark(),
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
  final PageController _controller = PageController();
  int _selectedIndex = 0;

  void _navigateToPage(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1000;
          return Stack(
            children: [
              // Scrollable Page Sections
              PageView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                children: [
                  HomePage(
                    selectedIndex: _selectedIndex,
                    onTap: _navigateToPage,
                  ),
                  AboutPage(
                    selectedIndex: _selectedIndex,
                    onTap: _navigateToPage,
                  ),
                  EducationPage(
                    selectedIndex: _selectedIndex,
                    onTap: _navigateToPage,
                  ),
                  SkillPage(
                    selectedIndex: _selectedIndex,
                    onTap: _navigateToPage,
                  ),
                  ProjectsPage(
                    selectedIndex: _selectedIndex,
                    onTap: _navigateToPage,
                  ),
                  ContactPage(
                    selectedIndex: _selectedIndex,
                    onTap: _navigateToPage,
                  ),
                ],
              ),

              // Responsive Drawer Positioning
              Positioned(
                bottom: isMobile ? 10 : 20,
                left: isMobile
                    ? 20
                    : isTablet
                    ? constraints.maxWidth * 0.2
                    : constraints.maxWidth * 0.3,
                right: isMobile
                    ? 20
                    : isTablet
                    ? constraints.maxWidth * 0.2
                    : constraints.maxWidth * 0.3,
                child: MyDrawer(
                  selectedIndex: _selectedIndex,
                  onTap: _navigateToPage,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
