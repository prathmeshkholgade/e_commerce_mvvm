import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:e_commerce_app/data/datasources/auth_data_source.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entities/user_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthDataSourceImp implements AuthDatasource {
  final baseUrl = dotenv.env["BaseUrl"];
  final Dio dio = Dio();
  @override
  Future<Either<Failure, String>> login({
    required String username,
    required String password,
  }) async {
    print("this is the url $baseUrl");
    try {
      final payload =
          UserModel(username: username, password: password).toJson();
      print("Sending payload: $payload");
      final response = await dio.post(
        "$baseUrl/auth/login",
        data: payload,
        options: Options(headers: {"Content-Type": "application/json"}),
      );
      print(response);
      final token = response.data["token"];
      return Right(token);
      // return response.token;
    } catch (e) {
      print(e);
      return Left(ServerFailure(e.toString()));
    }
  }
}
