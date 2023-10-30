import '../dtos/expense_dto.dart';
import '../entities/category.dart';
import '../entities/expense.dart';

class ExpenseMapper {
  Expense toEntity(ExpenseDTO it, Category category) {
    return Expense(
      id: it.id,
      category: category,
      title: it.title,
      value: it.value,
      madeAt: it.madeAt,
    );
  }
}
