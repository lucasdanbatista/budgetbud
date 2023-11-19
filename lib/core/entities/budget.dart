import '../../utils/extensions/date_time.dart';
import 'category.dart';
import 'entity.dart';

class Budget extends Entity {
  late final String id;
  late String title;
  late double limit;
  late bool archived;
  DateTime? _startAt;
  DateTime? _endAt;
  late final List<Category> categories;

  Budget.lazy({
    String? id,
    String? title,
    double? limit,
    bool? archived,
    DateTime? startAt,
    DateTime? endAt,
  }) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
    if (limit != null) this.limit = limit;
    if (archived != null) this.archived = archived;
    if (startAt != null) this.startAt = startAt;
    if (endAt != null) this.endAt = endAt;
  }

  factory Budget({
    required String id,
    required String title,
    required double limit,
    required bool archived,
    required DateTime startAt,
    required DateTime endAt,
  }) =>
      Budget.lazy(
        id: id,
        title: title,
        limit: limit,
        archived: archived,
        startAt: startAt,
        endAt: endAt,
      );

  DateTime get startAt => _startAt!;

  set startAt(DateTime value) {
    if (_endAt != null) assert(value <= _endAt!);
    _startAt = value;
  }

  DateTime get endAt => _endAt!;

  set endAt(DateTime value) {
    if (_startAt != null) assert(value >= _startAt!);
    _endAt = value;
  }

  double get utilized {
    var sum = 0.0;
    for (final category in categories) {
      sum += category.utilized;
    }
    return sum;
  }
}
