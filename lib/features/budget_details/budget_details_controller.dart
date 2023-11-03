import 'package:mobx/mobx.dart';

import '../../core/entities/budget.dart';
import '../../core/entities/category.dart';
import '../../core/repositories/budget_repository.dart';
import '../../core/repositories/category_repository.dart';

part 'budget_details_controller.g.dart';

class BudgetDetailsController = BudgetDetailsControllerBase
    with _$BudgetDetailsController;

abstract class BudgetDetailsControllerBase with Store {
  final BudgetRepository _repository;
  final CategoryRepository _categoryRepository;

  BudgetDetailsControllerBase(
    this.budget,
    this._repository,
    this._categoryRepository,
  );

  @observable
  Budget budget;

  @action
  Future<void> fetch() async {
    budget = await _repository.findById(budget.id);
  }

  Future<void> createCategory(Category category) =>
      _categoryRepository.create(category);

  Future<void> deleteCategory(Category category) =>
      _categoryRepository.delete(category);

  Future<void> updateCategory(Category category) =>
      _categoryRepository.update(category);
}
