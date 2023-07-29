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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.asset("assets/logo.jpg"),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Step into your greatness with our shoes!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.lightBlue),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Comfortable and elegant steps await at our shoe store!\n Visit us today for fashionable shoes, special prices, \n and the best selection. and special prices!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.blueGrey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: AppButton(
                  text: "Get Started",
                  color: AppColors.primary,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
