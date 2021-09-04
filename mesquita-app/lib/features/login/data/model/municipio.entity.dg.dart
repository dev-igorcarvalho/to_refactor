part of 'municipio.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
MunicipioEntity _$MunicipioEntityFromJson(Map<String, dynamic> json) {
  return MunicipioEntity(nome: json['nome'] as String);
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$MunicipioEntityToJson(MunicipioEntity instance) =>
    <String, dynamic>{
      'nome': instance.nome,
    };
