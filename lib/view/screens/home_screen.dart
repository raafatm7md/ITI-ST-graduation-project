import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_graduation_project/view/product/products_cubit.dart';

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
        listener: (context, state) {
          // TODO: implement listener
          if (state is ProductsError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Oops!, YOU ENCOUNTERED AN ERROR"),
            ));
          }
        },
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsSuccess) {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: ListView.builder(
                  itemCount: context.watch<ProductsCubit>().products.length,
                  itemBuilder: (BuildContext context, int index) => Text(
                      context.watch<ProductsCubit>().products[index].name)),
            );
          } else {
            return const Center(
              child: Text(
                "OOH, SNAP",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
