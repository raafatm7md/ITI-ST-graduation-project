import 'package:bloc/bloc.dart';
import 'package:iti_graduation_project/models/product_model.dart';
import 'package:iti_graduation_project/services/product_service.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    getProducts();
  }
  List<Product> products = [];
  bool isLoading = true;

  void getProducts() async {
    emit(ProductsLoading());
    try {
      products = await ProductService().getProductsData();
      isLoading = false;
      emit(ProductsSuccess());
    } catch (e) {
      emit(ProductsError());
      print(e.toString());
    }
  }
}
