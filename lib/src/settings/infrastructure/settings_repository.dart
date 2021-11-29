import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_repository.impl.dart';

abstract class SettingsRepository{
  Future<ThemeMode> themeMode();
  Future<void> updateThemeMode(ThemeMode theme);
  Future<bool> walkthrough();
}