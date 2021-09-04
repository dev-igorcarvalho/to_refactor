part of 'grupo.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
GrupoEntity _$GrupoEntityFromJson(Map<String, dynamic> json) {
  return GrupoEntity(
      nome: json['nome'] as String, categoria: json['categoria'] as String);
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$GrupoEntityToJson(GrupoEntity instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'categoria': instance.categoria,
    };
