import 'package:sqflite/sqflite.dart';

import '../dtos/category_dto.dart';

abstract interface class CategoryDatasource {
  factory CategoryDatasource.local(Database database) =
      _LocalCategoryDatasource;

  Future<void> create(CategoryDTO category);

  Future<void> updateLimit(String categoryId, double newLimit);

  Future<CategoryDTO> findById(String id);

  Future<List<CategoryDTO>> findAll(String budgetId);
}

class _LocalCategoryDatasource implements CategoryDatasource {
  final Database _database;

  _LocalCategoryDatasource(this._database);

  @override
  Future<void> create(CategoryDTO category) =>
      _database.insert('Category', category.toJson());

  @override
  Future<void> updateLimit(String categoryId, double newLimit) async {
    final category = await findById(categoryId);
    category.budgetLimit = newLimit;
    await _database.update(
      'Category',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [categoryId],
    );
  }

  @override
  Future<CategoryDTO> findById(String id) async {
    final results = await _database.query(
      'Category',
      where: 'id = ?',
      whereArgs: [id],
    );
    return CategoryDTO.fromJson(results.first);
  }

  @override
  Future<List<CategoryDTO>> findAll(String budgetId) async {
    final data = await _database.query(
      'Category',
      where: 'budgetId = ?',
      whereArgs: [budgetId],
    );
    return data.map(CategoryDTO.fromJson).toList();
  }
}
