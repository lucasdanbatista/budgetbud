import 'package:json_annotation/json_annotation.dart';

part 'budget_dto.g.dart';

@JsonSerializable()
class BudgetDTO {
  final String id;
  final String title;
  final DateTime startAt;
  final DateTime endAt;

  BudgetDTO({
    required this.id,
    required this.title,
    required this.startAt,
    required this.endAt,
  });

  factory BudgetDTO.fromJson(Map<String, dynamic> json) =>
      _$BudgetDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetDTOToJson(this);
}
