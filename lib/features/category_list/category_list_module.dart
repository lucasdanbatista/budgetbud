import 'package:get_it/get_it.dart';

import '../../core/module.dart';
import 'category_list_controller.dart';

class CategoryListModule extends Module {
  @override
  void init() {
    GetIt.I.registerFactory(() => CategoryListController(GetIt.I()));
  }
}
