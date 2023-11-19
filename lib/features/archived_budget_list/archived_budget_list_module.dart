import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'archived_budget_list_controller.dart';

class ArchivedBudgetListModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerFactory(() => ArchivedBudgetListController(GetIt.I()));
  }
}
