import 'package:sagae/core/generics/generic.entity.dart';

part 'grupo.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class GrupoEntity implements GenericEntity {
  // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
  @override
  int keyRef;
  String nome;
  String categoria;

  @override
  String toString() {
    return nome;
  }

  GrupoEntity({this.nome, this.categoria});

  factory GrupoEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$GrupoEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$GrupoEntityToJson(this);
}
