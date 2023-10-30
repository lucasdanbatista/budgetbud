import 'package:mobx/mobx.dart';

import '../../core/entities/category.dart';
import '../../core/entities/expense.dart';
import '../../core/repositories/budget_repository.dart';
import '../../core/repositories/category_repository.dart';
import '../../core/repositories/expense_repository.dart';

part 'category_list_controller.g.dart';

class CategoryListController = CategoryListControllerBase
    with _$CategoryListController;

abstract class CategoryListControllerBase with Store {
  final BudgetRepository _budgetRepository;
  final CategoryRepository _categoryRepository;
  final ExpenseRepository _expenseRepository;
  final List<Expense> _expenses = [];

  CategoryListControllerBase(
    this._budgetRepository,
    this._categoryRepository,
    this._expenseRepository,
  );

  @observable
  ObservableList<Category> categories = ObservableList();

  @action
  Future<void> fetch() async {
    _expenses.clear();
    final budgets = await _budgetRepository.findAll();
    categories = ObservableList.of(
      await _categoryRepository.findAll(budgets.first),
    );
    for (final category in categories) {
      _expenses.addAll(
        await _expenseRepository.findAll(category),
      );
    }
  }

  double utilizeValueOf(Category category) {
    final expenses = _expenses.where((e) => e.category.id == category.id);
    var sum = 0.0;
    for (final expense in expenses) {
      sum += expense.value;
    }
    return sum;
  }

  double utilizedPercentageOf(Category category) =>
      utilizeValueOf(category) / category.budgetLimit;
}
