import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/note/infrastructure/note_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

/// Holds and reads user settings, updates user settings, or listens to user settings changes.
class HomeCubit extends Cubit<HomeState> {
  final NoteRepositoryImpl _noteRepository;

  HomeCubit(this._noteRepository) : super(const Initial());

  /// Load notes from the SettingsRepository.
  Future<void> loadNotes() async {
    emit(const Loading());
    final notes = await _noteRepository.readAllNotes();
    emit(Loaded(notes));
  }
}
