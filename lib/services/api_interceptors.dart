import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiInterceptors extends Interceptor {
  BuildContext context;
  ApiInterceptors({required this.context});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("Dio Onrequest");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("Dio OnError");
    if (err.response != null) {
      switch (err.type) {
        case DioErrorType.cancel:
          err.error = "Koneksi cancel";
          developer.log("koneksi error 1");
          break;
        case DioErrorType.connectTimeout:
          err.error = "Koneksi connectTimeout";
          developer.log("koneksi error 2");
          break;
        case DioErrorType.sendTimeout:
          err.error = "Koneksi sendTimeout";
          developer.log("koneksi error 3");
          break;
        case DioErrorType.receiveTimeout:
          err.error = "Koneksi receiveTimeout";
          developer.log("koneksi error 4");
          break;
        case DioErrorType.response:
          err.error = "Koneksi response";
          developer.log("koneksi error 5");
          break;
        case DioErrorType.other:
          err.error = "Koneksi other";
          developer.log("koneksi error 6");
      }
    } else {
      handler.next(err);
    }
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    developer.log("Dio onresponse");
    super.onResponse(response, handler);
  }
}
