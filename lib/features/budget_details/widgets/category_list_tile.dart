import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';
import '../../../utils/formatters/currency_formatter.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  final double utilizedPercentage;
  final double utilizedValue;
  final VoidCallback onTap;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;

  const CategoryListTile(
    this.category, {
    super.key,
    required this.utilizedPercentage,
    required this.utilizedValue,
    required this.onTap,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
      leading: CircleAvatar(
        backgroundColor: category.color,
        child: Icon(
          category.icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            onTap: onEditPressed,
            child: const Text('Editar'),
          ),
          PopupMenuItem(
            onTap: onDeletePressed,
            child: const Text('Deletar'),
          ),
        ],
      ),
      title: Text(category.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: 4)),
          LinearProgressIndicator(
            value: utilizedPercentage,
            color: category.color,
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Text(
            '${CurrencyFormatter().format(utilizedValue)} de '
            '${CurrencyFormatter().format(category.budgetLimit)}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
