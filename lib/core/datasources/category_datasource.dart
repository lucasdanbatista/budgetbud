import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';

import '../dtos/category_dto.dart';

abstract interface class CategoryDatasource {
  factory CategoryDatasource.mock() = _MockedCategoryDatasource;

  Future<List<CategoryDTO>> findAll();
}

class _MockedCategoryDatasource implements CategoryDatasource {
  _MockedCategoryDatasource() : assert(!kReleaseMode);
  final _categories = List.generate(
    random.integer(10),
    (_) => CategoryDTO.mock(),
  );

  @override
  Future<List<CategoryDTO>> findAll() async => _categories;
}
