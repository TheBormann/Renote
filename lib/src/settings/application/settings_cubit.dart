import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:renode/src/settings/infrastructure/settings_repository.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

/// Holds and reads user settings, updates user settings, or listens to user settings changes.
class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepositoryImpl _settingsRepository;

  SettingsCubit(this._settingsRepository) : super(const Initial());

  /// Load the user's settings from the SettingsRepository.
  Future<void> loadSettings() async {
    final _themeMode = await _settingsRepository.themeMode();
    emit(Loaded(_themeMode));
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    emit(Loaded(newThemeMode));

    await _settingsRepository.updateThemeMode(newThemeMode);
  }
}
