import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/core/utils/helper.dart';
import 'package:e_commerce_app/data/datasources/product_data_source.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductsDataSourceImp implements ProductDataSource {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getProducts() async {
    try {
      final response = await Helper.sendRequest(
        RequestType.get,
        ApiString.products,
      );
      if (response.statusCode == 200) {
        final List<ProductModel> products = [];
        for (var product in response.data) {
          products.add(ProductModel.fromJson(product));
        }
        return Right({"products": products});
      } else {
        return Left(
          ServerFailure(
            response.data["message"] ??
                'Server error with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e'"));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchProductByCategory(
    String category,
  ) async {
    // TODO: implement fetchProductByCategory
    try {
      final response = await Helper.sendRequest(
        RequestType.get,
        '${ApiString.fetchbycategory}/$category',
      );
      if (response.statusCode == 200) {
        final List<ProductModel> products = [];
        final data = response.data;
        for (var product in data) {
          products.add(ProductModel.fromJson(product));
        }
        print("this is the category data $products");
        return Right({"products": products});
      } else {
        return left(
          ServerFailure(
            response.data["message"] ??
                'Server error with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e'"));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sortCategoryProductsByPrioce(
    String category,
    String type,
  ) async {
    // TODO: implement sortCategoryProductsByPrioce
    try {
      final response = await Helper.sendRequest(
        RequestType.get,
        "${ApiString.fetchbycategory}/$category?sort=$type",
      );
      if (response.statusCode == 200) {
        final List<ProductModel> products = [];
        for (var product in response.data) {
          products.add(ProductModel.fromJson(product));
        }
        print("this is the category data $products");
        return Right({"products": products});
      } else {
        return Left(
          ServerFailure(
            response.data["message"] ??
                'Server error with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e'"));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> sortProductsByprice(
    String type,
  ) async {
    try {
      final response = await Helper.sendRequest(
        RequestType.get,
        "${ApiString.products}?sort=$type",
      );
      if (response.statusCode == 200) {
        final List<ProductModel> products = [];
        for (var product in response.data) {
          products.add(ProductModel.fromJson(product));
        }
        print("this is the category data $products");
        return Right({"products": products});
      } else {
        return Left(
          ServerFailure(
            response.data["message"] ??
                'Server error with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e'"));
    }
  }
}
