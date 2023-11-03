import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'expense_list_controller.dart';

class ExpenseListModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerLazySingleton(
      () => ExpenseListController(GetIt.I(), GetIt.I()),
    );
  }
}
