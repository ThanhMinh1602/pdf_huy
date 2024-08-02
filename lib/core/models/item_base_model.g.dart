// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemBaseModel _$ItemBaseModelFromJson(Map<String, dynamic> json) =>
    ItemBaseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItemBaseModelToJson(ItemBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
