part of 'tipo_entidade.entity.dart';

// UST: 01/09 - TipoEntidadeEntity - id:11 - 2pts - Criação
TipoEntidadeEntity _$TipoEntidadeEntityFromJson(Map<String, dynamic> json) {
  return TipoEntidadeEntity(
    json['idTipoEntidade'] as int,
    json['descricao'] as String,
  );
}

// UST: 01/09 - TipoEntidadeEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$TipoEntidadeEntityToJson(TipoEntidadeEntity instance) =>
    <String, dynamic>{
      'idTipoEntidade': instance.idTipoEntidade,
      'descricao': instance.descricao,
    };
