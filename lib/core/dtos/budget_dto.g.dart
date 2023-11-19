// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BudgetDTO _$BudgetDTOFromJson(Map<String, dynamic> json) => BudgetDTO(
      id: json['id'] as String,
      title: json['title'] as String,
      limit: (json['budgetLimit'] as num).toDouble(),
      archived: json['archived'] as int,
      startAt: DateTime.parse(json['startAt'] as String),
      endAt: DateTime.parse(json['endAt'] as String),
    );

Map<String, dynamic> _$BudgetDTOToJson(BudgetDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'budgetLimit': instance.limit,
      'archived': instance.archived,
      'startAt': instance.startAt.toIso8601String(),
      'endAt': instance.endAt.toIso8601String(),
    };
