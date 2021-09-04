import 'package:sagae/core/generics/generic.entity.dart';

part 'programa.entity.dg.dart';

//UST: 14/09 - ProgramaEntity - id:7 - 0,5pts - Criação
class ProgramaEntity implements GenericEntity {
  ProgramaEntity({this.idPrograma, this.descricao, this.programaPrincipal});

  @override
  int keyRef;

  int idPrograma;
  String descricao;
  bool programaPrincipal;

  factory ProgramaEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$ProgramaEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$ProgramaEntityToJson(this);

  @override
  String toString() {
    return descricao;
  }
}
