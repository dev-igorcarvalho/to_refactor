import 'package:sagae/core/generics/generic.entity.dart';

part 'medida.entity.dg.dart';

//UST: 25/08 - MedidaEntity - id:7 - 0,5pts - Criação
class MedidaEntity implements GenericEntity {
  MedidaEntity(this.idMedida, this.descricao, this.sigla);

  @override
  int keyRef;

  int idMedida;
  String descricao;
  String sigla;

  factory MedidaEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$MedidaEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$MedidaEntityToJson(this);

  @override
  String toString() {
    return sigla;
  }
}
