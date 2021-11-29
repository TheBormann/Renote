import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renode/src/settings/application/settings_cubit.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()
        ),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                return const CircularProgressIndicator();
              },
              loaded: (themeMode) {
                return DropdownButton<ThemeMode>(
                  // Read the selected themeMode from the controller
                  value: themeMode,
                  // Call the updateThemeMode method any time the user selects a theme.
                  onChanged: (value) {
                    BlocProvider.of<SettingsCubit>(context).updateThemeMode(value);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark Theme'),
                    )
                  ],
                );
              }
            );
          },
        ),
      ),
    );
  }
}
