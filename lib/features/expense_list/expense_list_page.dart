import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../core/entities/expense.dart';
import '../../utils/formatters/currency_formatter.dart';
import '../../utils/mixins/init_state_mixin.dart';
import 'expense_list_controller.dart';
import 'widgets/expense_bottom_sheet.dart';

@RoutePage()
class ExpenseListPage extends StatelessWidget with InitStateMixin {
  final ExpenseListController controller;

  const ExpenseListPage({
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
        title: const Text('Transações'),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: controller.expenses.length,
          itemBuilder: (context, index) {
            final expense = controller.expenses[index];
            return ListTile(
              title: Text(expense.title),
              leading: const Icon(Icons.attach_money_outlined),
              subtitle: Text(DateFormat.yMd().format(expense.madeAt)),
              trailing: Text(CurrencyFormatter().format(expense.value)),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final expense = await showModalBottomSheet<Expense>(
            context: context,
            builder: (context) => const ExpenseBottomSheet(
              appBarTitle: 'Nova despesa',
            ),
          );
          if (expense != null) {
            controller.create(expense);
          }
        },
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}
