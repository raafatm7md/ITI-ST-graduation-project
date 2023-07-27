import 'package:flutter/material.dart';

class DevelopersScreen extends StatelessWidget {
  const DevelopersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Developers")),
      body:  Container(width: double.infinity,color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [ SizedBox(height: 20),
                Text("Great companies made",style: TextStyle(color: Colors.black,fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600),)
                ,Text(" by great people",style: TextStyle(color: Colors.black,fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600),)
                ,SizedBox(height: 40,)

                ,Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DevelopersTemplete(firstName: "Ahmed", SecondName:"Diaa Al-Shahat" , Png:"assets/ScreenshotAhmed.png",calar: Colors.indigo, ),
                    SizedBox(width: 40,),
                    DevelopersTemplete(firstName: "Osama", SecondName:"Mohammed Abd-El Halem" , Png:"assets/ScreenshotOsama.png" ,calar: Colors.green,),
                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    DevelopersTemplete(firstName: "Raafat", SecondName:"Mohamed Abd-Elnaem" , Png:"assets/ScreenshotRaa.jpg",calar: Colors.yellowAccent, ),
                    SizedBox(width: 50,),
                    DevelopersTemplete(firstName: "Youssef", SecondName:"Mohammed Eid" , Png:"assets/ScreenshotYoussef.jpg" ,calar: Colors.blueAccent,),
                  ],
                ),
                SizedBox(height: 50,),
                DevelopersTemplete(firstName: "Ziad", SecondName:"Mohammed Abdelaziz" , Png:"assets/ScreenshotZiad.png" ,calar: Colors.blueGrey,),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

class DevelopersTemplete extends StatefulWidget {
  DevelopersTemplete({super.key,required this.firstName,required this.SecondName,required this.Png,required this.calar});
  String firstName;
  String SecondName;
  String Png;
  Color calar;
  @override
  State<DevelopersTemplete> createState() => _DevelopersTempleteState();
}

class _DevelopersTempleteState extends State<DevelopersTemplete> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Stack(alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              backgroundColor:widget.calar,radius: 70,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(125.0),
              child: Image.asset(
                widget.Png,
                width: 128.0,
                height: 128.0,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        Text(widget.firstName,style: TextStyle(color: Colors.black,fontSize: 21.5),),
        Text(widget.SecondName,style: TextStyle(color: Colors.grey,fontSize: 16.5),),
        Text("Flutter developer",style: TextStyle(color: Colors.blue,fontSize: 18.5),)
      ],
    );
  }
}

