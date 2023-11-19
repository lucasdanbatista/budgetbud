import 'package:flutter/material.dart';

import '../../../core/entities/budget.dart';
import '../../../widgets/budget_limit_progress_bar.dart';

class BudgetListTile extends StatelessWidget {
  final Budget budget;
  final VoidCallback? onTap;
  final VoidCallback? onArchivePressed;
  final VoidCallback? onUnarchivePressed;
  final VoidCallback? onEditPressed;
  final VoidCallback onDeletePressed;

  const BudgetListTile(
    this.budget, {
    super.key,
    required this.onDeletePressed,
    this.onTap,
    this.onEditPressed,
    this.onArchivePressed,
    this.onUnarchivePressed,
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
        icon: const Icon(Icons.more_vert),
        itemBuilder: (context) {
          final items = [
            PopupMenuItem(
              onTap: onDeletePressed,
              child: const Text('Deletar'),
            ),
          ];
          if (onEditPressed != null) {
            items.insert(
              0,
              PopupMenuItem(
                onTap: onEditPressed,
                child: const Text('Editar'),
              ),
            );
          }
          if (onArchivePressed != null) {
            items.insert(
              0,
              PopupMenuItem(
                onTap: onArchivePressed,
                child: const Text('Arquivar'),
              ),
            );
          }
          if (onUnarchivePressed != null) {
            items.insert(
              0,
              PopupMenuItem(
                onTap: onUnarchivePressed,
                child: const Text('Desarquivar'),
              ),
            );
          }
          return items;
        },
      ),
      onTap: onTap,
    );
  }
}
