import 'package:mobx/mobx.dart';

import '../../core/entities/category.dart';
import '../../core/entities/expense.dart';
import '../../core/repositories/expense_repository.dart';

part 'expense_list_controller.g.dart';

class ExpenseListController = ExpenseListControllerBase
    with _$ExpenseListController;

abstract class ExpenseListControllerBase with Store {
  final Category _category;
  final ExpenseRepository _repository;

  ExpenseListControllerBase(this._category, this._repository);

  @observable
  ObservableList<Expense> expenses = ObservableList();

  @action
  Future<void> fetch() async =>
      expenses = ObservableList.of(await _repository.findAll(_category));

  Future<void> create(Expense expense) async {
    await _repository.create(expense, _category);
    await fetch();
  }
}
