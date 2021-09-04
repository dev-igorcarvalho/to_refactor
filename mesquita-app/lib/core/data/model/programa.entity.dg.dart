part of 'programa.entity.dart';

// UST: 01/09 - ProgramaEntity - id:11 - 2pts - Criação
ProgramaEntity _$ProgramaEntityFromJson(Map<String, dynamic> json) {
  return ProgramaEntity(
    idPrograma: json['idPrograma'] as int,
    descricao: json['descricao'] as String,
    programaPrincipal: json['programaPrincipal'] as bool,
  )..keyRef = json['id'] as int;
}

// UST: 01/09 - ProgramaEntity - id:11 - 2pts - Criação
Map<String, dynamic> _$ProgramaEntityToJson(ProgramaEntity instance) =>
    <String, dynamic>{
      'idPrograma': instance.idPrograma,
      'descricao': instance.descricao,
      'programaPrincipal': instance.programaPrincipal,
    };
