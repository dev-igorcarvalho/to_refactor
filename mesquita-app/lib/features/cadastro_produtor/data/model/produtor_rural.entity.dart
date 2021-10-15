import 'dart:convert';

import 'package:sagae/core/generics/generic.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/dose.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/grupo.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/lote.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/tipo_vacina.entity.dart';

import 'categoria.entity.dart';

part 'produtor_rural.entity.dg.dart';

//UST: 15/08 - ProdutorRuralEntity - id:7 - 0,5pts - Criação
//UST: 14/09 - ProdutorRuralEntity - id:7 - 0,5pts - Edição
class ProdutorRuralEntity implements GenericEntity {
  // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
  @override
  int keyRef;
  String cpf;
  String telefone;
  String celular;
  TipoVacinaEntity tipoVacina;
  String dataVacinacao;
  LoteEntity lote;
  DoseEntity dose;
  CategoriaPacienteEntity categoria;
  GrupoEntity grupo;

  ProdutorRuralEntity(
      {this.cpf,
      this.telefone,
      this.celular,
      this.keyRef,
      this.dose,
      this.tipoVacina,
      this.dataVacinacao,
      this.lote,
      this.grupo,
      this.categoria});

  @override
  String toString() {
    return jsonEncode(this.toJsonMap());
  }

  factory ProdutorRuralEntity.fromJsonMap(Map<String, dynamic> json) =>
      _$ProdutorEntityFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$ProdutorEntityToJson(this);
}
