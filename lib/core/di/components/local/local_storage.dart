import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<String?> get(String key);
  void set(String key, dynamic value);
  void remove(String key);
}

class SharePreferencesImpl implements LocalStorage {
  late SharedPreferences? _prefs;

  Future<dynamic> _getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  @override
  Future<String?> get(String key) async {
    await _getInstance();
    return _prefs?.getString(key);
  }

  @override
  void set(String key, dynamic value) async {
    await _getInstance();
    _prefs?.setString(key, value);
  }

  @override
  void remove(String key) async {
    await _getInstance();
    _prefs?.remove(key);
  }
}
