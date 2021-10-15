part of 'produtor_rural.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
ProdutorRuralEntity _$ProdutorEntityFromJson(Map<String, dynamic> json) {
  return ProdutorRuralEntity(
    cpf: json['cpf'] as String,
    telefone: json['telefone'] as String,
    celular: json['celular'] as String,
    dose: json['dose'] == null
        ? null
        : DoseEntity.fromJsonMap(json['dose'] as Map<String, dynamic>),
    tipoVacina: json['tipoVacina'] == null
        ? null
        : TipoVacinaEntity.fromJsonMap(
            json['tipoVacina'] as Map<String, dynamic>),
    dataVacinacao: json['dataVacinacao'] as String,
    lote: json['lote'] == null
        ? null
        : LoteEntity.fromJsonMap(json['lote'] as Map<String, dynamic>),
    categoria: json['categoria'] == null
        ? null
        : CategoriaPacienteEntity.fromJsonMap(
            json['categoria'] as Map<String, dynamic>),
    grupo: json['grupo'] == null
        ? null
        : GrupoEntity.fromJsonMap(json['grupo'] as Map<String, dynamic>),
  );
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$ProdutorEntityToJson(ProdutorRuralEntity instance) =>
    <String, dynamic>{
      'cpf': instance.cpf,
      'telefone': instance.telefone,
      'celular': instance.celular,
      'dose': instance.dose?.toJsonMap(),
      'tipoVacina': instance.tipoVacina?.toJsonMap(),
      'dataVacinacao': instance.dataVacinacao,
      'lote': instance.lote?.toJsonMap(),
      'categoria': instance.categoria?.toJsonMap(),
      'grupo': instance.grupo?.toJsonMap(),
    };
