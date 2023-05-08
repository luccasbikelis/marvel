import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesFacade {
 
  Future<dynamic> get(String key, {dynamic defaultValue}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.get(key) ?? defaultValue;
  }

  Future<String?> getString(String key, {dynamic defaultValue}) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.getString(key) ?? defaultValue;
  }

  
  Future clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  }

  
  Future remove(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove(key);
    await sp.reload();
  }

 
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
