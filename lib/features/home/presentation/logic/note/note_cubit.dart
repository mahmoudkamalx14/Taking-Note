import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/features/home/data/models/note_model.dart';
import 'package:uptodo/features/home/data/repository/note_repository.dart';
import 'package:uptodo/features/home/presentation/logic/note/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final NoteRepository _repository;
  NoteCubit(this._repository) : super(const NoteState.initial());

  static NoteCubit get(context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController createdTimeController = TextEditingController();

  List<NoteModel> notes = [];

  void createNote() async {
    final response = await _repository.createNote(
      NoteModel(
        title: titleController.text,
        content: contentController.text,
        createdTime: DateTime.now(),
      ),
    );

    response.when(
      success: (data) {
        emit(NoteState.createSuccess(data));
      },
      failure: (message) {
        emit(NoteState.error(message));
      },
    );
  }

  void readAllNotes() async {
    final response = await _repository.readAllNotes();

    response.when(
      success: (data) {
        notes = data;

        emit(NoteState.getAllNotesSuccess(data));
      },
      failure: (message) {
        emit(NoteState.error(message));
      },
    );
  }

  void readNote(int id) async {
    final response = await _repository.readNote(id);

    response.when(
      success: (data) {
        emit(NoteState.searchSuccess(data));
      },
      failure: (message) {
        emit(NoteState.error(message));
      },
    );
  }

  void updateNote() async {
    final response = await _repository.updateNote(
      NoteModel(
        title: titleController.text,
        content: contentController.text,
        createdTime: DateTime.now(),
      ),
    );

    response.when(
      success: (data) {
        emit(NoteState.updateSuccess(data));
      },
      failure: (message) {
        emit(NoteState.error(message));
      },
    );
  }

  void deleteNote(int id) async {
    final response = await _repository.deleteNote(id);

    response.when(
      success: (data) {
        emit(NoteState.deleteSuccess(data));
      },
      failure: (message) {
        emit(NoteState.error(message));
      },
    );
  }

  void closeDatabase() async {
    final response = await _repository.closeDatabase();

    response.when(
      success: (data) {
        emit(NoteState.deleteSuccess(data));
      },
      failure: (message) {
        emit(NoteState.error(message));
      },
    );
  }
}
