import 'package:flutter/material.dart';

class DevelopersScreen extends StatelessWidget {
  const DevelopersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Developers")),
      body: Container(
        width: double.infinity,
        color: Colors.grey[100],
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "Great companies made",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  " by great people",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DevelopersTemplete(
                      firstName: "Ahmed",
                      secondName: "Diaa Al-Shahat",
                      png: "assets/ScreenshotAhmed.png",
                      calar: Colors.indigo,
                    ),
                    SizedBox(width: 40),
                    DevelopersTemplete(
                      firstName: "Osama",
                      secondName: "Mohammed Abd-El Halem",
                      png: "assets/ScreenshotOsama.png",
                      calar: Colors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  children: [
                    DevelopersTemplete(
                      firstName: "Raafat",
                      secondName: "Mohamed Abd-Elnaem",
                      png: "assets/ScreenshotRaa.jpg",
                      calar: Colors.yellowAccent,
                    ),
                    SizedBox(width: 50),
                    DevelopersTemplete(
                      firstName: "Youssef",
                      secondName: "Mohammed Eid",
                      png: "assets/ScreenshotYoussef.jpg",
                      calar: Colors.blueAccent,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                DevelopersTemplete(
                  firstName: "Ziad",
                  secondName: "Mohammed Abdelaziz",
                  png: "assets/ScreenshotZiad.png",
                  calar: Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DevelopersTemplete extends StatefulWidget {
  final String firstName;
  final String secondName;
  final String png;
  final Color calar;

  const DevelopersTemplete({
    super.key,
    required this.firstName,
    required this.secondName,
    required this.png,
    required this.calar,
  });
  @override
  State<DevelopersTemplete> createState() => _DevelopersTempleteState();
}

class _DevelopersTempleteState extends State<DevelopersTemplete> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              backgroundColor: widget.calar,
              radius: 70,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(125.0),
              child: Image.asset(
                widget.png,
                width: 128.0,
                height: 128.0,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Text(
          widget.firstName,
          style: const TextStyle(color: Colors.black, fontSize: 21.5),
        ),
        Text(
          widget.secondName,
          style: const TextStyle(color: Colors.grey, fontSize: 16.5),
        ),
        const Text(
          "Flutter developer",
          style: TextStyle(color: Colors.blue, fontSize: 18.5),
        )
      ],
    );
  }
}
