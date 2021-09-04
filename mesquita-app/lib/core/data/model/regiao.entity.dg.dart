part of 'regiao.entity.dart';

// UST: 01/09 - RegiaoEntity - id:11 - 2pts - Criação
RegiaoEntity _$RegiaoEntityFromJson(Map<String, dynamic> json) {
  return RegiaoEntity(
    json['idRegiao'] as int,
    json['descRegiao'] as String,
  );
}

// UST: 01/09 - RegiaoEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$RegiaoEntityToJson(RegiaoEntity instance) =>
    <String, dynamic>{
      'idRegiao': instance.idRegiao,
      'descRegiao': instance.descRegiao,
    };
