import 'package:json_annotation/json_annotation.dart';

part 'expense_dto.g.dart';

@JsonSerializable()
class ExpenseDTO {
  final String id;
  final String categoryId;
  final String title;
  final double value;
  final DateTime madeAt;

  ExpenseDTO({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.value,
    required this.madeAt,
  });

  factory ExpenseDTO.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDTOToJson(this);
}
