import 'package:sagae/core/data/model/tipo_entidade.entity.dart';
import 'package:sagae/core/generics/generic.entity.dart';

part 'entidade.entity.dg.dart';

//UST: 27/08 - EntidadeEntity - id:7 - 0,5pts - Criação
class EntidadeEntity implements GenericEntity {
  EntidadeEntity(
      {this.idEntidade,
      this.descricao,
      this.tipoEntidade,
      this.idMunicipio,
      this.cnpj});

  @override
  int keyRef;

  int idEntidade;
  String descricao;
  TipoEntidadeEntity tipoEntidade;
  int idMunicipio;
  String cnpj;

  factory EntidadeEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$EntidadeEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$EntidadeEntityToJson(this);

  @override
  String toString() {
    return descricao;
  }
}
