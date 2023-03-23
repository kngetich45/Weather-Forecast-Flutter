import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app/modules/core/network/endpoints.dart';

import 'package:weather_app/modules/core/network/interceptors.dart';

class DioClient {
  DioClient();
  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: Url.baseUrl!,
      connectTimeout: 50000,
      receiveTimeout: 30000,
      followRedirects: false,
      contentType: 'application/json; charset=UTF-8',
      // validateStatus: (status) {
      //   return status! < 401;
      // },
    );
    Dio dio = Dio(options);

    dio.interceptors.add(
      ErrorInterceptor(
        dio,
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }
}
