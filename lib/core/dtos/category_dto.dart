import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dto.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDTO extends DTO {
  String? title;

  CategoryDTO({
    this.title,
  });

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  factory CategoryDTO.mock() {
    assert(!kReleaseMode);
    return CategoryDTO(
      title: faker.lorem.words(random.integer(3, min: 1)).join(' '),
    );
  }

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
