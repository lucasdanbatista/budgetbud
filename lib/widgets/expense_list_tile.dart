import 'package:flutter/material.dart';

import '../core/entities/expense.dart';
import '../features/category_details/widgets/expense_bottom_sheet.dart';
import '../utils/formatters/currency_formatter.dart';
import 'category_avatar.dart';

class ExpenseListTile extends StatelessWidget {
  final Expense expense;
  final ValueChanged<Expense> onUpdate;
  final ValueChanged<Expense> onDelete;
  final Widget? leading;

  const ExpenseListTile(
    this.expense, {
    super.key,
    required this.onUpdate,
    required this.onDelete,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 4),
      title: Text(expense.title),
      leading: leading ?? CategoryAvatar(expense.category),
      subtitle: Text(
        expense.category.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            CurrencyFormatter().format(expense.value),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () async {
                  final result = await showModalBottomSheet<Expense>(
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.7,
                      minHeight: MediaQuery.of(context).size.height * 0.7,
                    ),
                    context: context,
                    builder: (context) => ExpenseBottomSheet(
                      category: expense.category,
                      expense: expense,
                    ),
                  );
                  if (result != null) {
                    onUpdate(result);
                  }
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
                          onDelete(expense);
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
                child: const Text('Deletar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
