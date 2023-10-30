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

  Future<void> create(Budget budget) async {
    final budgetId = const UuidV4().generate();
    await _budgetDatasource.create(
      BudgetDTO(
        id: budgetId,
        title: budget.title,
        startAt: DateTime.now(),
        endAt: DateTime.now().add(const Duration(days: 30)),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Alimentação',
        iconName: 'ic_restaurant',
        budgetLimit: 0,
        backgroundColor: Colors.red.shade400.value.toString(),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Moradia',
        iconName: 'ic_home_outlined',
        budgetLimit: 0,
        backgroundColor: Colors.blue.shade400.value.toString(),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Lazer',
        iconName: 'ic_beach_access_outlined',
        budgetLimit: 0,
        backgroundColor: Colors.amber.shade400.value.toString(),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Cartão de crédito',
        iconName: 'ic_credit_card',
        budgetLimit: 0,
        backgroundColor: Colors.red.shade400.value.toString(),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Supermercado',
        iconName: 'ic_shopping_cart_outlined',
        budgetLimit: 0,
        backgroundColor: Colors.orange.shade400.value.toString(),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Transporte',
        iconName: 'ic_directions_car_outlined',
        budgetLimit: 0,
        backgroundColor: Colors.black87.value.toString(),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Saúde',
        iconName: 'ic_health_and_safety_outlined',
        budgetLimit: 0,
        backgroundColor: Colors.red.shade400.value.toString(),
      ),
    );
    await _categoryDatasource.create(
      CategoryDTO(
        id: const UuidV4().generate(),
        budgetId: budgetId,
        title: 'Educação',
        iconName: 'ic_book_outlined',
        budgetLimit: 0,
        backgroundColor: Colors.blue.shade400.value.toString(),
      ),
    );
  }
}
