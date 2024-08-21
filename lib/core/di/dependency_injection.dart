import 'package:get_it/get_it.dart';
import 'package:uptodo/features/home/data/repository/note_repository.dart';
import 'package:uptodo/features/home/data/services/note_database.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final NoteDatabase database = NoteDatabase.instance;

  getIt.registerLazySingleton<NoteDatabase>(() => database);

  getIt.registerLazySingleton<NoteRepository>(() => NoteRepository(database));

  // getIt.registerFactory<NoteCubit>(() => NoteCubit(NoteRepository(database)));
}
