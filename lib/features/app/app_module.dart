import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'app_router.dart';

class AppModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerLazySingleton(() => AppRouter());
  }
}
