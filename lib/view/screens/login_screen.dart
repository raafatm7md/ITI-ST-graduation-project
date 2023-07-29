import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_graduation_project/view/screens/navigation_screen.dart';
import 'package:iti_graduation_project/view/screens/registration_screen.dart';
import '../../utilities/app_colors.dart';
import '../widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final lFormKey = GlobalKey<FormState>();
  final TextEditingController lEmailController = TextEditingController();
  final TextEditingController lPasswordController = TextEditingController();
  bool isPasswordHidden = true;
  BorderSide lEmailSide = BorderSide.none;
  BorderSide lPasswordSide = BorderSide.none;
  double lPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
      Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
        child: const Text(
          "LOG IN",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Text("Welcome Back!",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.text)),
      ),
      const Text("Enter password to get back your account!",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.text,
          )),
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
              foregroundColor: AppColors.text,
              backgroundColor: Colors.white,
              fixedSize: const Size(350, 50),
              maximumSize: Size(MediaQuery.of(context).size.width, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            )),
      ),
      Form(
          key: lFormKey,
          child: Column(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 10),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: lEmailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: lEmailSide, // set border side to none
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            )),
                        filled: true, // enable background fill
                        fillColor: AppColors
                            .background, // set the color of the background
                        // other properties
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        hintText: "Please enter your email",
                      ),
                      style: const TextStyle(color: AppColors.text),
                      validator: (value) {
                        if (!isEmail(value ?? "")) {
                          lEmailSide = const BorderSide();
                          return "The email is not valid, Try again";
                        }
                        lEmailSide = BorderSide.none;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: lPadding, bottom: 10),
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
                      controller: lPasswordController,
                      obscureText: isPasswordHidden,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  lPasswordSide, // set border side to none
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              )),
                          filled: true, // enable background fill
                          fillColor: AppColors
                              .background, // set the color of the background
                          // other properties
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          hintText: "Please enter your password",
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.visibility,
                            ),
                            onPressed: () {
                              isPasswordHidden = !isPasswordHidden;
                              setState(() {});
                            },
                          )),
                      validator: (value) {
                        if (value!.length < 6) {
                          lPasswordSide = const BorderSide();
                          return "The password is too short, Try again";
                        }
                        lPasswordSide = BorderSide.none;
                        return null;
                      },
                      style: const TextStyle(color: AppColors.text),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: (lPadding + 25)),
                    child: AppButton(
                        color: Colors.lightBlue,
                        text: 'login',
                        onPressed: () async {
                          if (lFormKey.currentState!.validate()) {
                            lPadding = 20.0;
                            setState(() {});
                            final scaffoldContext =
                                ScaffoldMessenger.of(context);
                            scaffoldContext.hideCurrentSnackBar();
                            scaffoldContext.showSnackBar(
                              const SnackBar(
                                backgroundColor: AppColors.background,
                                content: Text(
                                  "Loading ...",
                                  style: TextStyle(color: AppColors.text),
                                ),
                                duration: Duration(seconds: 8),
                              ),
                            );
                            bool loginOutput = await firebaseAuth(
                                lEmailController.text,
                                lPasswordController.text);
                            if (loginOutput == true) {
                              scaffoldContext.hideCurrentSnackBar();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NavigationScreen(),
                                ),
                              );
                            } else {
                              scaffoldContext.hideCurrentSnackBar();
                              scaffoldContext.showSnackBar(const SnackBar(
                                backgroundColor: AppColors.background,
                                content: Text("Login failed, Try again",
                                    style: TextStyle(color: AppColors.text)),
                              ));
                            }
                          } else {
                            lPadding = 10.0;
                            setState(() {});
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              backgroundColor: AppColors.background,
                              content: Text(
                                "Please check your data",
                                style: TextStyle(color: AppColors.text),
                              ),
                            ));
                          }
                        }),
                  ),
                ],
              ),
            ),
          ])),
      Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Do not have an account?",
                    style: TextStyle(fontSize: 15.0, color: AppColors.text)),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    child: const Text("Create New Account"),
                  ),
                ),
              ]),
        ),
      ),
    ])))));
  }

// Email validation.
  bool isEmail(String email) {
    String regularExpression =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(regularExpression);
    return regExp.hasMatch(email);
  }

  // Authenticate and manage users with firebase.
  Future<bool> firebaseAuth(String email, String password) async {
    bool output = false;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        output = true;
      }
      return output;
    } catch (e) {
      return output;
    }
  }
}
