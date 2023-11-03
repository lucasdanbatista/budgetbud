import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/mixins/init_state_mixin.dart';
import '../../widgets/expense_list_view.dart';
import '../budget_list/budget_list_controller.dart';
import 'expense_list_controller.dart';

class ExpenseListPage extends StatelessWidget with InitStateMixin {
  final BudgetListController budgetListController;
  final ExpenseListController controller;

  const ExpenseListPage({
    super.key,
    required this.budgetListController,
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
      body: Observer(
        builder: (context) => ExpenseListView(
          controller.expenses,
          onUpdate: (result) async {
            await controller.update(result);
            controller.fetch();
            budgetListController.fetch();
          },
          onDelete: (expense) async {
            await controller.delete(expense);
            controller.fetch();
            budgetListController.fetch();
          },
        ),
      ),
    );
  }
}
