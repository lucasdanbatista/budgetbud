import '../dtos/budget_dto.dart';
import '../entities/budget.dart';
import '../entities/category.dart';
import 'dto_mapper.dart';
import 'entity_mapper.dart';

class BudgetMapper
    implements EntityMapper<BudgetDTO, Budget>, DTOMapper<Budget, BudgetDTO> {
  @override
  Budget toEntity(
    BudgetDTO it, {
    List<Category>? categories,
  }) {
    final budget = Budget(
      id: it.id,
      title: it.title,
      limit: it.limit,
      archived: it.archived == 1,
      startAt: it.startAt,
      endAt: it.endAt,
    );
    if (categories != null) budget.categories = categories;
    return budget;
  }

  @override
  BudgetDTO toDTO(Budget it) {
    return BudgetDTO(
      id: it.id,
      title: it.title,
      limit: it.limit,
      archived: it.archived ? 1 : 0,
      startAt: it.startAt,
      endAt: it.endAt,
    );
  }
}
