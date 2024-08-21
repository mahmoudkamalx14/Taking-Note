import 'package:freezed_annotation/freezed_annotation.dart';

part 'sql_result.freezed.dart';

@Freezed()
abstract class SqlResult<T> with _$SqlResult<T> {
  const factory SqlResult.success(T data) = Success<T>;

  const factory SqlResult.failure(String message) = Failure<T>;
}