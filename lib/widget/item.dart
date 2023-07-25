import 'package:flutter/cupertino.dart';

import 'customText.dart';

class Item extends StatefulWidget {
  String imageUrl;
  String itemName;
  String price;
  Item({super.key,required this .imageUrl,required this.itemName,required this.price});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          Container(

            child:
            Image(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.cover,
              width: 120,
              height: 120,),

          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              CustomText(text: widget.itemName,size: 20,),
              SizedBox(height: 5),
              CustomText(text: "price: ${widget.price} \$ ",size: 20,)



            ],
          ),

        ],
      ),
    );
  }
}