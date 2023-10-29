import '../dtos/category_dto.dart';
import '../entities/category.dart';
import 'entity_mapper.dart';

class CategoryMapper implements EntityMapper<CategoryDTO, Category> {
  @override
  Category toEntity(CategoryDTO it) {
    throw UnimplementedError();
  }
}
