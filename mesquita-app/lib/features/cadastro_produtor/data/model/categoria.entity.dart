import 'package:sagae/core/generics/generic.entity.dart';

part 'categoria.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class CategoriaPacienteEntity implements GenericEntity {
  // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
  @override
  int keyRef;
  String nome;

  @override
  String toString() {
    return nome;
  }

  CategoriaPacienteEntity({this.nome});

  factory CategoriaPacienteEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$CategoriaEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$CategoriaEntityToJson(this);
}
