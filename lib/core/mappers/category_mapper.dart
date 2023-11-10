import 'package:flutter/material.dart';

import '../dtos/category_dto.dart';
import '../entities/budget.dart';
import '../entities/category.dart';
import '../entities/expense.dart';
import 'color_mapper.dart';
import 'dto_mapper.dart';

class CategoryMapper implements DTOMapper<Category, CategoryDTO> {
  final ColorMapper _colorMapper;

  CategoryMapper(this._colorMapper);

  Category toEntity(Budget budget, CategoryDTO it, {List<Expense>? expenses}) {
    final category = Category(
      id: it.id,
      budget: budget,
      title: it.title,
      budgetLimit: it.limit,
      icon: Category.icons[it.iconName] ?? Icons.more_horiz_outlined,
      color: _colorMapper.mapToColor(it.backgroundColor),
    );
    if (expenses != null) category.expenses = expenses;
    return category;
  }

  @override
  CategoryDTO toDTO(Category it) {
    return CategoryDTO(
      id: it.id,
      budgetId: it.budget.id,
      title: it.title,
      limit: it.limit,
      iconName: Category.getIconName(it.icon),
      backgroundColor: _colorMapper.mapToString(it.color),
    );
  }
}
