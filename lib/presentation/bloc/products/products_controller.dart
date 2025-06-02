import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/domain/usecase/product/get_products_usecase.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final GetProductsUsecase getProductsUsecase;
  ProductsController({required this.getProductsUsecase});
  var isLoading = true.obs;
  final errorMessage = ''.obs;
  final products = <ProductModel>[].obs;

  Future<List<ProductModel>> getProducts() async {
    try {
      isLoading.value = true;
      final response = await getProductsUsecase.call();
      response.fold(
        (e) {
          print(e);
          errorMessage.value = e.toString();
        },
        (value) {
        
          products.value = value["products"];
  print("the product state obx  in getxcontroller $value");
        },
      );
    } catch (e) {
      errorMessage.value = 'Unexpected error: $e';
    } finally {
      isLoading.value = false;
    }
    return products;
  }
}
