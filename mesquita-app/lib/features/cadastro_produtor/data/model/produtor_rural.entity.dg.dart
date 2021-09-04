part of 'produtor_rural.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
ProdutorRuralEntity _$ProdutorEntityFromJson(Map<String, dynamic> json) {
  return ProdutorRuralEntity(
    cpf: json['cpf'] as String,
    telefone: json['telefone'] as String,
    celular: json['celular'] as String,
    dose: json['dose'] as int,
    tipoVacina: json['tipoVacina'] == null
        ? null
        : TipoVacinaEntity.fromJsonMap(
            json['tipoVacina'] as Map<String, dynamic>),
    dataVacinacao: json['dataVacinacao'] as String,
    lote: json['lote'] as String,
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
      'dose': instance.dose,
      'tipoVacina': instance.tipoVacina?.toJsonMap(),
      'dataVacinacao': instance.dataVacinacao,
      'lote': instance.lote,
      'categoria': instance.categoria?.toJsonMap(),
      'grupo': instance.grupo?.toJsonMap(),
    };
