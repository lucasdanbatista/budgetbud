// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      id: json['id'] as String,
      budgetId: json['budgetId'] as String,
      title: json['title'] as String,
      budgetLimit: (json['budgetLimit'] as num).toDouble(),
      iconName: json['iconName'] as String,
      backgroundColor: json['backgroundColor'] as String,
    );

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'budgetId': instance.budgetId,
      'title': instance.title,
      'budgetLimit': instance.budgetLimit,
      'iconName': instance.iconName,
      'backgroundColor': instance.backgroundColor,
    };
