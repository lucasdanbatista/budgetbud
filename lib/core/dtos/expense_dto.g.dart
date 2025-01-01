// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseDTO _$ExpenseDTOFromJson(Map<String, dynamic> json) => ExpenseDTO(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      title: json['title'] as String,
      value: (json['value'] as num).toDouble(),
      madeAt: DateTime.parse(json['madeAt'] as String),
      isPending: (json['isPending'] as num).toInt(),
    );

Map<String, dynamic> _$ExpenseDTOToJson(ExpenseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'title': instance.title,
      'value': instance.value,
      'madeAt': instance.madeAt.toIso8601String(),
      'isPending': instance.isPending,
    };
