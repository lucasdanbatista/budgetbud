import 'package:mobx/mobx.dart';

import '../../core/entities/category.dart';
import '../../core/repositories/category_repository.dart';

part 'category_list_controller.g.dart';

class CategoryListController = CategoryListControllerBase
    with _$CategoryListController;

abstract class CategoryListControllerBase with Store {
  final CategoryRepository _repository;

  CategoryListControllerBase(this._repository);

  @observable
  ObservableList<Category> categories = ObservableList();

  @action
  Future<void> fetch() async =>
      categories = ObservableList.of(await _repository.findAll());
}
