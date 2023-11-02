import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/entities/budget.dart';
import '../../utils/mixins/init_state_mixin.dart';
import '../app/app_router.gr.dart';
import 'budget_list_controller.dart';
import 'widgets/budget_bottom_sheet.dart';
import 'widgets/budget_list_tile.dart';

@RoutePage()
class BudgetListPage extends StatelessWidget with InitStateMixin {
  final controller = GetIt.I<BudgetListController>();

  BudgetListPage({super.key});

  @override
  Future<void> initState() async {
    await controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orçamentos'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.budgets.length,
          itemBuilder: (context, index) {
            final budget = controller.budgets[index];
            return BudgetListTile(
              budget,
              onEditPressed: () async {
                final result = await showModalBottomSheet(
                  context: context,
                  builder: (context) => BudgetBottomSheet(
                    budget: budget,
                  ),
                );
                if (result != null) {
                  await controller.update(budget);
                }
                controller.fetch();
              },
              onDeletePressed: () async {
                Navigator.pop(context);
                await controller.delete(budget);
                controller.fetch();
              },
              onTap: () async {
                await context.pushRoute(
                  BudgetDetailsRoute(
                    budget: budget,
                    controller: GetIt.I(),
                  ),
                );
                controller.fetch();
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final budget = await showModalBottomSheet<Budget>(
            context: context,
            builder: (context) => const BudgetBottomSheet(),
          );
          if (budget != null) {
            await controller.create(budget);
            controller.fetch();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
