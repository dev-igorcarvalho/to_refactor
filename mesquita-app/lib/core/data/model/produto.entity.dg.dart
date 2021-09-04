part of 'produto.entity.dart';

// UST: 01/09 - ProdutoEntity - id:11 - 2pts - Criação
ProdutoEntity _$ProdutoEntityFromJson(Map<String, dynamic> json) {
  return ProdutoEntity(
    json['idProduto'] as int,
    json['descricao'] as String,
    json['idGrupoEntrada'] as int,
    json['idDadoEntrada'] as int,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - ProdutoEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$ProdutoEntityToJson(ProdutoEntity instance) =>
    <String, dynamic>{
      'id': instance.keyRef,
      'idProduto': instance.idProduto,
      'descricao': instance.descricao,
      'idGrupoEntrada': instance.idGrupoEntrada,
      'idDadoEntrada': instance.idDadoEntrada,
    };
