import 'package:mobx/mobx.dart';

import '../../core/entities/category.dart';
import '../../core/entities/expense.dart';
import '../../core/repositories/expense_repository.dart';

part 'category_details_controller.g.dart';

class CategoryDetailsController = CategoryDetailsControllerBase
    with _$CategoryDetailsController;

abstract class CategoryDetailsControllerBase with Store {
  final Category category;
  final ExpenseRepository _repository;

  CategoryDetailsControllerBase(this.category, this._repository);

  @observable
  ObservableList<Expense> expenses = ObservableList();

  @action
  Future<void> fetch() async =>
      expenses = ObservableList.of(await _repository.findAll(category));

  Future<void> update(Expense expense) => _repository.update(expense);

  Future<void> delete(Expense expense) => _repository.delete(expense);

  Future<void> create(Expense expense) async {
    expense.category = category;
    await _repository.create(expense);
    await fetch();
  }
}
