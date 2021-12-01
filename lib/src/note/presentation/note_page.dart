import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/core/widgets/mic_button.dart';
import 'package:renode/src/note/application/note_cubit.dart';
import 'package:renode/src/note/infrastructure/note_repository.dart';
import 'package:renode/src/note/infrastructure/speech_to_text_repository.dart';
import 'package:renode/src/note/presentation/widget/delete_button.dart';
import 'package:renode/src/note/presentation/widget/note_form_widget.dart';
import 'package:renode/src/note/presentation/widget/save_button.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  static const routName = '/note';

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Note? note = ModalRoute.of(context)!.settings.arguments as Note?;

    return BlocProvider(
      create: (BuildContext context) {
          final noteCubit = NoteCubit(NoteRepositoryImpl.instance, SpeechToTextRepositoryImpl.instance);
          if (note != null) {
            noteCubit.loadNote(note.id as int);
          } else {
            noteCubit.newNote();
          }
          return noteCubit;
      },
      child: BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: buildActionButtons(context),
          ),
          body: state.when(
            initial: () {
              return const Center(child: Text('🤖 Something went wrong here!'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (Note note) {
              return buildForm(context, note);
            }, listening: (Note note, String recognizedWords, bool isFinal) {
             return buildNoteView(context, note.copyWith(text: note.text + recognizedWords));
          },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: MicButton(
            onTab:  () async {
              final noteCubit = BlocProvider.of<NoteCubit>(context);
              if (state is Loaded){
                await noteCubit.startRecording();
              } else {
                await noteCubit.stopRecording();
              }
            },
            isListening: state is Listening ? true : false,
          ),
        );
      }),
    );
  }
  Widget buildForm(BuildContext context, Note note){
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: NoteFormWidget(
          title: note.title,
          text: note.text,
          isImportant: note.isImportant,
          date: note.date,
          onChangedTitle: (title) =>
              BlocProvider.of<NoteCubit>(context)
                  .updateNote(note.copyWith(title: title)),
          onChangedText: (text) => BlocProvider.of<NoteCubit>(context)
              .updateNote(note.copyWith(text: text)),
          onChangedImportant: (isImportant) =>
              BlocProvider.of<NoteCubit>(context).updateNote(
                  note.copyWith(isImportant: isImportant)),
          onChangedDate: (date) => BlocProvider.of<NoteCubit>(context)
              .updateNote(note.copyWith(date: date)),
        ),
      ),
    );
  }
  Widget buildNoteView(BuildContext context, Note note){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              note.title,
              style: Theme.of(context).textTheme.headline4,
            ),
            const Divider(),
            Text(
              note.text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  List<Widget> buildActionButtons(BuildContext context) {
    final noteCubit = BlocProvider.of<NoteCubit>(context);
    final isFormValid = noteCubit.state.when(
        initial: () => false,
        loading: () => false,
        loaded: (Note note) => note.title.isNotEmpty && note.text.isNotEmpty,
        listening: (Note note, _, __) => note.title.isNotEmpty && note.text.isNotEmpty);
    final isStored = noteCubit.state.when(
        initial: () => false,
        loading: () => false,
        loaded: (Note note) => note.id == null ? false : true,
        listening: (Note note, _, __) => note.id == null ? false : true);

    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: isFormValid ? SaveButton(formKey: _formKey, noteCubit: noteCubit) : Container(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: isStored ? DeleteButton(noteCubit: noteCubit) : Container(),
      ),


    ];
  }
}