import 'package:uuid/v4.dart';

import '../datasources/budget_datasource.dart';
import '../entities/budget.dart';
import '../mappers/budget_mapper.dart';

class BudgetRepository {
  final BudgetDatasource _datasource;
  final BudgetMapper _mapper;

  BudgetRepository(this._datasource, this._mapper);

  Future<List<Budget>> findAll() async {
    final data = await _datasource.findAll();
    return data.map(_mapper.toEntity).toList();
  }

  Future<void> update(Budget budget) =>
      _datasource.update(_mapper.toDTO(budget));

  Future<void> create(Budget budget) {
    budget.id = const UuidV4().generate();
    return _datasource.create(_mapper.toDTO(budget));
  }

  Future<void> delete(Budget budget) => _datasource.deleteById(budget.id);
}
