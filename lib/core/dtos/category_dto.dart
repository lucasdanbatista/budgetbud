import 'package:json_annotation/json_annotation.dart';

import 'dto.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDTO extends DTO {
  final String id;
  final String budgetId;
  String title;
  double budgetLimit;
  String iconName;
  String backgroundColor;

  CategoryDTO({
    required this.id,
    required this.budgetId,
    required this.title,
    required this.budgetLimit,
    required this.iconName,
    required this.backgroundColor,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
