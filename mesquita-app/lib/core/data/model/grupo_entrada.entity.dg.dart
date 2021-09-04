part of 'grupo_entrada.entity.dart';

// UST: 01/09 - GrupoEntradaEntity - id:11 - 2pts - Criação
GrupoEntradaEntity _$GrupoEntradaEntityFromJson(Map<String, dynamic> json) {
  return GrupoEntradaEntity(
    json['idGrupoEntrada'] as int,
    json['descricao'] as String,
    json['idGrupoEntradaPai'] as int,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - GrupoEntradaEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$GrupoEntradaEntityToJson(GrupoEntradaEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idGrupoEntrada': instance.idGrupoEntrada,
      'descricao': instance.descricao,
      'idGrupoEntradaPai': instance.idGrupoEntradaPai,
    };
