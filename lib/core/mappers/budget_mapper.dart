import '../dtos/budget_dto.dart';
import '../entities/budget.dart';
import 'entity_mapper.dart';

class BudgetMapper implements EntityMapper<BudgetDTO, Budget> {
  @override
  Budget toEntity(BudgetDTO it) {
    return Budget(
      id: it.id,
    );
  }
}
