import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, Map<String, dynamic>>> getProducts();
  Future<Either<Failure, Map<String, dynamic>>> fetchProductByCategory(
    String category,
  );
  Future<Either<Failure, Map<String, dynamic>>> sortProductsByprice(
    String type,
  );
  Future<Either<Failure, Map<String, dynamic>>> sortProductsByCategoryprice(
    String category,
    String type,
  );
  // Future<Either<Failure, ProductModel>> getProductsInDetails();
}
