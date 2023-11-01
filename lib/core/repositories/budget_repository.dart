import 'package:uuid/v4.dart';

import '../datasources/budget_datasource.dart';
import '../dtos/budget_dto.dart';
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

  Future<void> create(Budget budget) => _datasource.create(
        BudgetDTO(
          id: const UuidV4().generate(),
          title: budget.title,
          startAt: budget.startAt,
          endAt: budget.endAt,
        ),
      );

  Future<void> delete(Budget budget) => _datasource.deleteById(budget.id);
}
