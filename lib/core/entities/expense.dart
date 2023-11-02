import 'category.dart';
import 'entity.dart';

class Expense extends Entity {
  late final String id;
  late Category category;
  late String title;
  late double value;
  late DateTime madeAt;

  Expense.lazy({
    String? id,
    Category? category,
    String? title,
    double? value,
    DateTime? madeAt,
  }) {
    if (id != null) this.id = id;
    if (category != null) this.category = category;
    if (title != null) this.title = title;
    if (value != null) this.value = value;
    if (madeAt != null) this.madeAt = madeAt;
  }

  factory Expense({
    required String id,
    required Category category,
    required String title,
    required double value,
    required DateTime madeAt,
  }) =>
      Expense.lazy(
        id: id,
        category: category,
        title: title,
        value: value,
        madeAt: madeAt,
      );
}
