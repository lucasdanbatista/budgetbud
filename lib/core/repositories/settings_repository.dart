import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  static const _darkModeKey = 'settings_dark_mode_enabled';

  Future<bool> get isDarkModeEnabled async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_darkModeKey) ?? false;
  }

  Future<void> setDarkModeEnabled(bool isEnabled) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_darkModeKey, isEnabled);
  }
}
