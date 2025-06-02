import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entities/user_entity.dart';
import 'package:e_commerce_app/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;
  LoginUsecase({required this.authRepository});
  Future<Either<Failure, String>> call({
    required String userName,
    required String password,
  }) {
    return authRepository.login(userName, password);
  }
}
