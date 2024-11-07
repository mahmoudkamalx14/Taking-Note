class NoteFields {
  static const String tableName = 'notes';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String id = '_id';
  static const String title = 'title';
  static const String content = 'content';
  static const String createdTime = 'created_time';

  static const List<String> values = [
    id,
    title,
    content,
    createdTime,
  ];
}
