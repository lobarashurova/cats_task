// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatsModelImpl _$$CatsModelImplFromJson(Map<String, dynamic> json) =>
    _$CatsModelImpl(
      json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      json['id'] as String?,
      json['user'] as String?,
      json['text'] as String?,
      json['v'] as int?,
      json['source'] as String?,
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['type'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['deleted'] as bool?,
      json['used'] as bool?,
    );

Map<String, dynamic> _$$CatsModelImplToJson(_$CatsModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'id': instance.id,
      'user': instance.user,
      'text': instance.text,
      'v': instance.v,
      'source': instance.source,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
      'deleted': instance.deleted,
      'used': instance.used,
    };

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      json['verified'] as bool?,
      json['sent_count'] as int?,
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'sent_count': instance.sentCount,
    };
