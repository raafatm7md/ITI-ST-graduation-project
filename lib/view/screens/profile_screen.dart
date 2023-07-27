import 'package:flutter/material.dart';

import '../widgets/button.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
        //عشان نخلي البيدج بعيده عن الحيطه 15 بيكسل
        child: Padding(
          padding: const EdgeInsets.only(left:15,right: 15,top: 15),

          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Stack فيها شكل الستوري وصورة لبروفايل
                CircleAvatar(radius: 65,
                  backgroundImage: NetworkImage("https://th.bing.com/th?id=OIP.1f4L8uI7SgYFrlQ1taL1YgHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
                ),
                SizedBox(height: 20,),
                //الاسم
                Text("first name",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                //الاسم الفرعي
                Text("Sub name",style: TextStyle(fontSize: 22,color: Colors.blueGrey,fontWeight: FontWeight.w400),),
                SizedBox(height: 27,),
                PutTextFormField(10,"name & subname", "Name",ControllerResive:widget.name) ,
                SizedBox(height: 27,),
                PutTextFormField(2,"Email","Email",ControllerResive: widget.email),
                SizedBox(height: 27,),
                PutTextFormField(10,"", "Phone Number",ControllerResive:widget.phoneNumber),
                SizedBox(height: 50,),
                //كونتينر الزرار
                Container(height:60,width: double.infinity,decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: (){print(widget.name);print(widget.email);print(widget.phoneNumber);},child: Text("Save change",style: TextStyle(color: Colors.white,fontSize: 26),),),
                )


              ],
            ),
          ),
        ),

    );
  }
}