import '../dtos/expense_dto.dart';
import '../entities/category.dart';
import '../entities/expense.dart';
import 'dto_mapper.dart';

class ExpenseMapper implements DTOMapper<Expense, ExpenseDTO> {
  Expense toEntity(ExpenseDTO it, Category category) {
    return Expense(
      id: it.id,
      category: category,
      title: it.title,
      value: it.value,
      madeAt: it.madeAt,
      isPending: it.isPending == 1,
    );
  }

  @override
  ExpenseDTO toDTO(Expense it) {
    return ExpenseDTO(
      id: it.id,
      categoryId: it.category.id,
      title: it.title,
      value: it.value,
      madeAt: it.madeAt,
      isPending: it.isPending ? 1 : 0,
    );
  }
}
