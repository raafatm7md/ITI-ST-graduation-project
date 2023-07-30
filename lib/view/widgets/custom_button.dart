import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';

typedef ButtonCallback = void Function();

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final ButtonCallback onPressed;
  final double horizental;
  final double vertical;

  const CustomButton({
    required this.icon,
    this.vertical = 12,
    this.horizental = 20,
    this.color = AppColors.background,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: horizental, vertical: 5),
          // shape: const CircleBorder()),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.text, size: 40),
            const SizedBox(width: 2),
            Text(
              text,
              style: const TextStyle(color: AppColors.text),
            ),
          ],
        ),
      ),
    );
  }
}
