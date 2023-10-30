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
    return data.map(_mapper.toEntity).toList();
  }
}
