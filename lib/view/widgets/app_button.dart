import 'package:flutter/material.dart';

typedef ButtonCallback = void Function();

class AppButton extends StatelessWidget {
  final Color color;
  final String text;
  final ButtonCallback onPressed;

  const AppButton({
    required this.color,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 127, vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
