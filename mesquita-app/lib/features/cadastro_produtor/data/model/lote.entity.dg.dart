part of 'lote.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
LoteEntity _$LoteEntityFromJson(Map<String, dynamic> json) {
  return LoteEntity(
      numero: json['numero'] as String,
      laboratorio: json['laboratorio'] as String);
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$LoteEntityToJson(LoteEntity instance) =>
    <String, dynamic>{
      'numero': instance.numero,
      'laboratorio': instance.laboratorio,
    };
