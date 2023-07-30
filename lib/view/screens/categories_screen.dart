import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';

import '../widgets/category_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 2,
          children: const [
            Category(
                url: "assets/Nike.png",
                categoryName: "Nike",
                logoColor: AppColors.background),
            Category(
                url: "assets/Puma.png",
                categoryName: "Puma",
                logoColor: AppColors.background),
            Category(
                url: "assets/Adidas.png",
                categoryName: "Adidas",
                logoColor: AppColors.background),
          ],
        ),
      ),
    );
  }
}
