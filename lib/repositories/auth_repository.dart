import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pintarshop_app/models/user/user_model.dart';
import 'package:pintarshop_app/repositories/main_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository extends MainRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  // Future<void> logIn({
  //   required String username,
  //   required String password,
  // }) async {
  //   await Future.delayed(
  //     const Duration(milliseconds: 300),
  //     () => _controller.add(AuthenticationStatus.authenticated),
  //   );
  // }

  Future<bool> logIn({required String email, required String password}) async {
    final Map<String, String> params = {'email': email, 'password': password};
    try {
      final res = await apiClient.postUserLogin(params);
      if (res.code == 0) {
        final UserModel userModel =
            UserModel.fromJson(res.data as Map<String, dynamic>);
        // debugPrint("Login auth repo");
        // debugPrint("token ${userModel.token}");
        pref.write(key: 'token', value: userModel.token);
        // pref.write(key: 'user', value: userModel.user.toString());
        pref.write(key: 'user_model', value: jsonEncode(userModel));
        _controller.add(AuthenticationStatus.authenticated);
        return true;
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future getItems() async {
    await apiClient.getItems(1, 10);
  }

  void logOut() {
    pref.delete(key: 'user_model');
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
}
