import '../dtos/category_dto.dart';
import '../entities/category.dart';
import 'color_mapper.dart';
import 'entity_mapper.dart';
import 'icon_mapper.dart';

class CategoryMapper implements EntityMapper<CategoryDTO, Category> {
  final IconMapper _iconMapper;
  final ColorMapper _colorMapper;

  CategoryMapper(this._iconMapper, this._colorMapper);

  @override
  Category toEntity(CategoryDTO it) {
    return Category(
      title: it.title,
      budgetLimit: it.budgetLimit,
      icon: _iconMapper.map(it.iconName),
      backgroundColor: _colorMapper.map(it.backgroundColor),
    );
  }
}
