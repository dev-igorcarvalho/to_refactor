part of 'unidade.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
UnidadeEntity _$UnidadeEntityFromJson(Map<String, dynamic> json) {
  return UnidadeEntity(
    nome: json['nome'] as String,
    municipio: json['municipio'] as String,
  );
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$UnidadeEntityToJson(UnidadeEntity instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'municipio': instance.municipio,
    };
