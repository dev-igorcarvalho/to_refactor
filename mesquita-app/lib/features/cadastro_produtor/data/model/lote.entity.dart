import 'package:sagae/core/generics/generic.entity.dart';

part 'lote.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class LoteEntity implements GenericEntity {
  @override
  int keyRef;
  String numero;
  String laboratorio;

  @override
  String toString() {
    return numero;
  }

  LoteEntity({this.numero, this.laboratorio});

  factory LoteEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$LoteEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$LoteEntityToJson(this);
}
