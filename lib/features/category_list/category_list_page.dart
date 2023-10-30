import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/budget.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../utils/mixins/init_state_mixin.dart';
import '../app/app_router.gr.dart';
import 'category_list_controller.dart';
import 'widgets/category_list_tile.dart';

@RoutePage()
class CategoryListPage extends StatelessWidget with InitStateMixin {
  final Budget budget;
  final CategoryListController controller;

  const CategoryListPage({
    super.key,
    required this.budget,
    required this.controller,
  });

  @override
  Future<void> initState() async {
    await controller.fetch(budget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(budget.title),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 120,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return Observer(
              builder: (context) => CategoryListTile(
                category,
                utilizedValue: controller.utilizeValueOf(category),
                utilizedPercentage: controller.utilizedPercentageOf(category),
                onLimitChanged: (limit) async {
                  await controller.updateLimit(category, limit);
                  controller.fetch(budget);
                },
                onTap: () async {
                  await context.pushRoute(
                    ExpenseListRoute(
                      controller: GetIt.I(
                        param1: category,
                      ),
                    ),
                  );
                  controller.fetch(budget);
                },
              ),
            );
          },
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Observer(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              '${CurrencyFormatter().format(controller.totalUtilized)} de '
              '${CurrencyFormatter().format(controller.totalBudgetLimit)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
