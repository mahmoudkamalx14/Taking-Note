import 'package:uptodo/core/networking/sql_result.dart';
import 'package:uptodo/features/home/data/models/note_model.dart';
import 'package:uptodo/features/home/data/services/note_database.dart';

class NoteRepository {
  final NoteDatabase _noteDatabase;

  NoteRepository(this._noteDatabase);

  Future<SqlResult<NoteModel>> createNote(NoteModel note) async {
    final response = await _noteDatabase.create(note);

    try {
      return SqlResult.success(response);
    } on Exception catch (message) {
      return SqlResult.failure(message.toString());
    }
  }

  Future<SqlResult<List<NoteModel>>> readAllNotes() async {
    final response = await _noteDatabase.readAllNotes();

    try {
      return SqlResult.success(response);
    } on Exception catch (message) {
      return SqlResult.failure(message.toString());
    }
  }

  Future<SqlResult<NoteModel>> readNote(int id) async {
    final response = await _noteDatabase.readNote(id);

    try {
      return SqlResult.success(response);
    } on Exception catch (message) {
      return SqlResult.failure(message.toString());
    }
  }

  Future<SqlResult<int>> updateNote(NoteModel note) async {
    final response = await _noteDatabase.update(note);

    try {
      return SqlResult.success(response);
    } on Exception catch (message) {
      return SqlResult.failure(message.toString());
    }
  }

  Future<SqlResult<int>> deleteNote(NoteModel note) async {
    final response = await _noteDatabase.delete(note);

    try {
      return SqlResult.success(response);
    } on Exception catch (message) {
      return SqlResult.failure(message.toString());
    }
  }

  Future closeDatabase() async {
    final response = await _noteDatabase.close();

    try {
      return SqlResult.success(response);
    } on Exception catch (message) {
      return SqlResult.failure(message.toString());
    }
  }
}
