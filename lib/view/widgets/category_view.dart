import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/widgets/header_text.dart';

class Category extends StatefulWidget {
  final Color logoColor;
  final String url;
  final String categoryName;
  const Category({super.key,required this.url,required this.categoryName,required this.logoColor});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(10),

      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(60)),
        color: Colors.blueGrey.shade100
      ),

      child:Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(widget.url,
              color: AppColors.text),
            ),
            Lable(text: widget.categoryName,size: 30,colour: AppColors.text,)

          ],
        ),
      )
    );
  }
}
// Stack(
//
// clipBehavior: Clip.antiAliasWithSaveLayer,
// children: [
// Image
// (image: NetworkImage(widget.url),
// fit: BoxFit.cover,
// height: 400,
// width: 400,
// )
//
//
// ],
// ),