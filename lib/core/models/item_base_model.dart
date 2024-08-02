import 'package:json_annotation/json_annotation.dart';

part 'item_base_model.g.dart';

@JsonSerializable()
class ItemBaseModel {
  final int? id;
  final String? name;

  ItemBaseModel({
    this.id,
    this.name,
  });

  factory ItemBaseModel.fromJson(Map<String, dynamic> json) {
    return _$ItemBaseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemBaseModelToJson(this);

  static List<ItemBaseModel> fromJsonArray(
    List<dynamic> jsonArray,
  ) {
    return jsonArray
        .map(
          (dynamic e) => ItemBaseModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
