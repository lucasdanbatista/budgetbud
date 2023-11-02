import '../datasources/category_datasource.dart';
import '../entities/budget.dart';
import '../entities/category.dart';
import '../mappers/category_mapper.dart';

class CategoryRepository {
  final CategoryDatasource _datasource;
  final CategoryMapper _mapper;

  CategoryRepository(this._datasource, this._mapper);

  Future<List<Category>> findAll(Budget budget) async {
    final data = await _datasource.findAll(budget.id);
    return data.map((e) => _mapper.toEntity(budget, e)).toList();
  }

  Future<void> create(Category category) =>
      _datasource.create(_mapper.toDTO(category));

  Future<void> delete(Category category) => _datasource.deleteById(category.id);

  Future<void> update(Category category) =>
      _datasource.update(_mapper.toDTO(category));
}
