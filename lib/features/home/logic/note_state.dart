import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_state.freezed.dart';

@freezed
class NoteState<T> with _$NoteState {
  const factory NoteState.initial() = _Initial;
  const factory NoteState.loading() = Loading;
  const factory NoteState.error(String message) = Error;
  const factory NoteState.createSuccess(T data) = CreateSuccess<T>;
  const factory NoteState.updateSuccess(T data) = UpdateSuccess<T>;
  const factory NoteState.deleteSuccess(T data) = DeleteSuccess<T>;
  const factory NoteState.searchSuccess(T data) = SearchSuccess<T>;
  const factory NoteState.getAllNotesSuccess(T data) = GetAllNotesSuccess<T>;
}
