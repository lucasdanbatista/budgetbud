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
              contentPadding: const EdgeInsets.only(left: 16, right: 4),
              title: Text(expense.title),
              leading: const Icon(Icons.attach_money_outlined),
              subtitle: Text(DateFormat.yMd().format(expense.madeAt)),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(CurrencyFormatter().format(expense.value)),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () async {
                          final result = await showModalBottomSheet<Expense>(
                            context: context,
                            builder: (context) => ExpenseBottomSheet(
                              category: expense.category,
                              expense: expense,
                            ),
                          );
                          if (result != null) {
                            await controller.update(expense);
                          }
                          controller.fetch();
                        },
                        child: const Text('Editar'),
                      ),
                      PopupMenuItem(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Deletar despesa?'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await controller.delete(expense);
                                  controller.fetch();
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
                        child: const Text('Apagar'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final expense = await showModalBottomSheet<Expense>(
            context: context,
            builder: (context) => ExpenseBottomSheet(
              category: controller.category,
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
