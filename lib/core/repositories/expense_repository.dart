import 'package:uuid/v4.dart';

import '../datasources/expense_datasource.dart';
import '../entities/category.dart';
import '../entities/expense.dart';
import '../mappers/expense_mapper.dart';

class ExpenseRepository {
  final ExpenseDatasource _datasource;
  final ExpenseMapper _mapper;

  ExpenseRepository(this._datasource, this._mapper);

  Future<void> create(Expense expense) {
    expense.id = const UuidV4().generate();
    return _datasource.create(_mapper.toDTO(expense));
  }

  Future<List<Expense>> findAll(Category category) async {
    final data = await _datasource.findAllByCategoryId(category.id);
    final expenses = data.map((e) => _mapper.toEntity(e, category)).toList();
    expenses.sort((a, b) => b.madeAt.compareTo(a.madeAt));
    return expenses;
  }

  Future<void> update(Expense expense) =>
      _datasource.update(_mapper.toDTO(expense));

  Future<void> delete(Expense expense) => _datasource.deleteById(expense.id);
}
