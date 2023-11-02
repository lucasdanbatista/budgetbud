import '../dtos/budget_dto.dart';
import '../entities/budget.dart';
import 'dto_mapper.dart';
import 'entity_mapper.dart';

class BudgetMapper
    implements EntityMapper<BudgetDTO, Budget>, DTOMapper<Budget, BudgetDTO> {
  @override
  Budget toEntity(BudgetDTO it) {
    return Budget(
      id: it.id,
      title: it.title,
      startAt: it.startAt,
      endAt: it.endAt,
    );
  }

  @override
  BudgetDTO toDTO(Budget it) {
    return BudgetDTO(
      id: it.id,
      title: it.title,
      startAt: it.startAt,
      endAt: it.endAt,
    );
  }
}
