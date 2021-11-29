import 'package:flutter/material.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/note/application/note_cubit.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.noteCubit,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final NoteCubit noteCubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Theme.of(context).primaryColor)
              )
          )
      ),
      onPressed: () async {
        final isValid = _formKey.currentState!.validate();
        if (isValid) {
          noteCubit.storeNote(noteCubit.state.when(
              initial: () => null,
              loading: () => null,
              loaded: (Note note) => note,
              listening: (Note note, String recognizedText, __) => note.copyWith(text: note.text + recognizedText)));
          Navigator.of(context).pop();
        }
      },
      child: const Text('Save'),
    );
  }
}
