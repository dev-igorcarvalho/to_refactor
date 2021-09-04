part of 'agrupamento.entity.dart';

// UST: 01/09 - AgrupamentoEntity - id:11 - 2pts - Criação
AgrupamentoEntity _$AgrupamentoEntityFromJson(Map<String, dynamic> json) {
  return AgrupamentoEntity(
    json['idAgrupamento'] as int,
    json['idMunicipio'] as int,
    json['tipo'] as String,
    json['nome'] as String,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - AgrupamentoEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$AgrupamentoEntityToJson(AgrupamentoEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idAgrupamento': instance.idAgrupamento,
      'idMunicipio': instance.idMunicipio,
      'tipo': instance.tipo,
      'nome': instance.nome,
    };
