import 'package:sagae/core/generics/generic.entity.dart';

part 'tipo_orientacao.entity.dg.dart';

//UST: 25/08 - Orientacao - id:7 - 0,5pts - Criação
class TipoOrientacaoEntity implements GenericEntity {
  TipoOrientacaoEntity(this.idOrientacao, this.descricao, this.idGrupoEntrada);

  @override
  int keyRef;

  int idOrientacao;
  String descricao;
  int idGrupoEntrada;

  factory TipoOrientacaoEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$OrientacaoFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$OrientacaoToJson(this);

  @override
  String toString() {
    return descricao;
  }
}
