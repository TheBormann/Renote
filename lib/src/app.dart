import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:renode/src/home/presentation/home_page.dart';
import 'package:renode/src/note/presentation/note_page.dart';
import 'package:renode/src/settings/application/settings_cubit.dart';
import 'package:renode/src/settings/infrastructure/settings_repository.dart';
import 'package:renode/src/trash/presentation/trash_page.dart';
import 'core/theme.dart';
import 'settings/presentation/settings_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SettingsCubit(SettingsRepositoryImpl()),
        ),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return state.when(initial: () {
            final settingsCubit = BlocProvider.of<SettingsCubit>(context);
            settingsCubit.loadSettings();
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: buildLoadedApp(context, ThemeMode.system),
            );
          }, loaded: (themeMode) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: buildLoadedApp(context, themeMode),
            );
          });
        },
      ),
    );
  }

  Widget buildLoadedApp(context, themeMode) {
    return MaterialApp(
      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],

      // Use AppLocalizations to configure the correct application title
      // depending on the user's locale.
      //
      // The appTitle is defined in .arb files found in the localization
      // directory.
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,

      debugShowCheckedModeBanner: false,

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SettingsPage.routeName:
                return const SettingsPage();
              case NotePage.routName:
                return const NotePage();
              case TrashPage.routeName:
                return const TrashPage();
              case HomePage.routeName:
              default:
                return const HomePage();
            }
          },
        );
      },
    );
  }
}
