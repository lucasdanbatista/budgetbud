import 'package:mobx/mobx.dart';

import '../../core/entities/budget.dart';
import '../../core/entities/category.dart';
import '../../core/entities/expense.dart';
import '../../core/repositories/category_repository.dart';
import '../../core/repositories/expense_repository.dart';

part 'budget_details_controller.g.dart';

class BudgetDetailsController = BudgetDetailsControllerBase
    with _$BudgetDetailsController;

abstract class BudgetDetailsControllerBase with Store {
  final CategoryRepository _categoryRepository;
  final ExpenseRepository _expenseRepository;

  @observable
  ObservableList<Expense> expenses = ObservableList();

  BudgetDetailsControllerBase(
    this._categoryRepository,
    this._expenseRepository,
  );

  @observable
  ObservableList<Category> categories = ObservableList();

  @action
  Future<void> fetch(Budget budget) async {
    expenses.clear();
    categories = ObservableList.of(
      await _categoryRepository.findAll(budget),
    );
    for (final category in categories) {
      expenses.addAll(
        await _expenseRepository.findAll(category),
      );
    }
  }

  Future<void> createCategory(Category category) =>
      _categoryRepository.create(category);

  Future<void> deleteCategory(Category category) =>
      _categoryRepository.delete(category);

  Future<void> updateCategory(Category category) =>
      _categoryRepository.update(category);

  double utilizeValueOf(Category category) {
    final expenses = this.expenses.where((e) => e.category.id == category.id);
    var sum = 0.0;
    for (final expense in expenses) {
      sum += expense.value;
    }
    return sum;
  }

  double utilizedPercentageOf(Category category) {
    if (category.budgetLimit == 0) return 0;
    return utilizeValueOf(category) / category.budgetLimit;
  }

  @computed
  double get totalUtilized {
    var sum = 0.0;
    for (final expense in expenses) {
      sum += expense.value;
    }
    return sum;
  }

  @computed
  double get totalBudgetLimit {
    var sum = 0.0;
    for (final category in categories) {
      sum += category.budgetLimit;
    }
    return sum;
  }
}
