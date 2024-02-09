import 'package:base_starter/src/feature/home/resource/domain/models/form_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_model.freezed.dart';
part 'form_model.g.dart';

@freezed
class FormModel with _$FormModel {
  const factory FormModel({
    required int id,
    required String name,
    required List<FormItemModel> fields,
  }) = _FormModel;

  const FormModel._();

  factory FormModel.fromJson(Map<String, dynamic> json) =>
      _$FormModelFromJson(json);

  static List<FormModel> fromJsonList(List<dynamic> json) =>
      json.map((e) => FormModel.fromJson(e as Map<String, dynamic>)).toList();
}
