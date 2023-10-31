import 'package:flutter/material.dart';

import '../dtos/category_dto.dart';
import '../entities/budget.dart';
import '../entities/category.dart';
import 'color_mapper.dart';
import 'dto_mapper.dart';

class CategoryMapper implements DTOMapper<Category, CategoryDTO> {
  final ColorMapper _colorMapper;

  CategoryMapper(this._colorMapper);

  Category toEntity(Budget budget, CategoryDTO it) {
    return Category(
      id: it.id,
      budget: budget,
      title: it.title,
      budgetLimit: it.budgetLimit,
      icon: Category.icons[it.iconName] ?? Icons.more_horiz_outlined,
      backgroundColor: _colorMapper.mapToColor(it.backgroundColor),
    );
  }

  @override
  CategoryDTO toDTO(Category it) {
    return CategoryDTO(
      id: it.id,
      budgetId: it.budget.id,
      title: it.title,
      budgetLimit: it.budgetLimit,
      iconName: Category.getIconName(it.icon),
      backgroundColor: _colorMapper.mapToString(it.backgroundColor),
    );
  }
}
