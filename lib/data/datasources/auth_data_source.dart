import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/models/user_model.dart';


abstract class AuthDatasource {
  Future<Either<Failure, String>> login({
    required String username,
    required String password,
  });
}
