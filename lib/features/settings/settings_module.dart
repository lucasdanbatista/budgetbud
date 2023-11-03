import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'settings_controller.dart';

class SettingsModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerLazySingleton(() => SettingsController(GetIt.I()));
  }
}
