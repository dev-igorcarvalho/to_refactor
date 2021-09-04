import 'package:sagae/core/generics/generic.entity.dart';

part 'unidade_producao.entity.dg.dart';

//UST: 25/08 - UnidadeProducaoEntity - id:7 - 0,5pts - Criação
//UST: 04/2021 - UnidadeProducaoEntity - id:7 - 0,5pts - Edição
class UnidadeProducaoEntity implements GenericEntity {
  UnidadeProducaoEntity(
      {this.idUnidadeProducao,
      this.unpNome,
      this.idMunicipio,
      this.proprietarioNome,
      this.proprietarioCpf});

  @override
  int keyRef;

  int idUnidadeProducao;
  String unpNome;
  int idMunicipio;
  String proprietarioNome;
  String proprietarioCpf;

  factory UnidadeProducaoEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$UnidadeProducaoFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$UnidadeProducaoToJson(this);

  @override
  String toString() {
    return unpNome;
  }
}
