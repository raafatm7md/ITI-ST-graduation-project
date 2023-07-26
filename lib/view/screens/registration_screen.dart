import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/widgets/app_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordHidden= true;
  BorderSide usernameSide = BorderSide.none;
  BorderSide emailSide = BorderSide.none;
  BorderSide passwordSide = BorderSide.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height)/10),
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.text,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "Create an Account",
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.text,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  "Enter email address to create an account!",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon:
                          Image.asset('assets/Google__G__Logo.png', height: 25),
                      label: const Text(
                        "Continue with Google",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.text,
                        backgroundColor: Colors.white,
                        fixedSize: const Size(350, 50),
                        maximumSize: Size(MediaQuery.of(context).size.width, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      )),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: 40, bottom: 10),
                              child: Text(
                                "Username",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value!.contains(' ') ||
                                      value.contains('@') ||
                                      value.contains('&') ||
                                      value.length < 5) {
                                    usernameSide = const BorderSide();
                                    return 'Enter a valid username';
                                  }
                                  usernameSide = BorderSide.none;
                                  return null;
                                },
                                style: const TextStyle(color: AppColors.text),
                                decoration: InputDecoration(
                                  hintText: "Please enter a username",
                                  border: OutlineInputBorder(
                                    borderSide: usernameSide,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    )),
                                    filled: true,
                                    fillColor: AppColors.background,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                ),
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (!isEmail(value!)) {
                                    emailSide = const BorderSide();
                                    return "Enter a valid email";
                                  }
                                  emailSide = BorderSide.none;
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: AppColors.text),
                                decoration: InputDecoration(
                                    hintText: "Please enter your email",
                                  border: OutlineInputBorder(
                                      borderSide: emailSide,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      )),
                                  filled: true,
                                  fillColor: AppColors.background,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                              ),
                              ),),
                            const Padding(
                              padding:
                                  EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: isPasswordHidden,
                                validator: (value) {
                                  if (value!.length < 7) {
                                    passwordSide = const BorderSide();
                                    return 'Password length must be 8 or more characters';
                                  }
                                  passwordSide = BorderSide.none;
                                  return null;
                                },
                                style: const TextStyle(color: AppColors.text),
                                decoration: InputDecoration(
                                  hintText: "Please enter your password",
                                  border: OutlineInputBorder(
                                      borderSide: passwordSide,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      )),
                                  filled: true,
                                  fillColor: AppColors.background,
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.visibility,
                                      ),
                                      onPressed: () {
                                        isPasswordHidden = !isPasswordHidden;
                                        setState(() {});
                                      },
                                    ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: AppButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                      Text("Please check your data")));
                            }
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
        ),
      ),
    );
  }
}

bool isEmail(String email) {
  String regularExpression =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(regularExpression);
  return regExp.hasMatch(email);
}
