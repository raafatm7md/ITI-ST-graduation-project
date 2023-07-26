import 'package:flutter/material.dart';
import 'package:iti_graduation_project/view/screens/navigation_screen.dart';
import 'package:iti_graduation_project/view/screens/registration_screen.dart';
import '../widgets/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                const Text("welcome Back!",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                const Text("Enter password to get back your account!",
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon:
                          Image.asset('assets/Google__G__Logo.png', height: 25),
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
                const Text("Email",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide.none, // set border side to none
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          )),
                      filled: true, // enable background fill
                      fillColor:
                          Colors.grey[250], // set the color of the background
                      // other properties
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      hintText: "Please enter your email",
                    ),
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: (value) {
                      if (!isEmail(value ?? "")) {
                        return "The email is not valid, Try again";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Password",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFormField(
                    obscureText: isPasswordHidden,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide.none, // set border side to none
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            )),
                        filled: true, // enable background fill
                        fillColor:
                            Colors.grey[250], // set the color of the background
                        // other properties
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
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
                        return "The password is short, Try again";
                      }
                      return null;
                    },
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: AppButton(
                    color: Colors.lightBlue,
                    text: 'login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NavigationScreen()));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Expanded(
                    child: Text("Does not have an account?",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationScreen()));
                      },
                      child: const Text("Create New Account"),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

bool isEmail(String email) {
  String regularExpression =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(regularExpression);
  return regExp.hasMatch(email);
}
