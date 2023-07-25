import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/widgets/headerText.dart';
import 'package:iti_graduation_project/widget/customText.dart';

typedef ButtonCallback = void Function();

class CustomButton extends StatelessWidget {
  IconData icon;
  Color color;
  final String text;
  final ButtonCallback onPressed;
  final double horizental;
  double vertical;

  CustomButton({
    required this.icon,
    this.vertical=12,
    this.horizental=30,
    this.color=AppColors.background,
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
              padding:  EdgeInsets.symmetric(horizontal:horizental , vertical: 12),
              shape: CircleBorder()
          ),
          child:Center(
            child: Icon(
                icon,color: AppColors.text,
                size: 50
            ),
          )
      ),
    );
  }
}
