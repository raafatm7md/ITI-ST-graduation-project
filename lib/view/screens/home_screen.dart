import 'package:flutter/material.dart';
import 'package:iti_graduation_project/models/product_model.dart';
import 'package:iti_graduation_project/utilities/app_colors.dart';
import 'package:iti_graduation_project/view/product/products_cubit.dart';
import 'package:iti_graduation_project/view/widgets/custom_button.dart';
import 'package:iti_graduation_project/view/widgets/header_text.dart';
import 'package:iti_graduation_project/widget/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final List<Product> products =
              context.watch<ProductsCubit>().products;
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          CustomText(
                            text: "Enjoy New",
                            size: 40,
                          ),
                          Lable(
                            text: "Products",
                            size: 40,
                          ),
                        ],
                      ),
                      Container(
                        height: 75,
                        width: 85,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(30),
                              bottomStart: Radius.circular(30),
                            ),
                            color: AppColors.warning),
                        child: const Center(
                          child: Icon(Icons.add_business_outlined,
                              color: AppColors.background),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomButton(
                            text: "Men",
                            onPressed: () {},
                            icon: Icons.man_2_outlined),
                        CustomButton(
                            text: "Women",
                            onPressed: () {},
                            icon: Icons.woman_2_outlined),
                        CustomButton(
                            text: "Men",
                            onPressed: () {},
                            icon: Icons.sports_baseball_outlined),
                        CustomButton(
                            text: "Women",
                            onPressed: () {},
                            icon: Icons.sports_soccer_outlined),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Item(
                    imageUrl: products[index].imageUrl,
                    itemName: products[index].name,
                    price: products[index].price.toString(),
                  );
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}
