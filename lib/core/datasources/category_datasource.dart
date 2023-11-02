import 'package:sqflite/sqflite.dart';

import '../dtos/category_dto.dart';

abstract interface class CategoryDatasource {
  factory CategoryDatasource.local(Database database) =
      _LocalCategoryDatasource;

  Future<void> create(CategoryDTO category);

  Future<void> deleteById(String id);

  Future<void> update(CategoryDTO category);

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
  Future<void> deleteById(String id) =>
      _database.delete('Category', where: 'id = ?', whereArgs: [id]);

  @override
  Future<void> update(CategoryDTO category) => _database.update(
        'Category',
        category.toJson(),
        where: 'id = ?',
        whereArgs: [category.id],
      );

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
