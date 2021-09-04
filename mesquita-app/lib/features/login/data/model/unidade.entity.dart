import 'package:sagae/core/generics/generic.entity.dart';

part 'unidade.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class UnidadeEntity implements GenericEntity {
  // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
  @override
  int keyRef;
  String nome;
  String municipio;

  @override
  String toString() {
    return nome;
  }

  UnidadeEntity({this.nome, this.municipio});

  factory UnidadeEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$UnidadeEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$UnidadeEntityToJson(this);
}
