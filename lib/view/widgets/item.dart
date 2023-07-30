import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class Item extends StatefulWidget {
  final String imageUrl;
  final String itemName;
  final String price;
  const Item({
    super.key,
    required this.imageUrl,
    required this.itemName,
    required this.price,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(30),
                        topEnd: Radius.circular(30))),
                child: Image(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.itemName,
                  size: 20,
                ),
                const SizedBox(height: 5),
                CustomText(
                  text: "Price: ${widget.price} \$ ",
                  size: 20,
                )
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
