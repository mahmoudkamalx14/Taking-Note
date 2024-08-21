import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:uptodo/features/home/data/models/note_fields.dart';
import 'package:uptodo/features/home/data/models/note_model.dart';

class NoteDatabase {
  /// we created a private constructor for our NoteDatabase class
  static final NoteDatabase instance = NoteDatabase._internal();

  static Database? _database;

  NoteDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/notes.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute(
        'CREATE TABLE ${NoteFields.tableName} (${NoteFields.id} ${NoteFields.idType}, ${NoteFields.title} ${NoteFields.textType}, ${NoteFields.content} ${NoteFields.textType}, ${NoteFields.createdTime} ${NoteFields.textType})');
  }

  /// Creating and saving data into the database
  Future<NoteModel> create(NoteModel note) async {
    final db = await instance.database;
    final id = await db.insert(NoteFields.tableName, note.toJson());

    return note.copy(id: id);
  }

  //? Reading from the database

  /// Get Note by ID (Searching...)
  Future<NoteModel> readNote(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      NoteFields.tableName,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return NoteModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  /// Get all the notes in the database
  Future<List<NoteModel>> readAllNotes() async {
    final db = await instance.database;
    const orderBy = '${NoteFields.createdTime} DESC';

    final result = await db.query(
      NoteFields.tableName,
      orderBy: orderBy,
    );

    return result.map((json) => NoteModel.fromJson(json)).toList();
  }

  /// To update data in the database we create another function called update
  Future<int> update(NoteModel note) async {
    final db = await instance.database;

    return db.update(
      NoteFields.tableName,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  /// To delete data from the database we create a delete function
  Future<int> delete(id) async {
    final db = await instance.database;

    return db.delete(
      NoteFields.tableName,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  /// Closing the database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
