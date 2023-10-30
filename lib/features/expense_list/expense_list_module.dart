import 'package:get_it/get_it.dart';

import '../../core/entities/category.dart';
import '../../core/module.dart';
import 'expense_list_controller.dart';

class ExpenseListModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerFactoryParam<ExpenseListController, Category, void>(
      (category, _) => ExpenseListController(category, GetIt.I()),
    );
  }
}
