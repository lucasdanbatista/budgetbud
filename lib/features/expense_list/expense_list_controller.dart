import 'package:mobx/mobx.dart';

import '../../core/entities/expense.dart';
import '../../core/repositories/budget_repository.dart';
import '../../core/repositories/expense_repository.dart';

part 'expense_list_controller.g.dart';

class ExpenseListController = ExpenseListControllerBase
    with _$ExpenseListController;

abstract class ExpenseListControllerBase with Store {
  final BudgetRepository _budgetRepository;
  final ExpenseRepository _expenseRepository;

  ExpenseListControllerBase(
    this._budgetRepository,
    this._expenseRepository,
  );

  @observable
  ObservableList<Expense> expenses = ObservableList();

  @action
  Future<void> fetch() async {
    final result = ObservableList<Expense>();
    final budgets = await _budgetRepository.findAll();
    for (final budget in budgets) {
      for (final category in budget.categories) {
        result.addAll(category.expenses);
      }
    }
    result.sort((a, b) => b.madeAt.compareTo(a.madeAt));
    expenses = result;
  }

  Future<void> update(Expense expense) => _expenseRepository.update(expense);

  Future<void> delete(Expense expense) => _expenseRepository.delete(expense);
}
