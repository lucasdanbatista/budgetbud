import 'package:uuid/v4.dart';

import '../datasources/category_datasource.dart';
import '../entities/budget.dart';
import '../entities/category.dart';
import '../mappers/category_mapper.dart';
import 'expense_repository.dart';

class CategoryRepository {
  final CategoryDatasource _datasource;
  final CategoryMapper _mapper;
  final ExpenseRepository _expenseRepository;

  CategoryRepository(
    this._datasource,
    this._mapper,
    this._expenseRepository,
  );

  Future<List<Category>> findAll(Budget budget) async {
    final data = await _datasource.findAll(budget.id);
    final categories = data.map((e) => _mapper.toEntity(budget, e)).toList();
    for (final category in categories) {
      category.expenses = await _expenseRepository.findAll(category);
    }
    return categories;
  }

  Future<void> create(Category category) {
    category.id = const UuidV4().generate();
    return _datasource.create(_mapper.toDTO(category));
  }

  Future<void> delete(Category category) => _datasource.deleteById(category.id);

  Future<void> update(Category category) =>
      _datasource.update(_mapper.toDTO(category));
}
