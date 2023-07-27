import 'package:flutter/material.dart';

typedef ButtonCallback = void Function();

class AppButton extends StatelessWidget {
  final Color color;
  final String text;
  final ButtonCallback onPressed;
  final double horizental;
  final double vertical;

  const AppButton({
    this.vertical = 12,
    this.horizental = 127,
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
            foregroundColor: Colors.white,
            backgroundColor: color,
            alignment: AlignmentDirectional.center,
            fixedSize: const Size(350, 50),
            maximumSize: Size(MediaQuery.of(context).size.width, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
