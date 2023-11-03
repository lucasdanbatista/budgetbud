import 'package:get_it/get_it.dart';

import '../../core/entities/category.dart';
import '../../core/module.dart';
import 'category_details_controller.dart';

class CategoryDetailsModule extends Module {
  @override
  Future<void> init() async {
    GetIt.I.registerFactoryParam<CategoryDetailsController, Category, void>(
      (category, _) => CategoryDetailsController(category, GetIt.I()),
    );
  }
}
