import 'package:uuid/v4.dart';

import '../datasources/budget_datasource.dart';
import '../entities/budget.dart';
import '../mappers/budget_mapper.dart';
import 'category_repository.dart';

class BudgetRepository {
  final BudgetDatasource _datasource;
  final BudgetMapper _mapper;
  final CategoryRepository _categoryRepository;

  BudgetRepository(
    this._datasource,
    this._mapper,
    this._categoryRepository,
  );

  Future<Budget> findById(String id) async {
    final data = await _datasource.findById(id);
    final budget = _mapper.toEntity(data);
    budget.categories = await _categoryRepository.findAll(budget);
    return budget;
  }

  Future<List<Budget>> findAllActive() async {
    final budgets = await _findAll();
    return budgets.where((e) => e.archived == false).toList();
  }

  Future<List<Budget>> findAllArchived() async {
    final budgets = await _findAll();
    return budgets.where((e) => e.archived == true).toList();
  }

  Future<List<Budget>> _findAll() async {
    final data = await _datasource.findAll();
    final budgets = data.map(_mapper.toEntity).toList();
    for (final budget in budgets) {
      budget.categories = await _categoryRepository.findAll(budget);
    }
    budgets.sort((a, b) => a.endAt.compareTo(b.endAt));
    return budgets;
  }

  Future<void> update(Budget budget) =>
      _datasource.update(_mapper.toDTO(budget));

  Future<void> create(Budget budget) {
    budget.id = const UuidV4().generate();
    return _datasource.create(_mapper.toDTO(budget));
  }

  Future<void> delete(Budget budget) => _datasource.deleteById(budget.id);

  Future<void> archive(Budget budget) => _datasource.archiveById(budget.id);

  Future<void> unarchive(Budget budget) => _datasource.unarchiveById(budget.id);
}
