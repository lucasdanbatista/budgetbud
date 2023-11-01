import 'package:uuid/v4.dart';

import '../datasources/expense_datasource.dart';
import '../dtos/expense_dto.dart';
import '../entities/category.dart';
import '../entities/expense.dart';
import '../mappers/expense_mapper.dart';

class ExpenseRepository {
  final ExpenseDatasource _datasource;
  final ExpenseMapper _mapper;

  ExpenseRepository(this._datasource, this._mapper);

  Future<void> create(Expense expense, Category category) => _datasource.create(
        ExpenseDTO(
          id: const UuidV4().generate(),
          title: expense.title,
          categoryId: category.id,
          value: expense.value,
          madeAt: expense.madeAt,
        ),
      );

  Future<List<Expense>> findAll(Category category) async {
    final data = await _datasource.findAllByCategoryId(category.id);
    return data.map((e) => _mapper.toEntity(e, category)).toList();
  }

  Future<void> delete(Expense expense) => _datasource.deleteById(expense.id);
}
