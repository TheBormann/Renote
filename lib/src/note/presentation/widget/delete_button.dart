import 'package:flutter/material.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/note/application/note_cubit.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.noteCubit,
  }) : super(key: key);

  final NoteCubit noteCubit;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Theme.of(context).errorColor,
        onPressed: () async {
          noteCubit.state.when(initial: () => null,
              loading: () => null,
              loaded: (Note note) => noteCubit.trashNote(note, true),
              listening: (Note note, _, __) => noteCubit.trashNote(note, true));
          Navigator.of(context).pop();
        },
      icon: const Icon(Icons.delete),
    );
  }
}
