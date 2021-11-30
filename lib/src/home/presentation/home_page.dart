import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/core/widgets/mic_button.dart';
import 'package:renode/src/core/widgets/note_list.dart';
import 'package:renode/src/home/application/home_cubit.dart';
import 'package:renode/src/home/presentation/widget/main_menu_drawer.dart';
import 'package:renode/src/core/widgets/note_card_widget.dart';
import 'package:renode/src/note/infrastructure/note_repository.dart';
import 'package:renode/src/note/presentation/note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final homeCubit = HomeCubit(NoteRepositoryImpl.instance);
        homeCubit.loadNotes();
        return homeCubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return Scaffold(
          drawer: const MainMenuDrawer(),
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }),
            title: const Text("ReNote"),
          ),
          body: Center(
            child: state.when(
              initial: () {
                return const Text('🙄 Something went wrong here!');
              },
              loading: () {
                return const CircularProgressIndicator();
              },
              loaded: (List<Note> notes) {
                if (notes.isEmpty) {
                  return const Text("📓 Save your thoughts!");
                }
                return NoteList(
                  notes: notes,
                  onTab: (Note note) async {
                    await Navigator.pushNamed(context, NotePage.routName,
                        arguments: note);
                    BlocProvider.of<HomeCubit>(context).loadNotes();
                    setState(() {});
                  },
                );
              },
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MicButton(
            onTab: () async {
              await Navigator.pushNamed(context, NotePage.routName);
              BlocProvider.of<HomeCubit>(context).loadNotes();
              setState(() {});
            },
            isListening: false,
          ),
        );
      }),
    );
  }
}
