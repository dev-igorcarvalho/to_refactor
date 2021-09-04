part of 'dado_entrada.entity.dart';

// UST: 01/09 - DadoEntradaEntity - id:11 - 2pts - Criação
DadoEntradaEntity _$DadoEntradaEntityFromJson(Map<String, dynamic> json) {
  return DadoEntradaEntity(
    json['idDadoEntrada'] as int,
    json['descricao'] as String,
    json['idGrupoEntrada'] as int,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - DadoEntradaEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$DadoEntradaEntityToJson(DadoEntradaEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idDadoEntrada': instance.idDadoEntrada,
      'descricao': instance.descricao,
      'idGrupoEntrada': instance.idGrupoEntrada,
    };
