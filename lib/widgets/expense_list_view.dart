import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/entities/expense.dart';
import '../utils/extensions/date_time.dart';
import 'expense_list_tile.dart';

class ExpenseListView extends StatelessWidget {
  final ValueChanged<Expense> onUpdate;
  final ValueChanged<Expense> onDelete;
  final List<Expense> expenses;

  const ExpenseListView(
    this.expenses, {
    super.key,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty
        ? const Center(
            child: Text('Não há despesas cadastradas.'),
          )
        : SingleChildScrollView(
            child: Column(
              children: expenses
                  .groupListsBy((e) => e.madeAt.dateOnly)
                  .keys
                  .map(
                    (key) => _Section(
                      date: key,
                      expenses: expenses
                          .where((e) => e.madeAt.isSameDay(key))
                          .toList(),
                      onUpdate: onUpdate,
                      onDelete: onDelete,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}

class _Section extends StatelessWidget {
  final DateTime date;
  final List<Expense> expenses;
  final ValueChanged<Expense> onUpdate;
  final ValueChanged<Expense> onDelete;

  const _Section({
    required this.date,
    required this.expenses,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            DateFormat.yMd().format(date),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...expenses.map(
          (expense) => ExpenseListTile(
            expense,
            onUpdate: onUpdate,
            onDelete: onDelete,
          ),
        ),
      ],
    );
  }
}
