import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/budget.dart';
import '../../core/entities/category.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../utils/mixins/init_state_mixin.dart';
import '../app/app_router.gr.dart';
import 'budget_details_controller.dart';
import 'widgets/category_bottom_sheet.dart';
import 'widgets/category_list_tile.dart';

@RoutePage()
class BudgetDetailsPage extends StatelessWidget with InitStateMixin {
  final Budget budget;
  final BudgetDetailsController controller;

  const BudgetDetailsPage({
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
                onEditPressed: () async {
                  final result = await showModalBottomSheet<Category>(
                    context: context,
                    builder: (context) => CategoryBottomSheet(
                      category: category,
                    ),
                  );
                  if (result != null) {
                    await controller.update(result);
                  }
                  controller.fetch(budget);
                },
                onDeletePressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Deletar categoria?'),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          await controller.deleteCategory(category);
                          controller.fetch(budget);
                        },
                        child: const Text('SIM'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('NÃO'),
                      ),
                    ],
                  ),
                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final category = await showModalBottomSheet<Category>(
            context: context,
            builder: (context) => const CategoryBottomSheet(),
          );
          if (category != null) {
            await controller.createCategory(budget, category);
          }
          controller.fetch(budget);
        },
        child: const Icon(Icons.add),
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
