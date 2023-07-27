import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/screens/navigation_screen.dart';
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
  bool isPasswordHidden = true;
  BorderSide usernameSide = BorderSide.none;
  BorderSide emailSide = BorderSide.none;
  BorderSide passwordSide = BorderSide.none;
  double padding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height) / 10),
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
                        maximumSize:
                            Size(MediaQuery.of(context).size.width, 50),
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
                              padding: EdgeInsets.only(top: 40, bottom: 10),
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
                                  if (value!.contains('@') ||
                                      value.contains('\$') ||
                                      value.length < 3) {
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
                            Padding(
                              padding:
                                  EdgeInsets.only(top: padding, bottom: 10),
                              child: const Text(
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
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: padding, bottom: 10),
                              child: const Text(
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
                        padding: EdgeInsets.only(top: (padding + 25)),
                        child: AppButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              padding = 20.0;
                              setState(() {});
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                backgroundColor: AppColors.background,
                                content: Text(
                                  "Loading ...",
                                  style: TextStyle(color: AppColors.text),
                                ),
                              ));
                              User? user = await registerUsingEmailPassword(
                                  username: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text);
                              if (user != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigationScreen()),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  backgroundColor: AppColors.background,
                                  content: Text(
                                    "Error in processing, Try again!",
                                    style: TextStyle(color: AppColors.text),
                                  ),
                                ));
                              }
                            } else {
                              padding = 10.0;
                              setState(() {});
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                backgroundColor: AppColors.background,
                                content: Text(
                                  "Please check your data",
                                  style: TextStyle(color: AppColors.text),
                                ),
                              ));
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

  bool isEmail(String email) {
    String regularExpression =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(regularExpression);
    return regExp.hasMatch(email);
  }

  Future<User?> registerUsingEmailPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(username);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        passwordSide = const BorderSide();
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: AppColors.background,
          content: Text(
            "The password provided is too weak",
            style: TextStyle(color: AppColors.text),
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        emailSide = const BorderSide();
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: AppColors.background,
          content: Text(
            "The account is already exists for that email",
            style: TextStyle(color: AppColors.text),
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.background,
        content: Text(
          e.toString(),
          style: const TextStyle(color: AppColors.text),
        ),
      ));
    }
    return user;
  }
}
