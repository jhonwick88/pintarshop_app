import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesActions {
  Future<String> read({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<Map<String, String>> readAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> keys = prefs.getKeys().toList();
    final Map<String, String> all = {};

    for (final String key in keys) {
      final String? value = prefs.getString(key);

      if (value != null) {
        all[key] = value;
      }
    }

    return all;
  }

  /*
  * It saves the int value to the local memory.
  * */
  Future<int> getIntFromLocalMemory(String key) async {
    final pref = await SharedPreferences.getInstance();
    final number = pref.getInt(key) ?? 0;
    return number;
  }

  /*
  * It returns the saved the int value from the memory.
  * */
  Future<void> saveIntInLocalMemory(String key, int value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  Future<void> write({required String key, required String? value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value != null) {
      await prefs.setString(key, value);
    }
  }

  Future<void> delete({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
