import 'entity.dart';

class Budget extends Entity {
  late final String id;
  late String title;
  late DateTime startAt;
  late DateTime endAt;

  Budget.lazy({
    String? id,
    String? title,
    DateTime? startAt,
    DateTime? endAt,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
    if (startAt != null) this.startAt = startAt;
    if (endAt != null) this.endAt = endAt;
  }

  factory Budget({
    required String id,
    required String title,
    required DateTime startAt,
    required DateTime endAt,
  }) =>
      Budget.lazy(
        id: id,
        title: title,
        startAt: startAt,
        endAt: endAt,
      );
}
