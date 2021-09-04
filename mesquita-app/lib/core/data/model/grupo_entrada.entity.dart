import 'package:sagae/core/generics/generic.entity.dart';

part 'grupo_entrada.entity.dg.dart';

//UST: 25/08 - GrupoEntradaEntity - id:7 - 0,5pts - Criação
class GrupoEntradaEntity implements GenericEntity {
  GrupoEntradaEntity(
      this.idGrupoEntrada, this.descricao, this.idGrupoEntradaPai);

  @override
  int keyRef;

  int idGrupoEntrada;
  String descricao;
  int idGrupoEntradaPai;

  factory GrupoEntradaEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$GrupoEntradaEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$GrupoEntradaEntityToJson(this);

  @override
  String toString() {
    return descricao;
  }
}
