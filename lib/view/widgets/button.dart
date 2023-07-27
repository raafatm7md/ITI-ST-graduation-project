import 'package:flutter/material.dart';
class PutTextFormField extends StatefulWidget {
  //هنا عرفت الباراميترس دي كمتغيرات عشان لما تيجي
String hintText;
String title;
double weeight;
TextEditingController ControllerResive=TextEditingController();
//هنا بقوله عند استدعاء الداله دي لازم تجيب الحاجه اللي بعد زيس
  //وبعد متيجي تتخزن في المتغير اللي فوق وبعد كده تروح في الداله من تحت
  //اللي محطوطه جوا الاربع اقواس ومكتوب عليها ريقيور فدي لازم باراميتر لازم نجيبه عشان نشغل الداله
  //لاكن اللي بره القوسين ومش مكتوب عليهم فدول اوبشن يعني ممكن احطها وممكن اخلي الداله تشتغل منغير ما اخدهم عادي بس دول اللي مش ريقيور بيتكتبو بالترتيب
PutTextFormField(this.weeight,this.title,this.hintText,{super.key,required this.ControllerResive});
  @override
  State<PutTextFormField> createState() => _PutTextFormFieldState();
}

class _PutTextFormFieldState extends State<PutTextFormField> {
  @override
  Widget build(BuildContext context) {
    return
    //كولمن لترصيص الحاجه فوق بعض
      Column(
        children: [
         // كولمن عشان احرك الكلمه اللي بعديه
          Container(alignment: AlignmentDirectional.topStart,
           //كلمه فوق التيكست
            child: Text( textAlign:TextAlign.start, widget.title,style: TextStyle(fontSize: 22,color: Colors.grey[500],fontWeight: FontWeight.w700))),
           //هنا انا حطيت المسافه اللي قبل الزرار باراميتر بردو عشان احطها وقت ما احب وانا بطلب الداله
          SizedBox(height: widget.weeight),
          //عمل تيكست فورم فيلد بس وراه الكونتينر ده عشان عشان خلفية الكلام يكون لونه رصاصي
          Container(height:70,decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(30)),
          //بعدت الكلام اللي جوا بمقدار 15
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Center(
              child: TextFormField(
                //الكونترولر ده هو الناتج اللي بيجي من تيكست فورم فيلد , فخليته زي مجهول بردو باراميتر هيجي وقت ما اجي استدعي الكلاس ده كله كداله وقت تنفيذه في بيدج تانيه
                controller: widget.ControllerResive,
                //اللي بعد الهينت تيكست دي بقوله انها بارا ميتر هحطه وقت استدعاء الداله
                decoration: InputDecoration(hintText:widget.hintText,hintStyle: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.w500),border: InputBorder.none,),

              ),
            ),
          ),
    ),
        ],
      );
  }
}
