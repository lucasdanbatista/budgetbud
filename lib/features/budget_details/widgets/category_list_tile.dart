import 'package:flutter/material.dart';

import '../../../core/entities/category.dart';
import '../../../widgets/budget_limit_progress_bar.dart';
import '../../../widgets/category_avatar.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;
  final VoidCallback onEditPressed;

  const CategoryListTile(
    this.category, {
    super.key,
    required this.onTap,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
      leading: CategoryAvatar(category),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: onEditPressed,
      ),
      title: Text(category.title),
      subtitle: BudgetLimitProgressBar(
        utilized: category.utilized,
        limit: category.limit,
        color: category.color,
      ),
      onTap: onTap,
    );
  }
}
