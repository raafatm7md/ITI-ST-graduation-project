import 'package:flutter/material.dart';
import 'package:iti_graduation_project/view/widgets/header_text.dart';
import '../../utilities/app_colors.dart';

class ProductScreen extends StatefulWidget {
  final String productName;
  final String productImg;
  final String productPrice;
  final String productCategory;
  final bool productAvailability;
  const ProductScreen({
    Key? key,
    required this.productName,
    required this.productImg,
    required this.productPrice,
    required this.productCategory,
    required this.productAvailability,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Lable(
          text: "DETAIL",
          size: 25,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(widget.productImg)),
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 20, top: 20, end: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.productName,
                    style: const TextStyle(fontSize: 32, color: AppColors.text),
                  ),
                  widget.productCategory == 'men' ||
                          widget.productCategory == 'man'
                      ? const Icon(
                          Icons.man_2_outlined,
                          size: 50,
                          color: AppColors.text,
                        )
                      : widget.productCategory == 'woman' ||
                              widget.productCategory == 'women'
                          ? const Icon(
                              Icons.woman_2_outlined,
                              size: 50,
                              color: AppColors.text,
                            )
                          : widget.productCategory == 'volly' ||
                                  widget.productCategory == 'Volly'
                              ? const Icon(
                                  Icons.sports_baseball_outlined,
                                  size: 50,
                                  color: AppColors.text,
                                )
                              : widget.productCategory == 'football' ||
                                      widget.productCategory == 'Football'
                                  ? const Icon(
                                      Icons.woman_2_outlined,
                                      size: 50,
                                      color: AppColors.text,
                                    )
                                  : Text(widget.productCategory),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Text(
                '${widget.productPrice} \$',
                style: const TextStyle(
                    fontSize: 24,
                    color: AppColors.text,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: const EdgeInsetsDirectional.only(start: 20, top: 50),
                child: widget.productAvailability
                    ? const Text(
                        "Available",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.text,
                        ),
                      )
                    : const Text("Not Available",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.text,
                        )))
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          height: 140,
          width: 110,
          child: FloatingActionButton.large(
            onPressed: () {},
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add_shopping_cart_outlined),
                const SizedBox(height: 15),
                Text(
                  '${widget.productPrice} \$',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
