import 'package:sagae/core/generics/generic.entity.dart';

part 'tipo_entidade.entity.dg.dart';

//UST: 27/08 - TipoEntidadeEntity - id:7 - 0,5pts - Criação
class TipoEntidadeEntity implements GenericEntity {
  TipoEntidadeEntity(this.idTipoEntidade, this.descricao);

  @override
  int keyRef;

  int idTipoEntidade;
  String descricao;

  factory TipoEntidadeEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$TipoEntidadeEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$TipoEntidadeEntityToJson(this);

  @override
  String toString() {
    return descricao;
  }
}
