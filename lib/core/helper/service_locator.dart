import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import '../../feature/map/data/repo/location_repo/location_repo_imp.dart';
import '../../feature/map/data/repo/map_repo/map_impl.dart';
import '../../feature/map/data/repo/routes_repo/routes_impl.dart';
import '../../data/local/local_storage.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // ! _____ Repos _____ ! //
  getIt.registerLazySingleton<LocationImpl>(
    () => LocationImpl(Location()),
  );
  getIt.registerLazySingleton<MapImpl>(() => MapImpl());
  getIt.registerLazySingleton<RoutesImpl>(() => RoutesImpl());

  // ! _____ Services _____ ! //
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<LocalStorage<Map<dynamic, dynamic>>>(
    () => LocalStorage<Map<dynamic, dynamic>>(),
  );
}
