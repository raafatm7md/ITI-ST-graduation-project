import 'package:flutter/material.dart';

import '../widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //عشان نخلي البيدج بعيده عن الحيطه 15 بيكسل
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Stack فيها شكل الستوري وصورة لبروفايل
              const CircleAvatar(
                radius: 65,
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th?id=OIP.1f4L8uI7SgYFrlQ1taL1YgHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
              ),
              const SizedBox(
                height: 20,
              ),
              //الاسم
              const Text(
                "first name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              //الاسم الفرعي
              const Text(
                "Sub name",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 27,
              ),
              PutTextFormField(10, "name & subname", "Name",
                  controllerResive: widget.name),
              const SizedBox(
                height: 27,
              ),
              PutTextFormField(2, "Email", "Email",
                  controllerResive: widget.email),
              const SizedBox(
                height: 27,
              ),
              PutTextFormField(10, "", "Phone Number",
                  controllerResive: widget.phoneNumber),
              const SizedBox(
                height: 50,
              ),
              //كونتينر الزرار
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    "Save change",
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
