import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/core/di/di.dart';

class ApiProvider {
  Dio dio;

  ApiProvider({required this.dio});

  Future<dynamic> post(Map payload, String url) async {
    try {
      final response = await dio.post(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      // print("DIO ERROR ${e.message}");
      throw e.message;
    }
  }

  Future<dynamic> delete(Map payload, String url) async {
    try {
      final response = await dio.delete(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> put(Map payload, String url) async {
    try {
      final response = await dio.put(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await inject.get<Dio>().get(url, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> patch(Map payload, String url) async {
    try {
      final response = await dio.patch(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
