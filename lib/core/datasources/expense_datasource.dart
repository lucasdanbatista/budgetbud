import 'package:sqflite/sqflite.dart';

import '../dtos/expense_dto.dart';

abstract interface class ExpenseDatasource {
  factory ExpenseDatasource.local(Database database) = _LocalExpenseDatasource;

  Future<void> create(ExpenseDTO expense);

  Future<void> deleteById(String id);

  Future<List<ExpenseDTO>> findAllByCategoryId(String id);
}

class _LocalExpenseDatasource implements ExpenseDatasource {
  final Database _database;

  _LocalExpenseDatasource(this._database);

  @override
  Future<void> create(ExpenseDTO expense) =>
      _database.insert('Expense', expense.toJson());

  @override
  Future<void> deleteById(String id) =>
      _database.delete('Expense', where: 'id = ?', whereArgs: [id]);

  @override
  Future<List<ExpenseDTO>> findAllByCategoryId(String id) async {
    final data = await _database.query(
      'Expense',
      where: 'categoryId = ?',
      whereArgs: [id],
    );
    return data.map(ExpenseDTO.fromJson).toList();
  }
}
