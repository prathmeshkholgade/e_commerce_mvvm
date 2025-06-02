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
}
