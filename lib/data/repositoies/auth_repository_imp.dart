import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/datasources/auth_data_source.dart';
import 'package:e_commerce_app/data/datasources_imp/auth_data_source_imp.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entities/user_entity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDatasource authDatasource;
  AuthRepositoryImp({required this.authDatasource});
  @override
  Future<Either<Failure, String>> login(String userName, String password) {
    return authDatasource.login(username: userName, password: password);
  }
}
