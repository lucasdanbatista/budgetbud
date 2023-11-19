import 'package:mobx/mobx.dart';

import '../../core/entities/budget.dart';
import '../../core/repositories/budget_repository.dart';

part 'budget_list_controller.g.dart';

class BudgetListController = BudgetListControllerBase
    with _$BudgetListController;

abstract class BudgetListControllerBase with Store {
  final BudgetRepository _repository;

  BudgetListControllerBase(this._repository);

  @observable
  ObservableList<Budget> budgets = ObservableList();

  @action
  Future<void> fetchActive() async =>
      budgets = ObservableList.of(await _repository.findAllActive());

  Future<void> update(Budget budget) => _repository.update(budget);

  Future<void> delete(Budget budget) => _repository.delete(budget);

  Future<void> archive(Budget budget) => _repository.archive(budget);

  Future<void> create(Budget budget) => _repository.create(budget);
}
