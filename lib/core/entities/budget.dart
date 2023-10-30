import 'entity.dart';

class Budget extends Entity {
  late final String id;
  late final String title;

  Budget.lazy({
    String? id,
    String? title,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
  }

  factory Budget({
    required String id,
    required String title,
  }) =>
      Budget.lazy(
        id: id,
        title: title,
      );
}
