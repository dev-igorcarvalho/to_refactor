import 'package:sagae/core/generics/generic.entity.dart';

part 'metodologia.entity.dg.dart';

//UST: 25/08 - MetodologiaEntity - id:7 - 0,5pts - Criação
class MetodologiaEntity implements GenericEntity {
  MetodologiaEntity(this.idMetodologia, this.metDescricao);

  @override
  int keyRef;

  int idMetodologia;
  String metDescricao;
  //lista de atendimentoOrientacao

  factory MetodologiaEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$MetodologiaEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$MetodologiaEntityToJson(this);

  @override
  String toString() {
    return metDescricao;
  }
}
