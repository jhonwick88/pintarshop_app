import 'package:pintarshop_app/models/user/user_model.dart';
import 'package:pintarshop_app/utils/shared_preferences_actions.dart';

class UserRepository {
  var pref = SharedPreferencesActions();
  UserModel? _userModel;

  Future<Object?> getUserModel() async {
    if (_userModel != null) return _userModel;
    return Future.delayed(
        const Duration(milliseconds: 300),
        () => _userModel =
            const UserModel(user: User(id: 1, username: "Paijo"), token: ""));
    // return await pref.read(key: "userModel"); // change string to json object??
  }
}
