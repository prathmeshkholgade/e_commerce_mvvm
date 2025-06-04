import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/domain/usecase/product/fetch_productby_category_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/get_products_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/sort_category_product_usecase.dart';
import 'package:e_commerce_app/domain/usecase/product/sort_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final GetProductsUsecase getProductsUsecase;
  final FetchProductbyCategoryUsecase fetchProductbyCategoryUsecase;
  final SortCategoryProductUsecase sortCategoryProductUsecase;
  final SortProductsUsecase sortProductsUsecase;
  ProductsController({
    required this.sortCategoryProductUsecase,
    required this.sortProductsUsecase,
    required this.getProductsUsecase,
    required this.fetchProductbyCategoryUsecase,
  });
  var isLoading = true.obs;
  final errorMessage = ''.obs;
  final products = <ProductModel>[].obs;
  final categoryProducts = <ProductModel>[].obs;
  Future<List<ProductModel>> getProducts() async {
    try {
      isLoading.value = true;
      // getProductsByCategoryies("electronics");
      final response = await getProductsUsecase.call();
      response.fold(
        (e) {
          print(e);
          errorMessage.value = e.toString();
        },
        (value) {
          products.value = value["products"];
        },
      );
    } catch (e) {
      errorMessage.value = 'Unexpected error: $e';
    } finally {
      isLoading.value = false;
    }
    return products;
  }

  Future<void> getProductsByCategoryies(String category) async {
    try {
      isLoading.value = true;
      categoryProducts.clear();
      final response = await fetchProductbyCategoryUsecase.call(category);
      response.fold(
        (e) {
          print(e);
        },
        (value) {
          categoryProducts.value = value["products"];
        },
      );
      print(response);
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sortProductsByPrice(String type) async {
    try {
      isLoading.value = true;
      final response = await sortProductsUsecase(type: type);
      response.fold(
        (e) {
          print(e);
        },
        (value) {
          products.value = value["products"];
          isLoading.value = false;
        },
      );
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sortProductsCategoryByPrice(String category, String type) async {
    try {
      isLoading.value = true;
      final response = await sortCategoryProductUsecase(
        type: type,
        category: category,
      );
      response.fold(
        (e) {
          print(e);
        },
        (value) {
          products.value = value["products"];
          isLoading.value = false;
        },
      );
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
