import 'package:flutter_core/utils/aes_encryption_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreSession {
  // Obtain shared preferences.
  SharedPreferences? _prefs;

  write<T>(String key, T value) async {
    await initSession();

    if (value is String) {
      final _value = AESEncryptionHelper.encrypt(value);
      await _prefs?.setString(key, _value);
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
    final value = _prefs?.get(key) as T?;
    if (value is String) {
      return AESEncryptionHelper.decrypt(value) as T;
    } else {
      return value;
    }
  }

  clear() async {
    await initSession();
    await _prefs?.clear();
  }

  initSession() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}