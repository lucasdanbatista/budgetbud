import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'database_scheme.dart';
import 'datasources/budget_datasource.dart';
import 'datasources/category_datasource.dart';
import 'datasources/expense_datasource.dart';
import 'mappers/budget_mapper.dart';
import 'mappers/category_mapper.dart';
import 'mappers/color_mapper.dart';
import 'mappers/expense_mapper.dart';
import 'module.dart';
import 'repositories/budget_repository.dart';
import 'repositories/category_repository.dart';
import 'repositories/expense_repository.dart';
import 'repositories/settings_repository.dart';

class CoreModule extends Module {
  @override
  Future<void> init() async {
    final latestScheme = DatabaseScheme.latest();
    final database = await openDatabase(
      DatabaseScheme.databaseName,
      version: latestScheme.version,
      onConfigure: (db) => db.execute(DatabaseScheme.globalConfigurations),
      onUpgrade: (db, oldVersion, newVersion) async {
        final scheme = DatabaseScheme.migrate(oldVersion, newVersion);
        for (final table in scheme.tables) {
          await db.execute(table);
        }
      },
      onCreate: (db, version) async {
        for (final table in latestScheme.tables) {
          await db.execute(table);
        }
      },
    );
    GetIt.I.registerLazySingleton(() => database);
    GetIt.I.registerLazySingleton(() => BudgetMapper());
    GetIt.I.registerLazySingleton(() => ColorMapper());
    GetIt.I.registerLazySingleton(() => ExpenseMapper());
    GetIt.I.registerLazySingleton(() => CategoryMapper(GetIt.I()));
    GetIt.I.registerLazySingleton(() => BudgetDatasource.local(GetIt.I()));
    GetIt.I.registerLazySingleton(() => CategoryDatasource.local(GetIt.I()));
    GetIt.I.registerLazySingleton(() => ExpenseDatasource.local(GetIt.I()));
    GetIt.I.registerLazySingleton(
      () => BudgetRepository(GetIt.I(), GetIt.I(), GetIt.I()),
    );
    GetIt.I.registerLazySingleton(
      () => CategoryRepository(GetIt.I(), GetIt.I(), GetIt.I()),
    );
    GetIt.I.registerLazySingleton(
      () => ExpenseRepository(GetIt.I(), GetIt.I()),
    );
    GetIt.I.registerLazySingleton(() => SettingsRepository());
  }
}
