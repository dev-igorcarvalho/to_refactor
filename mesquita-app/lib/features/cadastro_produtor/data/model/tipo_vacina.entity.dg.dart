part of 'tipo_vacina.entity.dart';

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
TipoVacinaEntity _$TipoVacinaEntityFromJson(Map<String, dynamic> json) {
  return TipoVacinaEntity(
    nome: json['nome'] as String,
  );
}

// UST: 01/09 - ProdutorRuralEntity - id:11 - 2pts - Criação
// UST: 15/09 - ProdutorRuralEntity - id:11 - 2pts - Edição
Map<String, dynamic> _$TipoVacinaEntityToJson(TipoVacinaEntity instance) =>
    <String, dynamic>{
      'nome': instance.nome,
    };
