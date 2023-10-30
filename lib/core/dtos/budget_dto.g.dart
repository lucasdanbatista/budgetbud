// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BudgetDTO _$BudgetDTOFromJson(Map<String, dynamic> json) => BudgetDTO(
      id: json['id'] as String,
      title: json['title'] as String,
      startAt: DateTime.parse(json['startAt'] as String),
      endAt: DateTime.parse(json['endAt'] as String),
    );

Map<String, dynamic> _$BudgetDTOToJson(BudgetDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startAt': instance.startAt.toIso8601String(),
      'endAt': instance.endAt.toIso8601String(),
    };
