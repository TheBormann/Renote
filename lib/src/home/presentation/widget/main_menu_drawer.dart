import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renode/src/home/application/home_cubit.dart';
import 'package:renode/src/settings/presentation/settings_page.dart';
import 'package:renode/src/trash/presentation/trash_page.dart';

class MainMenuDrawer extends StatelessWidget {
  const MainMenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                Navigator.restorablePushNamed(context, SettingsPage.routeName);
              },
            ),
            ListTile(
              title: const Text("Trash"),
              onTap: () async {
                Navigator.restorablePushNamed(context, TrashPage.routeName);
                await BlocProvider.of<HomeCubit>(context).loadNotes();
                // TODO: update page not working, when note is restored
              },
            ),
            ListTile(
              title: const Text("Help & feedback"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
