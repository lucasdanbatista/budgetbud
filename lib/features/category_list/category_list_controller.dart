import 'package:mobx/mobx.dart';

import '../../core/entities/category.dart';
import '../../core/repositories/budget_repository.dart';
import '../../core/repositories/category_repository.dart';

part 'category_list_controller.g.dart';

class CategoryListController = CategoryListControllerBase
    with _$CategoryListController;

abstract class CategoryListControllerBase with Store {
  final BudgetRepository _budgetRepository;
  final CategoryRepository _categoryRepository;

  CategoryListControllerBase(
    this._budgetRepository,
    this._categoryRepository,
  );

  @observable
  ObservableList<Category> categories = ObservableList();

  @action
  Future<void> fetch() async {
    final budgets = await _budgetRepository.findAll();
    categories = ObservableList.of(
      await _categoryRepository.findAll(budgets.first),
    );
  }
}
