import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/core/widgets/note_list.dart';
import 'package:renode/src/note/infrastructure/note_repository.dart';
import 'package:renode/src/trash/application/trash_cubit.dart';

/// Allows the use to recover deleted notes
class TrashPage extends StatefulWidget {
  const TrashPage({Key? key}) : super(key: key);

  static const routeName = '/trash';

  @override
  State<TrashPage> createState() => _TrashPageState();
}

class _TrashPageState extends State<TrashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final trashCubit = TrashCubit(NoteRepositoryImpl.instance);
        trashCubit.loadNotes();
        return trashCubit;
      },
      child: BlocBuilder<TrashCubit, TrashState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop()),
            title: const Text('Trash'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: state.when(initial: () {
              return const Center(child: Text('🤖 Something went wrong here!'));
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, loaded: (List<Note> notes) {
              return notes.isEmpty
                  ? Center(
                      child: Text(
                      '🔥 You are trash free!',
                      style: Theme.of(context).textTheme.bodyText1,
                    ))
                  : BuildTrashList(notes: notes);
            }),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: state.when(
            initial: () => Container(),
            loading: () => Container(),
            loaded: (List<Note> notes) => notes.isEmpty
                ? Container()
                : SizedBox(
                    width: 150,
                    child: FloatingActionButton(
                      onPressed: () async {
                        BlocProvider.of<TrashCubit>(context)
                            .deleteAllTrashNotes();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Delete All 😤",
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
          ),
        );
      }),
    );
  }
}

class BuildTrashList extends StatelessWidget {
  final List<Note> notes;

  const BuildTrashList({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteList(
      notes: notes,
      onTab: (Note note) {
        showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
                  title: const Text('Recover Note?'),
                  actions: [Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await BlocProvider.of<TrashCubit>(context)
                            .restoreNote(note);
                        Navigator.of(dialogContext).pop();
                      },
                      child: const Text('👍'),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)))),
                    ),
                  ),],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ));
      },
    );
  }
}
