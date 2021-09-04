part of 'categoria.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
CategoriaPacienteEntity _$CategoriaEntityFromJson(Map<String, dynamic> json) {
  return CategoriaPacienteEntity(
    nome: json['nome'] as String,
  );
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$CategoriaEntityToJson(
        CategoriaPacienteEntity instance) =>
    <String, dynamic>{
      'nome': instance.nome,
    };
