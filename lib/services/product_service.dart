import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iti_graduation_project/models/product_model.dart';

class ProductService {
  Future<List<Product>> getProductsData() async {
    List<Product> products = [];
    final querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();
    products =
        querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
    return products;
  }
}
