import 'package:sqflite/sqflite.dart';

import '../dtos/budget_dto.dart';

abstract interface class BudgetDatasource {
  factory BudgetDatasource.local(Database database) = _LocalBudgetDatasource;

  Future<void> create(BudgetDTO budget);

  Future<void> update(BudgetDTO budget);

  Future<void> deleteById(String id);

  Future<void> archiveById(String id);

  Future<void> unarchiveById(String id);

  Future<BudgetDTO> findById(String id);

  Future<List<BudgetDTO>> findAll();
}

class _LocalBudgetDatasource implements BudgetDatasource {
  final Database _database;

  _LocalBudgetDatasource(this._database);

  @override
  Future<void> create(BudgetDTO budget) =>
      _database.insert('Budget', budget.toJson());

  @override
  Future<void> update(BudgetDTO budget) => _database.update(
        'Budget',
        budget.toJson(),
        where: 'id = ?',
        whereArgs: [budget.id],
      );

  @override
  Future<void> deleteById(String id) =>
      _database.delete('Budget', where: 'id = ?', whereArgs: [id]);

  @override
  Future<void> archiveById(String id) => _setArchived(id: id, archived: true);

  @override
  Future<void> unarchiveById(String id) =>
      _setArchived(id: id, archived: false);

  Future<void> _setArchived({
    required String id,
    required bool archived,
  }) async {
    final budget = await findById(id);
    budget.archived = archived ? 1 : 0;
    await update(budget);
  }

  @override
  Future<List<BudgetDTO>> findAll() async {
    final data = await _database.query('Budget');
    return data.map(BudgetDTO.fromJson).toList();
  }

  @override
  Future<BudgetDTO> findById(String id) async {
    final data = await _database.query(
      'Budget',
      where: 'id = ?',
      whereArgs: [id],
    );
    return BudgetDTO.fromJson(data.first);
  }
}
