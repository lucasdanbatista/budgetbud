import 'package:faker/faker.dart';

import '../datasources/category_datasource.dart';
import '../entities/category.dart';
import '../mappers/category_mapper.dart';

abstract interface class CategoryRepository {
  factory CategoryRepository(
    CategoryDatasource datasource,
    CategoryMapper mapper,
  ) = _CategoryRepositoryImpl;

  factory CategoryRepository.mock() = _MockedCategoryRepository;

  Future<List<Category>> findAll();
}

class _MockedCategoryRepository implements CategoryRepository {
  final _categories = List.generate(
    random.integer(10, min: 5),
    (_) => Category.mock(),
  );

  @override
  Future<List<Category>> findAll() async => _categories;
}

class _CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource _datasource;
  final CategoryMapper _mapper;

  _CategoryRepositoryImpl(this._datasource, this._mapper);

  @override
  Future<List<Category>> findAll() async {
    final data = await _datasource.findAll();
    return data.map(_mapper.toEntity).toList();
  }
}
