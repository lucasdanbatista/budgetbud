import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';
import '../../../utils/formatters/currency_formatter.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  final double utilizedPercentage;
  final double utilizedValue;
  final VoidCallback onTap;
  final ValueChanged<double> onLimitChanged;

  const CategoryListTile(
    this.category, {
    super.key,
    required this.utilizedPercentage,
    required this.utilizedValue,
    required this.onTap,
    required this.onLimitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
      leading: CircleAvatar(
        backgroundColor: category.backgroundColor,
        child: Icon(
          category.icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      trailing: PopupMenuButton(
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            child: const Text('Editar'),
            onTap: () async {
              final limitController = TextEditingController();
              limitController.text = category.budgetLimit.toString();
              final limit = await showDialog<double>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(category.title),
                  content: TextFormField(
                    controller: limitController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '0.0',
                      labelText: 'Limite',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CANCELAR'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(
                        context,
                        double.parse(limitController.text.trim()),
                      ),
                      child: const Text('SALVAR'),
                    ),
                  ],
                ),
              );
              if (limit != null) {
                onLimitChanged(limit);
              }
            },
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
