import 'package:sagae/core/generics/generic.entity.dart';

part 'tipo_vacina.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class TipoVacinaEntity implements GenericEntity {
  // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
  @override
  int keyRef;
  String nome;

  TipoVacinaEntity({this.nome});

  @override
  String toString() {
    return nome;
  }

  factory TipoVacinaEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$TipoVacinaEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$TipoVacinaEntityToJson(this);
}
