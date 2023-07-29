import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/screens/welcome_screen.dart';
import '../../utilities/google_signin.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //عشان نخلي البيدج بعيده عن الحيطه 15 بيكسل
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Stack فيها شكل الستوري وصورة لبروفايل
              CircleAvatar(
                radius: 65,
                backgroundImage: NetworkImage(user?.photoURL != null
                    ? user!.photoURL as String
                    : "https://th.bing.com/th?id=OIP.1f4L8uI7SgYFrlQ1taL1YgHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
              ),
              const SizedBox(height: 20),
              //الاسم
              Text(
                user!.displayName.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text),
              ),
              const SizedBox(height: 27),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: const Text(
                  "Email",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: AppColors.background,
                  width: MediaQuery.of(context).size.width - 50,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                  child: Text(
                    user!.email as String,
                    style: const TextStyle(
                      fontSize: 19,
                      color: AppColors.text,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
              user?.emailVerified == false
                  ? Column(
                    children: [
                      const Text("Your email is not verified",
                        style: TextStyle(color: AppColors.text, fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () {
                            user?.sendEmailVerification();
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              backgroundColor: AppColors.background,
                              content: Text(
                                "Verification email sent",
                                style: TextStyle(color: AppColors.text),
                              ),
                            ));
                            },
                          child: const Text("send verification email",
                              style: TextStyle(fontSize: 16)),),
                      const SizedBox(height: 20,)
                    ],
                  )
                  : const SizedBox(),
              TextButton(
                  onPressed: () async {
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
                  child: const Text("Sign Out",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
