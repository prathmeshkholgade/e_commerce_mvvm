import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/domain/repository/product_repository.dart';

class FetchProductbyCategoryUsecase {
  final ProductRepository productRepository;
  FetchProductbyCategoryUsecase({required this.productRepository});
  Future<Either<Failure, Map<String, dynamic>>> call(String category) async {
    return await productRepository.fetchProductByCategory(category);
  }
}
