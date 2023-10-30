import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'budget_list_controller.dart';

class BudgetListModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerFactory(() => BudgetListController(GetIt.I()));
  }
}
