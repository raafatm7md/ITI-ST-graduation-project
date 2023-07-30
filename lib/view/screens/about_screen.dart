import 'package:flutter/material.dart';

import 'about_application.dart';
import 'developers_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.blueGrey,
              ),
              const SizedBox(
                height: 15,
              ),
              //   Container(height: 1,width: double.infinity,color: Colors.blueGrey,),
              const SizedBox(
                height: 7.5,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DevelopersScreen()),
                  );
                },
                splashColor: Colors.blueGrey,
                child: const Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Developers",
                      style: TextStyle(fontSize: 30),
                    )),
                    Icon(
                      Icons.chevron_right,
                      size: 41,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 7.5,
              ),
              // Container(height: 1,width: double.infinity,color: Colors.blueGrey,),
              const SizedBox(
                height: 7.5,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutApplication()),
                  );
                },
                splashColor: Colors.blueGrey,
                child: const Row(
                  children: [
                    Expanded(
                        child: Text(
                      "About 'FOOTSTEPS'",
                      style: TextStyle(fontSize: 30),
                    )),
                    Icon(
                      Icons.chevron_right,
                      size: 41,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 7.5,
              ),
              //Container(height: 1,width: double.infinity,color: Colors.blueGrey,),
            ],
          ),
        ),
      ),
    );
  }
}
