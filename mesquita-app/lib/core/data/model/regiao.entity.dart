part 'regiao.entity.dg.dart';

//UST: 15/08 - RegiaoEntity - id:7 - 0,5pts - Criação
class RegiaoEntity {
  RegiaoEntity(this.idRegiao, this.descRegiao);

  int idRegiao;
  String descRegiao;

  factory RegiaoEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$RegiaoEntityFromJson(json);

  Map<String, dynamic> toJsonMap() => _$RegiaoEntityToJson(this);
}
