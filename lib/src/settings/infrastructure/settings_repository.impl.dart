
part of './settings_repository.dart';

/// A service that stores and retrieves user settings.
class SettingsRepositoryImpl implements SettingsRepository {
  /// Loads the User's preferred ThemeMode from local storage.
  @override
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTheme = prefs.getString('themeMode');
    switch(storedTheme) {
      case 'ThemeMode.light': {
        return ThemeMode.light;
      }
      case 'ThemeMode.dark':{
        return ThemeMode.dark;
      }
      default:
        return ThemeMode.system;
    }
  }

  /// Persists the user's preferred ThemeMode to local storage.
  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', theme.toString());
  }

  /// checks if the although has been loaded
  @override
  Future<bool> walkthrough() async {
    final prefs = await SharedPreferences.getInstance();
    final storedwalkthrough = prefs.getBool('walkthrough');
    if(storedwalkthrough == false){
      return false;
    }
    return true;
  }
}
