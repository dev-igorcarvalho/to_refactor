import 'package:sagae/core/generics/generic.entity.dart';

part 'dado_entrada.entity.dg.dart';

//UST: 25/08 - DadoEntradaEntity - id:7 - 0,5pts - Criação
class DadoEntradaEntity implements GenericEntity {
  DadoEntradaEntity(this.idDadoEntrada, this.descricao, this.idGrupoEntrada);

  @override
  int keyRef;

  int idDadoEntrada;
  String descricao;
  int idGrupoEntrada;

  factory DadoEntradaEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$DadoEntradaEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$DadoEntradaEntityToJson(this);

  @override
  String toString() {
    return descricao;
  }
}
