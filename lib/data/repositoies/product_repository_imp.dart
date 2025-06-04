import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/datasources/product_data_source.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/domain/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductDataSource productDataSource;
  ProductRepositoryImp({required this.productDataSource});
  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() async {
    // TODO: implement getProducts
    return await productDataSource.getProducts();
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchProductByCategory(
    String category,
  ) async {
    return await productDataSource.fetchProductByCategory(category);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sortProductsByCategoryprice(
    String category,
    String type,
  ) {
    // TODO: implement sortProductsByCategoryprice
    return productDataSource.sortCategoryProductsByPrioce(category, type);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sortProductsByprice(
    String type,
  ) {
    // TODO: implement sortProductsByprice
    return productDataSource.sortProductsByprice(type);
  }
}
