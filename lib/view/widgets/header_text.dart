import 'package:flutter/cupertino.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';

class Lable extends StatelessWidget {
  final String text;
  final double size;
  final Color colour;
  const Lable({
    super.key,
    required this.text,
    this.size = 50,
    this.colour = AppColors.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: colour,
      ),
    );
  }
}
