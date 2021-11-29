part of 'note_cubit.dart';

@freezed
class NoteState with _$NoteState {
  const factory NoteState.initial() = Initial;
  const factory NoteState.loading() = Loading;
  const factory NoteState.loaded(Note note) = Loaded;
  const factory NoteState.listening(Note note, String recognizedWords, bool isFinal) = Listening;
}