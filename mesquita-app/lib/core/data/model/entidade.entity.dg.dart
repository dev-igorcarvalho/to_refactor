part of 'entidade.entity.dart';

// UST: 01/09 - EntidadeEntity - id:11 - 2pts - Criação
EntidadeEntity _$EntidadeEntityFromJson(Map<String, dynamic> json) {
  return EntidadeEntity(
    cnpj: json['cnpj'] as String,
    descricao: json['descricao'] as String,
    idMunicipio: json['idMunicipio'] as int,
    tipoEntidade: json['tipoEntidade'] == null
        ? null
        : TipoEntidadeEntity.fromJsonMap(
            json['tipoEntidade'] as Map<String, dynamic>),
    idEntidade: json['idEntidade'] as int,
  )..keyRef = json['keyRef'] as int;
}

// UST: 01/09 - EntidadeEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$EntidadeEntityToJson(EntidadeEntity instance) =>
    <String, dynamic>{
      'keyRef': instance.keyRef,
      'idEntidade': instance.idEntidade,
      'descricao': instance.descricao,
      'tipoEntidade': instance.tipoEntidade?.toJsonMap(),
      'idMunicipio': instance.idMunicipio,
      'cnpj': instance.cnpj,
    };
