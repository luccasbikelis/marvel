import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFacade {
  ///
  /// Get a value saved by key. If a key not found  return default Value
  /// [key] field identifier
  /// [defaultValue] if a key was not found, will return defaultValue
  Future<dynamic> get(String key, {dynamic defaultValue}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.get(key) ?? defaultValue;
  }

  Future<String?> getString(String key, {dynamic defaultValue}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.getString(key) ?? defaultValue;
  }

  /// delete all values saved
  Future clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }

  /// delete value by key
  Future remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(key);
    await sp.reload();
  }

  /// Save generic value. Could be called to reassign
  /// [key] field identifier
  /// [value] data to be saved
  Future set(String key, dynamic value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await sp.setString(key, value);
        break;
      case bool:
        await sp.setBool(key, value);
        break;
      case int:
        await sp.setInt(key, value);
        break;
      case double:
        await sp.setDouble(key, value);
        break;
      default:
        await sp.setString(key, value.toString());
        break;
    }
  }
}
