// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_item_model.freezed.dart';
part 'form_item_model.g.dart';

@freezed
class FormItemModel with _$FormItemModel {
  const factory FormItemModel({
    required String id,
    required String label,
    required String type,
    @JsonKey(name: 'required') required bool isRequired,
  }) = _FormItemModel;

  const FormItemModel._();

  factory FormItemModel.fromJson(Map<String, dynamic> json) =>
      _$FormItemModelFromJson(json);

  static List<FormItemModel> fromJsonList(List<dynamic> json) => json
      .map((e) => FormItemModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
