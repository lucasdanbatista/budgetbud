import '../dtos/dto.dart';

abstract interface class DTOMapper<I, O extends DTO> {
  O toDTO(I it);
}
