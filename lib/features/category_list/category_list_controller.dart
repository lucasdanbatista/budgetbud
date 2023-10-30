import 'package:mobx/mobx.dart';

import '../../core/entities/budget.dart';
import '../../core/entities/category.dart';
import '../../core/entities/expense.dart';
import '../../core/repositories/category_repository.dart';
import '../../core/repositories/expense_repository.dart';

part 'category_list_controller.g.dart';

class CategoryListController = CategoryListControllerBase
    with _$CategoryListController;

abstract class CategoryListControllerBase with Store {
  final CategoryRepository _categoryRepository;
  final ExpenseRepository _expenseRepository;

  @observable
  ObservableList<Expense> expenses = ObservableList();

  CategoryListControllerBase(
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

  Future<void> updateLimit(Category category, double newLimit) =>
      _categoryRepository.updateLimit(category, newLimit);

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
