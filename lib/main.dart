import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'core/core_module.dart';
import 'core/module.dart';
import 'features/app/app_module.dart';
import 'features/app/app_page.dart';
import 'features/category_list/category_list_module.dart';

Future<void> main() async {
  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting();
  Module.initAll([
    CoreModule(),
    AppModule(),
    CategoryListModule(),
  ]);
  runApp(MainApp(router: GetIt.I()));
}
