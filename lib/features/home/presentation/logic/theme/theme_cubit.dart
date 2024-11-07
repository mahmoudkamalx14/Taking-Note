import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/features/home/presentation/logic/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool darkMode = true;

  void emitThemeModeStates() {
    darkMode = !darkMode;

    if (darkMode == true) {
      emit(const ThemeState.successDark());
    } else {
      emit(const ThemeState.successLight());
    }
  }
}
