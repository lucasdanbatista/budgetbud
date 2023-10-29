import 'package:get_it/get_it.dart';

import 'datasources/category_datasource.dart';
import 'mappers/category_mapper.dart';
import 'module.dart';
import 'repositories/category_repository.dart';

class CoreModule extends Module {
  @override
  void init() {
    GetIt.I.registerLazySingleton(() => CategoryRepository.mock());
    GetIt.I.registerLazySingleton(() => CategoryMapper());
    GetIt.I.registerLazySingleton(() => CategoryDatasource.mock());
  }
}
