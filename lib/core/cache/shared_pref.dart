import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  // Initialize Shared Preferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Generic save function
  static Future<bool> saveData<T>(String key, T value) async {
    if (value is String) {
      return await _preferences?.setString(key, value) ?? false;
    } else if (value is int) {
      return await _preferences?.setInt(key, value) ?? false;
    } else if (value is bool) {
      return await _preferences?.setBool(key, value) ?? false;
    } else if (value is double) {
      return await _preferences?.setDouble(key, value) ?? false;
    } else {
      throw Exception("Unsupported type");
    }
  }

  // Generic get function
  static T? getData<T>(String key) {
    if (T == String) {
      return _preferences?.getString(key) as T?;
    } else if (T == int) {
      return _preferences?.getInt(key) as T?;
    } else if (T == bool) {
      return _preferences?.getBool(key) as T?;
    } else if (T == double) {
      return _preferences?.getDouble(key) as T?;
    } else {
      throw Exception("Unsupported type");
    }
  }

  // Remove value
  static Future<bool> remove(String key) async {
    return await _preferences?.remove(key) ?? false;
  }

  // Clear all values
  static Future<bool> clear() async {
    return await _preferences?.clear() ?? false;
  }
}
