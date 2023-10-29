import '../entities/entity.dart';

abstract interface class EntityMapper<I, O extends Entity> {
  O toEntity(I it);
}
