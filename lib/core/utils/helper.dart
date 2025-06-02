import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/core/utils/exception.dart';
import 'package:flutter/material.dart';

enum RequestType { get, post, put }

class Helper {
  static Future<Response> sendRequest(
    RequestType type,
    String endPoint, {
    Map<String, dynamic>? data,
  }) async {
    final dio = Dio();
    dio.options.headers["Content-Type"] = "application/json";
    try {
      Response response;
      switch (type) {
        case RequestType.get:
          response = await dio.get('${ApiString.baseUrl}$endPoint');
          break;
        case RequestType.post:
          response = await dio.post(
            '${ApiString.baseUrl}$endPoint',
            data: data,
          );
          break;
        case RequestType.put:
          response = await dio.put('${ApiString.baseUrl}$endPoint', data: data);
          break;
        default:
          throw ServerFailure("Unsupported HTTP method type : $type");
      }
      return response;
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw ServerFailure('Unexpected error: $e');
    }
  }
}
