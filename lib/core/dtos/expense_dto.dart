import 'package:json_annotation/json_annotation.dart';

import 'dto.dart';

part 'expense_dto.g.dart';

@JsonSerializable()
class ExpenseDTO extends DTO {
  final String id;
  final String categoryId;
  final String title;
  final double value;
  final DateTime madeAt;
  final int isPending;

  ExpenseDTO({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.value,
    required this.madeAt,
    required this.isPending,
  });

  factory ExpenseDTO.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDTOToJson(this);
}
