import 'package:flutter/material.dart';
import 'package:iti_graduation_project/view/screens/login_screen.dart';
import 'package:iti_graduation_project/view/widgets/app_button.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(
          text: "Get Started",
          color: AppColors.primary,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        ),
      ),
    );
  }
}
