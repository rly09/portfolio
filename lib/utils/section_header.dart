import 'dart:ui';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String iconPath;
  final String title;

  const SectionHeader({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white24),
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.02),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(0.8),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Image.asset(
                  iconPath,
                  height: isMobile ? 18 : 20,
                  width: isMobile ? 18 : 20,
                  color: Colors.greenAccent,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                  shadows: [
                    Shadow(
                      color: Colors.greenAccent.withOpacity(0.7),
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
