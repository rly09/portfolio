import 'dart:ui';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const MyDrawer({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      "assets/icons/home.png",
      "assets/icons/person.png",
      "assets/icons/education.png",
      "assets/icons/skills.png",
      "assets/icons/project.png",
      "assets/icons/contact.png",
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth < 600 ? screenWidth * 0.95 : 550.0;

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 60,
          width: drawerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.07),
                Colors.white.withOpacity(0.03),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(icons.length, (index) {
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () => onTap(index),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: isSelected
                          ? [
                        BoxShadow(
                          color: Colors.greenAccent.withOpacity(0.6),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScale(
                          scale: isSelected ? 1.15 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: Image.asset(
                            icons[index],
                            height: 28,
                            width: 28,
                            color: isSelected ? Colors.greenAccent : Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: isSelected ? 6 : 0,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.greenAccent : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
