import 'dart:convert';

import 'package:pintarshop_app/models/user/user_model.dart';
import 'package:pintarshop_app/utils/shared_preferences_actions.dart';

class UserRepository {
  var pref = SharedPreferencesActions();
  UserModel? _userModel;
  //UserTes? _user;

  // Future<UserTes?> getUser() async {
  //   if (_user != null) return _user;
  //   return Future.delayed(
  //     const Duration(milliseconds: 300),
  //     () => _user = UserTes(const Uuid().v4()),
  //   );
  // }

  Future<UserModel?> getUserModel() async {
    if (_userModel != null) return _userModel;

    final String userPref = await pref.read(key: 'user_model');
    final Map<String, dynamic> userMap =
        jsonDecode(userPref) as Map<String, dynamic>;
    return UserModel.fromJson(userMap);
    // return await pref.read(key: 'user_model');
    // return Future.delayed(
    //     const Duration(milliseconds: 300),
    //     () => _userModel = const UserModel(
    //         user: User(id: 1, username: "Paijo"), token: "yes token"));
    // return await pref.read(key: "userModel"); // change string to json object??
  }
}
