part of 'medida.entity.dart';

// UST: 01/09 - MedidaEntity - id:11 - 2pts - Criação
MedidaEntity _$MedidaEntityFromJson(Map<String, dynamic> json) {
  return MedidaEntity(
    json['idMedida'] as int,
    json['descricao'] as String,
    json['sigla'] as String,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - MedidaEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$MedidaEntityToJson(MedidaEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idMedida': instance.idMedida,
      'descricao': instance.descricao,
      'sigla': instance.sigla,
    };
