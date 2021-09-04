part of 'tipo_orientacao.entity.dart';

// UST: 01/09 - TipoOrientacaoEntity - id:11 - 2pts - Criação
TipoOrientacaoEntity _$OrientacaoFromJson(Map<String, dynamic> json) {
  return TipoOrientacaoEntity(
    json['idOrientacao'] as int,
    json['descricao'] as String,
    json['idGrupoEntrada'] as int,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - TipoOrientacaoEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$OrientacaoToJson(TipoOrientacaoEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idOrientacao': instance.idOrientacao,
      'descricao': instance.descricao,
      'idGrupoEntrada': instance.idGrupoEntrada,
    };
