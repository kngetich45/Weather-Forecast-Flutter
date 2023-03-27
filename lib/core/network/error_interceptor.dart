
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fimber/fimber.dart';
 

import '../data/errors_model.dart';

class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor(
    this.dio,
  );

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    Fimber.e('Errors from dio : $err');
    switch (err.type) {
      case DioErrorType.cancel:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
        err.error =
            'An error occurred while attempting to connect to our servers';
        break;
      case DioErrorType.response:
        if (err.response?.data != null) {
          if (err.response?.data is String) {
            err.error =
                'Looks like something went wrong while processing your request! Kindly try later';
          } else {
            try {
              // errors object is available
              ErrorsModel errorObj = ErrorsModel.fromJson(err.response?.data);

              // ignore: prefer-conditional-expressions
              if (errorObj.errors != null) {
                err.error = '${errorObj.errors!.first.message}'.tr();
              } else {
                //top level message key
                err.error = err.response?.data['message'];
              }
            } catch (e) {
              Fimber.e('Errorrrr : $e');
            }
          }

          if (err.response?.statusCode == 404 && err.response!.data is String) {
            err.error = '${err.response?.statusCode} Page not found.';
          }
          if (err.response?.statusCode == 500) {
            err.error = 'Internal server error.';
          }
          if (err.response?.statusCode == 403 ||
              err.response?.statusCode == 401) {
            // return await _requestNewToken(err);
            var error =
                err.response!.data['message'] ?? err.response!.data['error'];
            err.error = error;
          }
          if ((err.response?.statusCode ?? 501) >= 501) {
            err.error = 'Bad GetWay Error';
          }
        } else {
          err.error =
              'Looks like something went wrong while processing your request! Kindly try again';
        }
        break;
      default:
        err.error =
            'Looks like something went wrong while processing your request! Kindly try again';
    }

    return super.onError(err, handler);
  }

}