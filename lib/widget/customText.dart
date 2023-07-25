import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';

class CustomText extends StatelessWidget {
  String text;
  double size;
  Color color;
  CustomText({super.key,required this.text,this.size=20,this.color=AppColors.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(

        fontSize: size,
        color: color,
      ),);
  }
}
