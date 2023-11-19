import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'core/core_module.dart';
import 'core/module.dart';
import 'features/app/app_module.dart';
import 'features/app/app_page.dart';
import 'features/archived_budget_list/archived_budget_list_module.dart';
import 'features/budget_details/budget_details_module.dart';
import 'features/budget_list/budget_list_module.dart';
import 'features/category_details/category_details_module.dart';
import 'features/expense_list/expense_list_module.dart';
import 'features/settings/settings_controller.dart';
import 'features/settings/settings_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting();
  await Module.initAll([
    CoreModule(),
    AppModule(),
    ArchivedBudgetListModule(),
    BudgetListModule(),
    BudgetDetailsModule(),
    CategoryDetailsModule(),
    ExpenseListModule(),
    SettingsModule(),
  ]);
  await GetIt.I<SettingsController>().fetch();
  runApp(
    MainApp(
      router: GetIt.I(),
      settingsController: GetIt.I(),
    ),
  );
}
