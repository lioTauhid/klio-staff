import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<SharedPreferences> getSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveValue(String key, String value) async {
    await getSharedPref().then((instance) {
      instance.setString(key, value);
    });
  }

  Future<String?> getValue(String key) async {
    String? val = '';
    await getSharedPref().then((instance) {
      val = instance.getString(key);
    });
    return val;
  }
}
