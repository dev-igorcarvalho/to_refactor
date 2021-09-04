import 'package:sagae/core/generics/generic.entity.dart';

part 'produto.entity.dg.dart';

//UST: 25/08 - ProdutoEntity - id:7 - 0,5pts - Criação
class ProdutoEntity implements GenericEntity {
  ProdutoEntity(
      this.idProduto, this.descricao, this.idGrupoEntrada, this.idDadoEntrada);

  @override
  int keyRef;

  int idProduto;
  String descricao;
  int idGrupoEntrada; // talvez so id
  int idDadoEntrada; // talvez so id

  factory ProdutoEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$ProdutoEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$ProdutoEntityToJson(this);

  @override
  String toString() {
    return descricao;
  }
}
