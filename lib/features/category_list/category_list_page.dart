import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../utils/mixins/init_state_mixin.dart';
import '../app/app_router.gr.dart';
import 'category_list_controller.dart';
import 'widgets/category_list_tile.dart';

@RoutePage()
class CategoryListPage extends StatelessWidget with InitStateMixin {
  final CategoryListController controller;

  const CategoryListPage({
    super.key,
    required this.controller,
  });

  @override
  Future<void> initState() async {
    await controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return CategoryListTile(
              category,
              utilizedValue: controller.utilizeValueOf(category),
              utilizedPercentage: controller.utilizedPercentageOf(category),
              onTap: () async {
                await context.pushRoute(
                  ExpenseListRoute(
                    controller: GetIt.I(
                      param1: category,
                    ),
                  ),
                );
                controller.fetch();
              },
            );
          },
        ),
      ),
    );
  }
}
