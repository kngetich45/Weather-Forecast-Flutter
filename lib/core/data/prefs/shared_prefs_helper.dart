import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/di/di.dart';

const String languageKey = 'lang_support_key';
const String firstTimeKey = 'first_time_key';

abstract class SharedHelper {
  Future<SharedPreferences> getInstance();
  Future<bool> saveString(String key, String value);
  Future<bool> saveBool(String key, bool value);
  Future<String?> getString(String key);
  Future<bool> clearStorage();

  Future clearKey(String key);
}

class SharedHelperImpl extends SharedHelper {
  final SharedPreferences sharedPreferences;

  SharedHelperImpl({required this.sharedPreferences});

  @override
  Future<SharedPreferences> getInstance() async {
    await inject.allReady();
    return inject.get<SharedPreferences>();
  }

  @override
  Future<bool> saveString(String key, String value) async {
    return sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> saveBool(String key, bool value) async {
    return sharedPreferences.setBool(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> clearStorage() async {
    return await sharedPreferences.clear();
  }

  @override
  Future clearKey(String key) async => (sharedPreferences).remove(key);
}
