import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/note/infrastructure/note_repository.dart';

part 'trash_state.dart';
part 'trash_cubit.freezed.dart';

class TrashCubit extends Cubit<TrashState> {
  final NoteRepositoryImpl _noteRepository;

  TrashCubit(this._noteRepository) : super(const Initial());

  /// Load notes from the SettingsRepository.
  Future<void> loadNotes() async {
    emit(const Loading());
    final notes = await _noteRepository.readAllNotes(isTrash: true);
    emit(Loaded(notes));
  }

  /// delete all note from DB
  Future<void> deleteAllTrashNotes() async {
    emit(const Loading());
    await _noteRepository.deleteTrashNotes();
    loadNotes();
  }

  /// restore note
  Future<void> restoreNote(Note note) async {
    emit(const Loading());
    if (note.id != null) {
      await _noteRepository.update(note.copyWith(isDeleted: false));
    }
    loadNotes();
  }
}
