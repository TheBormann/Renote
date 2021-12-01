import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:renode/src/core/logger.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:renode/src/note/infrastructure/note_repository.dart';
import 'package:renode/src/note/infrastructure/speech_to_text_repository.dart';

part 'note_state.dart';

part 'note_cubit.freezed.dart';

/// Holds and reads user settings, updates user settings, or listens to user settings changes.
class NoteCubit extends Cubit<NoteState> {
  final NoteRepositoryImpl _noteRepository;
  final SpeechToTextRepositoryImpl _speechToTextRepository;
  var logger = getLogger();

  late final StreamSubscription errorSub;
  late final StreamSubscription statusesSub;
  late final StreamSubscription wordsSub;

  NoteCubit(this._noteRepository, this._speechToTextRepository)
      : super(const Initial()) {
    /// Track speech to text events
    errorSub = _speechToTextRepository.errors.stream.listen((errorResult) {
      logger.e("${errorResult.errorMsg} - ${errorResult.permanent}");
      stopRecording();
    });

    statusesSub = _speechToTextRepository.statuses.stream.listen((status) {
      logger.i('SpeechToText-Status: $status');
    });

    wordsSub = _speechToTextRepository.words.stream.listen((speechResult) {
      logger.i('SpeechToTextWords: $speechResult');
      state.when(
          initial: () => {},
          loading: () => {},
          loaded: (Note note) => {},
          listening: (Note note, _, __) {
              updateNote(note, speechResult.recognizedWords, speechResult.finalResult);
          }
        );
    });
  }

  /// Create new note
  Future<void> newNote() async {
    emit(Loaded(Note(date: DateTime.now())));
    startRecording();
  }

  /// Update note in state
  Future<void> updateNote(Note note, [String? recognizedWords, bool? isFinal]) async {
    logger.v(
        'updated Note Title: ${note.title} \nupdated Note text: ${note.text} \nrecWords: $recognizedWords');
    state.when(
      initial: () => emit(Loaded(note)),
      loading: () => emit(Loaded(note)),
      loaded: (_) => emit(Loaded(note)),
      listening: (_, __, ___) {
        if (recognizedWords == null || isFinal == null){
          emit(Loaded(note));
        } else {
          if (isFinal) {
            Note newNote = note.copyWith(
                text: note.text.isEmpty ? recognizedWords : note.text.trimRight() + ' ' + recognizedWords);
            emit(Loaded(newNote));
          } else {
            emit(Listening(note, recognizedWords, isFinal));
            // TODO: is not updating while speaking
          }
        }
      },
    );
  }

  /// Note storage interaction
  /// ===========================================

  /// Load note from the DB
  Future<void> loadNote(int noteID) async {
    emit(const Loading());
    final note = await _noteRepository.readNote(noteID);
    emit(Loaded(note));
  }

  /// Update and persist note based on the user's selection.
  Future<void> storeNote(Note? note) async {
    if (note == null) {
      return;
    }
    if (note.id != null) {
      await NoteRepositoryImpl.instance.update(note);
    } else {
      await NoteRepositoryImpl.instance.create(note);
    }
    emit(Loaded(note));
  }

  /// Marks note as trash
  Future<void> trashNote(Note note, bool isTrash) async {
    emit(const Loading());
    if (note.id != null) {
      await _noteRepository.update(note.copyWith(isDeleted: isTrash));
    }
    emit(const Initial());
  }

  /// Delete note based on the user's selection.
  Future<void> deleteNote(int noteID) async {
    emit(const Loading());
    await _noteRepository.delete(noteID);
    emit(const Initial());
  }

  /// add or update note in the DB
  Future<void> addOrUpdate() async {
    emit(Loaded(Note(date: DateTime.now())));
  }

  /// Speech to text
  /// ===========================================

  /// Start speech to text
  Future<void> startRecording() async {
    await _speechToTextRepository.startListening();
    state.when(
      initial: () => stopRecording(),
      loading: () => stopRecording(),
      loaded: (Note note) => emit(Listening(note, '', false)),
      listening: (Note note, String recognizedWords, bool isFinal) =>
          emit(Listening(note, recognizedWords, false)),
    );
  }

  /// Stop speech to text manually
  Future<void> stopRecording() async {
    await _speechToTextRepository.stopListening();
    state.when(
      initial: () => null,
      loading: () => null,
      loaded: (Note note) => null,
      listening: (Note note, String recognizedWords, bool isFinal) =>
          emit(Loaded(note.copyWith(text: note.text + recognizedWords))),
    );

  }

  @override
  Future<void> close() async {
    await errorSub.cancel();
    await statusesSub.cancel();
    await wordsSub.cancel();
    return super.close();
  }
}
