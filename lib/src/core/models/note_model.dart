/// Definition of note DB table
const String tableNotes = 'notes';

/// Definition of note DB fields
class NoteFields {
  static final List<String> values = [
    id,
    title,
    text,
    date,
    isDeleted,
    isImportant
  ];

  static const String id = 'id';
  static const String title = 'title';
  static const String text = 'text';
  static const String date = 'date';
  static const String isImportant = 'isImportant';
  static const String isDeleted = 'isDeleted';
}

/// Note model
class Note{
  final int? id;
  final String title;
  final String text;
  final DateTime date;
  final bool isImportant;
  final bool isDeleted;

  const Note({
    this.id,
    this.title = '',
    this.text = '',
    required this.date,
    this.isImportant = false,
    this.isDeleted = false,
  });
  // TODO: add actual voice message

  /// Converts Note to a json format, that can be used in the db
  Map<String, dynamic> toMap() {
    return {
      NoteFields.title: title,
      NoteFields.text: text,
      NoteFields.date: date.toString(),
      NoteFields.isImportant: isImportant,
      NoteFields.isDeleted: isDeleted
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      text: map['text'],
      date: DateTime.parse(map['date']),
      isImportant: map['isImportant'] == 0 ? false : true,
      isDeleted: map['isDeleted'] == 0 ? false : true,
    );
  }

  Note copyWith({
    int? id,
    String? title,
    String? text,
    bool? isImportant,
    bool? isDeleted,
    DateTime? date,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        text: text ?? this.text,
        isImportant: isImportant ?? this.isImportant,
        isDeleted: isDeleted ?? this.isDeleted,
        date: date ?? this.date,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Note &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          text == other.text &&
          date == other.date &&
          isImportant == other.isImportant &&
          isDeleted == other.isDeleted;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      text.hashCode ^
      date.hashCode ^
      isImportant.hashCode ^
      isDeleted.hashCode;
}