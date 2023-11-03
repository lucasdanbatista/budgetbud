import 'package:flutter/material.dart';

import '../../../core/entities/budget.dart';
import '../../../widgets/budget_limit_progress_bar.dart';

class BudgetListTile extends StatelessWidget {
  final Budget budget;
  final VoidCallback onTap;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const BudgetListTile(
    this.budget, {
    super.key,
    required this.onTap,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(budget.title),
      subtitle: BudgetLimitProgressBar(
        utilized: budget.utilized,
        limit: budget.limit,
      ),
      contentPadding: const EdgeInsets.only(left: 16, right: 4),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: onEditPressed,
            child: const Text('Editar'),
          ),
          PopupMenuItem(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Deletar orçamento?'),
                actions: [
                  TextButton(
                    onPressed: onDeletePressed,
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
      onTap: onTap,
    );
  }
}
