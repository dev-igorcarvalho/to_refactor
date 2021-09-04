import 'package:sagae/core/generics/generic.entity.dart';

part 'agrupamento.entity.dg.dart';

//UST: 15/08 - AgrupamentoEntity - id:7 - 0,5pts - Criação
class AgrupamentoEntity implements GenericEntity {
  AgrupamentoEntity(this.idAgrupamento, this.idMunicipio, this.tipo, this.nome);

  @override
  int keyRef;
  int idAgrupamento;
  int idMunicipio;
  String tipo;
  String nome;

  factory AgrupamentoEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$AgrupamentoEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$AgrupamentoEntityToJson(this);

  @override
  String toString() {
    return nome;
  }
}
