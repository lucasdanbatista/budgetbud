import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/mixins/init_state_mixin.dart';
import '../budget_list/widgets/budget_list_tile.dart';
import '../budget_list/widgets/delete_budget_confirmation_dialog.dart';
import 'archived_budget_list_controller.dart';

@RoutePage()
class ArchivedBudgetListPage extends StatelessWidget with InitStateMixin {
  final ArchivedBudgetListController controller;

  const ArchivedBudgetListPage({
    super.key,
    required this.controller,
  });

  @override
  Future<void> initState() async {
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orçamentos arquivados'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.archivedBudgets.length,
          itemBuilder: (context, index) {
            final budget = controller.archivedBudgets[index];
            return BudgetListTile(
              budget,
              onUnarchivePressed: () async {
                await controller.unarchive(budget);
                controller.fetch();
              },
              onDeletePressed: () => showDialog(
                context: context,
                builder: (context) => DeleteBudgetConfirmationDialog(
                  onDeletePressed: () async {
                    Navigator.pop(context);
                    await controller.delete(budget);
                    controller.fetch();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
