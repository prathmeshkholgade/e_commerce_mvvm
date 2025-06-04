import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/domain/repository/product_repository.dart';

class SortCategoryProductUsecase {
  final ProductRepository productRepository;
  SortCategoryProductUsecase({required this.productRepository});

  Future<Either<Failure, dynamic>> call({
    required String category,
    required String type,
  }) async {
    return await productRepository.sortProductsByCategoryprice(category, type);
  }
}
