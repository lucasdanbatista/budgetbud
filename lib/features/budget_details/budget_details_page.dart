import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/entities/category.dart';
import '../../../utils/formatters/currency_formatter.dart';
import '../app/app_router.gr.dart';
import 'budget_details_controller.dart';
import 'widgets/category_bottom_sheet.dart';
import 'widgets/category_list_tile.dart';

@RoutePage()
class BudgetDetailsPage extends StatelessWidget {
  final BudgetDetailsController controller;

  const BudgetDetailsPage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = CurrencyFormatter();
    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.budget.title),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 120,
            ),
            itemCount: controller.budget.categories.length,
            itemBuilder: (context, index) {
              final category = controller.budget.categories[index];
              return CategoryListTile(
                category,
                onEditPressed: () async {
                  final result = await showModalBottomSheet<Category>(
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                      minHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    context: context,
                    builder: (context) => CategoryBottomSheet(
                      category: category,
                      onDeletePressed: (category) async {
                        await controller.deleteCategory(category);
                        controller.fetch();
                      },
                    ),
                  );
                  if (result != null) {
                    await controller.updateCategory(result);
                  }
                  controller.fetch();
                },
                onTap: () async {
                  await context.pushRoute(
                    CategoryDetailsRoute(
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
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final category = await showModalBottomSheet<Category>(
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                  minHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                context: context,
                builder: (context) => const CategoryBottomSheet(),
              );
              if (category != null) {
                category.budget = controller.budget;
                await controller.createCategory(category);
              }
              controller.fetch();
            },
            child: const Icon(Icons.add),
          ),
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${currencyFormatter.format(controller.budget.utilized)} de '
                '${currencyFormatter.format(controller.budget.limit)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        );
      },
    );
  }
}
