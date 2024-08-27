import 'package:get_it/get_it.dart';
import '../service/hive_service/local_storage.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // ! _____ Repos _____ ! //

  // ! _____ Services _____ ! //
  getIt.registerLazySingleton<LocalStorage<Map<dynamic, dynamic>>>(
    () => LocalStorage<Map<dynamic, dynamic>>(),
  );
}
