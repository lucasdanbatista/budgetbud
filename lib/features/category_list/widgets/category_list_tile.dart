import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';
import '../../../utils/formatters/currency_formatter.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  final double utilizedPercentage;
  final double utilizedValue;
  final VoidCallback onTap;

  const CategoryListTile(
    this.category, {
    super.key,
    required this.utilizedPercentage,
    required this.utilizedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: category.backgroundColor,
        child: Icon(
          category.icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      trailing: Text(
        '${CurrencyFormatter().format(utilizedValue)} de\n'
        '${CurrencyFormatter().format(category.budgetLimit)}',
        textAlign: TextAlign.end,
      ),
      title: Text(category.title),
      subtitle: LinearProgressIndicator(
        value: utilizedPercentage,
      ),
      onTap: onTap,
    );
  }
}
