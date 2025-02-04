import 'package:renode/src/core/logger.dart';
import 'package:renode/src/core/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

part 'note_repository.impl.dart';

abstract class NoteRepository{

  Future<Note> create(Note note);
  Future<Note> readNote(int id);
  Future<List<Note>> readAllNotes({bool isTrash});
  Future<int> update(Note note);
  Future<int> delete(int id);
  Future<int> deleteTrashNotes();
}