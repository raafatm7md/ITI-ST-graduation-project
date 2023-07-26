import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/widgets/custom_button.dart';
import 'package:iti_graduation_project/view/widgets/header_text.dart';
import 'package:iti_graduation_project/widget/custom_text.dart';

import '../../widget/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    CustomText(
                      text: "Enjoy New",
                      size: 40,
                    ),
                    Lable(
                      text: "Products",
                      size: 40,
                    ),
                  ],
                ),
                Container(
                  height: 75,
                  width: 85,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        bottomStart: Radius.circular(30),
                      ),
                      color: AppColors.warning),
                  child: const Center(
                    child: Icon(Icons.add_business_outlined,
                        color: AppColors.background),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomButton(
                      text: "Men",
                      onPressed: () {},
                      icon: Icons.man_2_outlined),
                  CustomButton(
                      text: "Women",
                      onPressed: () {},
                      icon: Icons.woman_2_outlined),
                  CustomButton(
                      text: "Men",
                      onPressed: () {},
                      icon: Icons.sports_baseball_outlined),
                  CustomButton(
                      text: "Women",
                      onPressed: () {},
                      icon: Icons.sports_soccer_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: const [
            Item(
                imageUrl:
                    "https://cdn.sportsshoes.com/product/H/HOK1548/HOK1548_1000_1.jpg",
                itemName: "nike",
                price: "1000"),
            Item(
                imageUrl:
                    "https://cdn.sportsshoes.com/product/H/HOK1548/HOK1548_1000_1.jpg",
                itemName: "nike",
                price: "1000"),
            Item(
                imageUrl:
                    "https://cdn.sportsshoes.com/product/H/HOK1548/HOK1548_1000_1.jpg",
                itemName: "nike",
                price: "1000"),
            Item(
                imageUrl:
                    "https://cdn.sportsshoes.com/product/H/HOK1548/HOK1548_1000_1.jpg",
                itemName: "nike",
                price: "1000"),
            Item(
                imageUrl:
                    "https://cdn.sportsshoes.com/product/H/HOK1548/HOK1548_1000_1.jpg",
                itemName: "nike",
                price: "1000")
          ],
        ),
      ),
    ]);
  }
}
// Padding(
// padding: const EdgeInsets.only(
// left: 15,
// top: 15,
// ),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Column(children: [
// CustomText(text: "Enjoy New",
// size: 40,),
// Lable(text: "Products",
// size: 40,),
// ],),
// Container(
// height: 75,
// width: 85,
// decoration: BoxDecoration(
// borderRadius: BorderRadiusDirectional.only(
// topStart: Radius.circular(30),
// bottomStart: Radius.circular(30),
// ),
// color: AppColors.warning
// ),
// child: Center(
// child: Icon(Icons.add_business_outlined,
// color: AppColors.background),
// ),
//
//
// ),
//
// ],
// ),
// SizedBox(height: 10,),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
//
//
// children: [
// CustomButton(text: "Men", onPressed: (){},icon: Icons.man_2_outlined),
// CustomButton(text: "Women", onPressed: (){},icon: Icons.woman_2_outlined),
// CustomButton(text: "Men", onPressed: (){},icon: Icons.sports_baseball_outlined),
// CustomButton(text: "Women", onPressed: (){},icon: Icons.sports_soccer_outlined),
//
// ],
// ),
// ),
// SizedBox(height: 10,),
//
//
//
//
//
//
//
//
//
//
// ],
// ),
// ),
// );
