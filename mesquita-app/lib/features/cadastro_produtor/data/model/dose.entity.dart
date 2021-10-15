import 'package:sagae/core/generics/generic.entity.dart';

part 'dose.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class DoseEntity implements GenericEntity {
  // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
  @override
  int keyRef;
  String nome;

  DoseEntity({this.nome});

  @override
  String toString() {
    return nome;
  }

  factory DoseEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$DoseEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$DoseEntityToJson(this);
}
