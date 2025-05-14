import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double scaleFactor;

  const OnboardingPage({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(scaleFactor * 0.16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: scaleFactor,
            height: scaleFactor,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: scaleFactor * 0.43,
              color: Color(0xFF0B6766),
            ),
          ),
          SizedBox(height: scaleFactor * 0.32),
          Text(
            title,
            style: TextStyle(
              fontSize: scaleFactor * 0.24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: scaleFactor * 0.12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: scaleFactor * 0.12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
