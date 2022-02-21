import 'package:pintarshop_app/services/api_client.dart';
import 'package:pintarshop_app/utils/shared_preferences_actions.dart';

abstract class MainRepository {
  final apiClient = ApiClient();
  final pref = SharedPreferencesActions();
}
