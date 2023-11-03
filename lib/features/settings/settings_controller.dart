import 'package:mobx/mobx.dart';

import '../../core/repositories/settings_repository.dart';

part 'settings_controller.g.dart';

class SettingsController = SettingsControllerBase with _$SettingsController;

abstract class SettingsControllerBase with Store {
  final SettingsRepository _repository;

  SettingsControllerBase(this._repository);

  @observable
  bool isDarkModeEnabled = false;

  @action
  Future<void> setDarkModeEnabled(bool isEnabled) async {
    await _repository.setDarkModeEnabled(isEnabled);
    isDarkModeEnabled = isEnabled;
  }

  @action
  Future<void> fetch() async {
    isDarkModeEnabled = await _repository.isDarkModeEnabled;
  }
}
