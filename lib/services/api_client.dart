import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pintarshop_app/models/base_model.dart';
import 'package:pintarshop_app/services/api_interceptors.dart';
import 'package:pintarshop_app/services/api_log_interceptor.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:8000/api/v1")
abstract class ApiClient {
  factory ApiClient() {
    final Dio dio = Dio()
      ..options = BaseOptions(
          contentType: "application/json",
          receiveTimeout: 5000,
          connectTimeout: 5000)
      ..interceptors.add(ApiInterceptors())
      ..interceptors.add(ApiLogInterceptor());
    return _ApiClient(dio);
  }

  @POST("/auth/login")
  Future<BaseModel> postUserLogin(
      @Query("email") String email, @Query("password") String password);

  @POST("/auth/logout")
  Future<BaseModel> postUserLogout();

  @POST("/auth/register")
  Future<BaseModel> postUserRegister(@Queries() Map<String, dynamic> queries);

  @GET("/items")
  Future<BaseModel> getItems(
      @Query("page") int page, @Query("limit") int limit);
}