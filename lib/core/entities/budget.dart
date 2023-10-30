import 'entity.dart';

class Budget extends Entity {
  late final String id;

  Budget.lazy({String? id}) {
    if (id != null) this.id = id;
  }

  factory Budget({required String id}) => Budget.lazy(id: id);
}
