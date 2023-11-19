import 'package:json_annotation/json_annotation.dart';

import 'dto.dart';

part 'budget_dto.g.dart';

@JsonSerializable()
class BudgetDTO extends DTO {
  final String id;

  final String title;

  @JsonKey(name: 'budgetLimit')
  final double limit;

  int archived;

  final DateTime startAt;

  final DateTime endAt;

  BudgetDTO({
    required this.id,
    required this.title,
    required this.limit,
    required this.archived,
    required this.startAt,
    required this.endAt,
  });

  factory BudgetDTO.fromJson(Map<String, dynamic> json) =>
      _$BudgetDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetDTOToJson(this);
}
