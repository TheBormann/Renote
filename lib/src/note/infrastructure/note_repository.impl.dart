part of './note_repository.dart';

/// A service that stores and retrieves notes.
class NoteRepositoryImpl implements NoteRepository {
  static final NoteRepositoryImpl instance = NoteRepositoryImpl._init();
  static Database? _database;
  final logger = getLogger();

  NoteRepositoryImpl._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = [dbPath, filePath].join();

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'INTEGER NOT NULL DEFAULT 0';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.title} $textType,
  ${NoteFields.text} $textType,
  ${NoteFields.date} $textType,
  ${NoteFields.isImportant} $boolType,
  ${NoteFields.isDeleted} $boolType
  )
''');
    logger.i('Database created');
  }

  @override
  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toMap());
    logger.i('New node stored in DB');

    return note.copyWith(id: id);
  }

  @override
  Future<int> update(Note note) async {
    final db = await instance.database;
    var json = note.toMap();
    json.removeWhere((key, value) => key == 'id');
    logger.i('Node changed in DB');

    return db.update(tableNotes, json,
        where: '${NoteFields.id} = ?', whereArgs: [note.id]);
  }

  @override
  Future<int> delete(int id) async {
    final db = await instance.database;
    logger.i('New deleted in DB');

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  @override
  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    const orderBy = '${NoteFields.date} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);
    return result.map((json) => Note.fromMap(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
    logger.i('DB closed');
  }
}
