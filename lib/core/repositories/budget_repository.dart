import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';

import '../datasources/budget_datasource.dart';
import '../datasources/category_datasource.dart';
import '../dtos/budget_dto.dart';
import '../dtos/category_dto.dart';
import '../entities/budget.dart';
import '../mappers/budget_mapper.dart';

class BudgetRepository {
  final BudgetDatasource _budgetDatasource;
  final CategoryDatasource _categoryDatasource;
  final BudgetMapper _budgetMapper;

  BudgetRepository(
    this._budgetDatasource,
    this._categoryDatasource,
    this._budgetMapper,
  );

  Future<List<Budget>> findAll() async {
    final data = await _budgetDatasource.findAll();
    return data.map(_budgetMapper.toEntity).toList();
  }

  Future<void> init() async {
    final data = await _budgetDatasource.findAll();
    if (data.isEmpty) {
      final budget = BudgetDTO(
        id: const UuidV4().generate(),
        title: 'Meu orçamento atual',
        startAt: DateTime.now(),
        endAt: DateTime.now().add(const Duration(days: 30)),
      );
      await _budgetDatasource.create(budget);
      await _categoryDatasource.create(
        CategoryDTO(
          id: const UuidV4().generate(),
          budgetId: budget.id,
          title: 'Alimentação',
          iconName: 'ic_restaurant',
          budgetLimit: 100,
          backgroundColor: Colors.red.shade400.value.toString(),
        ),
      );
      await _categoryDatasource.create(
        CategoryDTO(
          id: const UuidV4().generate(),
          budgetId: budget.id,
          title: 'Moradia',
          iconName: 'ic_home',
          budgetLimit: 100,
          backgroundColor: Colors.blue.shade400.value.toString(),
        ),
      );
    }
  }
}
