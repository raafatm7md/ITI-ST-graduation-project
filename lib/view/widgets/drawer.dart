import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/utilities/google_signin.dart';
import 'package:iti_graduation_project/view/screens/navigation_screen.dart';
import 'package:iti_graduation_project/view/screens/welcome_screen.dart';
import '../screens/about_screen.dart';
import '../screens/developers_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(
                width: 60,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "MENU",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NavigationScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("About"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Developers"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DevelopersScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Sign Out"),
            onTap: () async {
              googleSignOut();
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
                (_) => false,
              );
            },
            leading: const Icon(
              Icons.exit_to_app_rounded,
              color: AppColors.warning,
            ),
          ),
        ],
      ),
    );
  }
}
