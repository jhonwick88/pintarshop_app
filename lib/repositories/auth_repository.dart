import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pintarshop_app/models/user/user_model.dart';
import 'package:pintarshop_app/repositories/main_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository extends MainRepository {
  //final client = ApiClient();
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({required String email, required String password}) async {
    try {
      final res = await apiClient.postUserLogin(email, password);
      if (res.code == 0) {
        final UserModel userModel =
            UserModel.fromJson(res.data as Map<String, dynamic>);
        debugPrint("Login auth repo");
        debugPrint("token ${userModel.token}");
        _controller.add(AuthenticationStatus.authenticated);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
      }
    } catch (e) {
      rethrow;
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
}
