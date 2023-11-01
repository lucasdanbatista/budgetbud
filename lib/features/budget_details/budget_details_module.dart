import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'budget_details_controller.dart';

class BudgetDetailsModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerFactory(
      () => BudgetDetailsController(GetIt.I(), GetIt.I()),
    );
  }
}
