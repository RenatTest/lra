import 'package:shared_preferences/shared_preferences.dart';

part 'prefs_storage_keys.dart';

class PrefsStorage {
  PrefsStorage._();

  static final PrefsStorage instance = PrefsStorage._();

  late final SharedPreferencesWithCache _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  Future<void> saveUserId(String userId) async {
    await _prefs.setString(PrefsKeys.userId, userId);
  }

  Future<String?> getUserId() async {
    return _prefs.getString(PrefsKeys.userId) ?? '';
  }

  Future<void> deleteUserId() async {
    return await _prefs.setString(PrefsKeys.userId, '');
  }
}
