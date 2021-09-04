part of 'metodologia.entity.dart';

// UST: 01/09 - MetodologiaEntity - id:11 - 2pts - Criação
MetodologiaEntity _$MetodologiaEntityFromJson(Map<String, dynamic> json) {
  return MetodologiaEntity(
    json['idMetodologia'] as int,
    json['metDescricao'] as String,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - MetodologiaEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$MetodologiaEntityToJson(MetodologiaEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idMetodologia': instance.idMetodologia,
      'metDescricao': instance.metDescricao,
    };
