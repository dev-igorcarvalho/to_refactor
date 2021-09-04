import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sagae/core/constants/style_constants.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/cpf_mask.dart';
import 'package:sagae/core/util/date_mask.dart';
import 'package:sagae/core/util/dg_input.validator.dart';
import 'package:sagae/core/util/numberParsers.dart';
import 'package:sagae/core/util/sagae_cpf.validator.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_select_menu.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_separator.dart';
import 'package:sagae/features/cadastro_produtor/data/model/categoria.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/grupo.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/tipo_vacina.entity.dart';
import 'package:sagae/features/cadastro_produtor/presentation/providers/cadastro_produtor.store.dart';
import 'package:sagae/features/cadastro_produtor/service/produtor.service.dart';

class CadastroProdutorForm extends StatefulWidget {
  @override
  _CadastroProdutorFormState createState() => _CadastroProdutorFormState();
}

class _CadastroProdutorFormState extends State<CadastroProdutorForm>
    with ProdutorService {
  @override
  void initState() {
    sl<CadastroProdutorStore>().loadDropDownLists();
    loteCache = loteChaceGambi;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print(loteChaceGambi);
    setState(() {
      produtorRural.lote = loteCache;
    });
    print(loteCache);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: fCadastroProdutor,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cpf',
                ),
                //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - Criação
                validator: (val) {
                  return SagaeCpfValidator.validarCpf(val);
                },
                maxLength: 14,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .focusInDirection(TraversalDirection.down);
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [cpfMask],
                onChanged: (String val) {
                  verificaProdutorExistente(val);
                },

                onSaved: (String val) {
                  produtorRural.cpf =
                      val.replaceAll('-', '').replaceAll('.', '');
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                ),
                //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - Criação
                maxLength: 11,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .focusInDirection(TraversalDirection.down);
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: (String val) {
                  verificaProdutorExistente(val);
                },
                onSaved: (String val) {
                  produtorRural.telefone = val;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Celular',
                ),
                //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - Criação
                maxLength: 11,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .focusInDirection(TraversalDirection.down);
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: (String val) {
                  verificaProdutorExistente(val);
                },
                onSaved: (String val) {
                  produtorRural.celular = val;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Data de Vacinação',
                ),
                //UST: 14/09 - CadastroProdutorForm - id:2 - 0,5pts - CriaÃ§Ã£o - removido por solicitacao do cliente
                inputFormatters: [dateMask],
                maxLength: 10,
                key: ValueKey(produtorRural.dataVacinacao),
                initialValue: produtorRural.dataVacinacao,
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .focusInDirection(TraversalDirection.down);
                },
                validator: (val) => DgInputValidator.validarInput(val,
                    nome: 'Data de Vacinação'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onTap: datepicker,
              ),
              Observer(
                builder: (_) => DgSelectMenu(
                  onChanged: (TipoVacinaEntity val) {
                    setState(() {
                      produtorRural.tipoVacina = val;
                    });
                  },
                  //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - CriaÃ§Ã£o
                  validator: (val) =>
                      DgInputValidator.validarInput(val, nome: 'Tipo Vacina'),
                  required: true,
                  titleText: 'Tipo Vacina',
                  value: produtorRural.tipoVacina,
                  dataSource: sl<CadastroProdutorStore>().vacinas,
                ),
              ),
              TextFormField(
                // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
                decoration: const InputDecoration(
                  labelText: 'Dose',
                ),
                maxLength: 1,
                //UST: 14/09 - CadastroProdutorForm - id:2 - 0,5pts - Criação - removido por solicitacao do cliente
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .focusInDirection(TraversalDirection.down);
                },
                validator: (val) =>
                    DgInputValidator.validarInput(val, nome: 'Dose'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: (String val) {
                  produtorRural.dose = parseInt(val);
                },
              ),
              TextFormField(
                // CPF; TIPO DE VACINA; DOSE; LOTE;  CATEGORIA; GRUPO.
                decoration: const InputDecoration(
                  labelText: 'Lote',
                ),
                //UST: 14/09 - CadastroProdutorForm - id:2 - 0,5pts - Criação - removido por solicitacao do cliente
                validator: (val) =>
                    DgInputValidator.validarInput(val, nome: 'Lote'),
                onFieldSubmitted: (_) {
                  FocusScope.of(context)
                      .focusInDirection(TraversalDirection.down);
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                initialValue: loteCache,
                onSaved: (String val) {
                  loteChaceGambi = val;
                  produtorRural.lote = val;
                },
              ),
              Observer(
                builder: (_) => DgSelectMenu(
                  onChanged: (CategoriaPacienteEntity val) {
                    setState(() {
                      produtorRural.grupo = null;
                      produtorRural.categoria = val;
                    });
                    sl<CadastroProdutorStore>().loadGrupoByCategoria(
                        nome: produtorRural.categoria.nome);
                  },
                  required: true,
                  //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - Criação
                  validator: (val) =>
                      DgInputValidator.validarInput(val, nome: 'Categoria'),
                  titleText: 'Categoria',
                  value: produtorRural.categoria,
                  dataSource: sl<CadastroProdutorStore>().categorias,
                ),
              ),
              Observer(
                builder: (_) => DgSelectMenu(
                  onChanged: (GrupoEntity val) {
                    setState(() {
                      produtorRural.grupo = val;
                    });
                  },
                  required: true,
                  //UST: 10/08 - CadastroProdutorForm - id:2 - 0,5pts - Criação
                  validator: (val) =>
                      DgInputValidator.validarInput(val, nome: 'Grupo'),
                  titleText: 'Grupo',
                  value: produtorRural.grupo,
                  dataSource: sl<CadastroProdutorStore>().grupos,
                ),
              ),
              const DgSeparator(spacing: 20),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  cadastrar();
                },
                child: const Text('Cadastrar'),
              )
            ],
          ),
        ));
  }
}
