import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'app_router.dart';

class AppModule extends Module {
  @override
  void init() {
    GetIt.I.registerLazySingleton(() => AppRouter());
  }
}
