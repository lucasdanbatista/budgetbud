import 'package:mobx/mobx.dart';

import '../../core/entities/budget.dart';
import '../../core/repositories/budget_repository.dart';

part 'archived_budget_list_controller.g.dart';

class ArchivedBudgetListController = ArchivedBudgetListControllerBase
    with _$ArchivedBudgetListController;

abstract class ArchivedBudgetListControllerBase with Store {
  final BudgetRepository _repository;

  ArchivedBudgetListControllerBase(this._repository);

  @observable
  ObservableList<Budget> archivedBudgets = ObservableList();

  @action
  Future<void> fetch() async =>
      archivedBudgets = ObservableList.of(await _repository.findAllArchived());

  Future<void> unarchive(Budget budget) => _repository.unarchive(budget);

  Future<void> delete(Budget budget) => _repository.delete(budget);
}
