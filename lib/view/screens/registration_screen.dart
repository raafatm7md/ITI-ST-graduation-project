import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/screens/navigation_screen.dart';
import 'package:iti_graduation_project/view/widgets/app_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "SIGN UP",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Create an Account",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Text(
              "Enter email address to create an account!",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/Google__G__Logo.png', height: 25),
                  label: const Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blueGrey,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: AppButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationScreen(),
                          ),
                        );
                      },
                      text: 'Sign Up',
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
