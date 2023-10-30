import 'package:sqflite/sqflite.dart';

import '../dtos/budget_dto.dart';

abstract interface class BudgetDatasource {
  factory BudgetDatasource.local(Database database) = _LocalBudgetDatasource;

  Future<void> create(BudgetDTO budget);

  Future<List<BudgetDTO>> findAll();
}

class _LocalBudgetDatasource implements BudgetDatasource {
  final Database _database;

  _LocalBudgetDatasource(this._database);

  @override
  Future<void> create(BudgetDTO budget) =>
      _database.insert('Budget', budget.toJson());

  @override
  Future<List<BudgetDTO>> findAll() async {
    final data = await _database.query('Budget');
    return data.map(BudgetDTO.fromJson).toList();
  }
}
