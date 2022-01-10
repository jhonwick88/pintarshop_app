import 'dart:async';
import 'package:pintarshop_app/models/user/user_model.dart';
import 'package:pintarshop_app/repositories/main_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository extends MainRepository {
  //final client = ApiClient();
  final _controller = StreamController<UserModel>();

  Future<void> logIn({required String email, required String password}) async {
    try {
      final res = await apiClient.postUserLogin(email, password);
      //if (res.code == 0) {
      final UserModel userModel =
          UserModel.fromJson(res.data as Map<String, dynamic>);
      _controller.add(userModel);
      //}
    } catch (e) {
      rethrow;
    }
  }

  void dispose() {
    _controller.close();
  }
}
