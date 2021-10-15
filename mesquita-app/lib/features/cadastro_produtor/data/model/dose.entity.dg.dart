part of 'dose.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
DoseEntity _$DoseEntityFromJson(Map<String, dynamic> json) {
  return DoseEntity(
    nome: json['nome'] as String,
  );
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$DoseEntityToJson(DoseEntity instance) =>
    <String, dynamic>{
      'nome': instance.nome,
    };
