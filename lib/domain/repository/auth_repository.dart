import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String userName, String password);
}
