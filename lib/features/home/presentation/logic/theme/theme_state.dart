import 'package:freezed_annotation/freezed_annotation.dart';
part 'theme_state.freezed.dart';

@freezed
class ThemeState<T> with _$ThemeState {
  const factory ThemeState.initial() = _Initial;
  const factory ThemeState.loading() = Loading;
  const factory ThemeState.successDark() = SuccessDark;
  const factory ThemeState.successLight() = SuccessLight;
  const factory ThemeState.error({required String error}) = Error;
}
