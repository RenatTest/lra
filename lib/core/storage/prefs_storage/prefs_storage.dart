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

  Future<void> saveUserId(int? userId) async {
    await _prefs.setInt(PrefsKeys.userId, userId ?? 0);
  }

  Future<int?> getUserId() async {
    return _prefs.getInt(PrefsKeys.userId) ?? 0;
  }

  Future<void> deleteUserId() async {
    return await _prefs.setInt(PrefsKeys.userId, 0);
  }
}
