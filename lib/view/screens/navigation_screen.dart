import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/screens/categories_screen.dart';
import 'package:iti_graduation_project/view/screens/home_screen.dart';
import 'package:iti_graduation_project/view/screens/profile_screen.dart';
import 'package:iti_graduation_project/view/widgets/drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Map<String, Object>> screens = [
    {"screen": const HomeScreen(), "title": "HOME"},
    {"screen": const CategoriesScreen(), "title": "CATEGORIES"},
    {"screen": const ProfileScreen(), "title": "PROFILE"},
  ];
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screens[_selectedIndex]["title"] as String,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.text,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: screens[_selectedIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile")
        ],
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
