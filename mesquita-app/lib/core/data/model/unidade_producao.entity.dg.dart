part of 'unidade_producao.entity.dart';

// UST: 01/09 - UnidadeProducaoEntity - id:11 - 2pts - Criação
// UST: 04/2021 - UnidadeProducaoEntity - id:11 - 2pts - Edição
UnidadeProducaoEntity _$UnidadeProducaoFromJson(Map<String, dynamic> json) {
  return UnidadeProducaoEntity(
    idUnidadeProducao: json['idUnidadeProducao'] as int,
    unpNome: json['unpNome'] as String,
    idMunicipio: json['idMunicipio'] as int,
    proprietarioNome: json['proprietarioNome'] as String,
    proprietarioCpf: json['proprietarioCpf'] as String,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - UnidadeProducaoEntity - id:11 - 2pts - Criação
// UST: 04/2021 - UnidadeProducaoEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$UnidadeProducaoToJson(UnidadeProducaoEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idUnidadeProducao': instance.idUnidadeProducao,
      'unpNome': instance.unpNome,
      'idMunicipio': instance.idMunicipio,
      'proprietarioNome': instance.proprietarioNome,
      'proprietarioCpf': instance.proprietarioCpf,
    };
