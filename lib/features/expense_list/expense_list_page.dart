import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/entities/expense_filter_options.dart';
import '../../utils/mixins/init_state_mixin.dart';
import '../../widgets/expense_list_view.dart';
import '../budget_list/budget_list_controller.dart';
import '../home/widgets/home_page_child.dart';
import 'expense_list_controller.dart';
import 'widgets/expense_filter_bottom_sheet.dart';

class ExpenseListPage extends StatelessWidget
    with InitStateMixin, HomePageChild {
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
  String get appBarTitle => 'Despesas';

  @override
  List<Widget> get appBarActions => [
        Builder(
          builder: (context) => IconButton(
            onPressed: () async {
              final options = await showModalBottomSheet<ExpenseFilterOptions>(
                context: context,
                builder: (context) => ExpenseFilterBottomSheet(
                  initialOptions: controller.filterOptions,
                ),
              );
              if (options != null) {
                controller.filter(options);
              }
            },
            icon: const Icon(Icons.filter_list),
          ),
        ),
      ];

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
