import 'package:sagae/core/generics/generic.entity.dart';

part 'municipio.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class MunicipioEntity implements GenericEntity {
  // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
  @override
  int keyRef;
  String nome;

  @override
  String toString() {
    return nome;
  }

  MunicipioEntity({this.nome});

  factory MunicipioEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$MunicipioEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$MunicipioEntityToJson(this);
}
