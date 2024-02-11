import 'package:shared_preferences/shared_preferences.dart';

class CoreSession {
  // Obtain shared preferences.
  SharedPreferences? _prefs;

  write<T>(String key, T value) async {
    await initSession();

    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    }
  }

  Future<T?> read<T>(String key) async {
    await initSession();
    return _prefs?.get(key) as T?;
  }

  initSession() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}