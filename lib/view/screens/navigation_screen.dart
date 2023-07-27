import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/screens/categories_screen.dart';
import 'package:iti_graduation_project/view/screens/home_screen.dart';
import 'package:iti_graduation_project/view/screens/profile_screen.dart';
import 'package:iti_graduation_project/view/widgets/drawer.dart';
import 'package:iti_graduation_project/view/widgets/header_text.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Map<String, Object>> screens = [
    {"screen": const HomeScreen(), "title": "HOME"},
    {"screen": const CategoriesScreen(), "title": "CATEGORIES"},
    {"screen":  ProfileScreen(), "title": "PROFILE"},
  ];
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Lable(
          text: screens[_selectedIndex]["title"] as String,
          size: 25,
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: screens[_selectedIndex]["screen"] as Widget,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(100)),
          child: SnakeNavigationBar.color(
            snakeViewColor: AppColors.background,
            height: 60,
            snakeShape: SnakeShape.circle,
            unselectedItemColor: AppColors.background,
            selectedItemColor: AppColors.text,
            shadowColor: AppColors.background,
            backgroundColor: AppColors.text,
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            selectedLabelStyle: const TextStyle(color: AppColors.text),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_outlined,
                    size: 30,
                  ),
                  label: "Categories"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                  ),
                  label: "Profile"),
            ],
            onTap: (index) {
              _selectedIndex = index;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
