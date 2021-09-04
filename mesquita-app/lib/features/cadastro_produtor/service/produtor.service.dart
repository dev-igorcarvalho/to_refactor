import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_alert.service.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/produtor_rural.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/repository/produtor.repository.dart';
import 'package:sagae/features/cadastro_produtor/presentation/widgets/cadastro_produtor_form.dart';

String loteChaceGambi;
mixin ProdutorService on State<CadastroProdutorForm> {
  String loteCache;
  final bool debugMe = true;
  final GlobalKey<FormState> fCadastroProdutor = GlobalKey<FormState>();
  ProdutorRuralEntity produtorRural = ProdutorRuralEntity();

  //UST: 10/08 - CadastroProdutorForm - id:11 - 2pts - Criação
  Future cadastrar() async {
    fCadastroProdutor.currentState.save();
    if (fCadastroProdutor.currentState.validate()) {
      final ProdutorRuralEntity produtorExistente =
          await sl<ProdutorRuralSembastDatasource>().fetchByCpf(
              produtorRural.cpf.replaceAll('-', '').replaceAll('.', ''));
      if (produtorExistente != null) {
        sl<DgAlertService>().alert(context, msg: 'CPF já cadastrado');
        return;
      }
      sl<DgLoggerService>()
          .loggIt(msg: jsonEncode(produtorRural.toJsonMap()), active: debugMe);
      sl<LoadingStore>().isLoading = true;
      final bool cadastroSalvo =
          await sl<ProdutorRepository>().inserirNovo(produtorRural);
      if (cadastroSalvo) {
        sl<LoadingStore>().isLoading = false;
        limparForm();
        sl<DgAlertService>().alert(context,
            msg: 'Paciente cadastrado com sucesso', loggIt: true);
      } else {
        limparForm();
        sl<DgAlertService>().alert(context,
            msg: 'Houve algum erro no cadastro, tente novamente', loggIt: true);
      }
      sl<LoadingStore>().isLoading = false;
    }
    // Future.delayed(Duration(milliseconds: 1000), () {
    //   Navigator.of(context).popAndPushNamed(CadastroProdutor.ROUTE_NAME);
    // });
  }

  //UST: 01/09 - CadastroProdutorForm - id:11 - 2pts - Criação
  void limparForm() {
    fCadastroProdutor.currentState.reset();
    setState(() {
      produtorRural = ProdutorRuralEntity();
    });
  }

  //UST: 01/09 - CadastroProdutorForm - id:11 - 2pts - Criação
  Future verificaProdutorExistente(String cpf) async {
    if (cpf.length == 14) {
      final ProdutorRuralEntity produtor =
          await sl<ProdutorRuralSembastDatasource>()
              .fetchByCpf(cpf.replaceAll('-', '').replaceAll('.', ''));
      if (produtor != null) {
        produtorRural.cpf = '';
        sl<DgAlertService>().alert(context, msg: 'CPF já cadastrado');
      }
    }
  }

  //UST: 14/09 - CadastroProdutorForm - id:11 - 2pts - Criação
  //TODO: substituir por algum look&feel androidiano
  void datepicker() {
    DatePicker.showDatePicker(context, onConfirm: (val) {
      final DateFormat format = DateFormat('dd/MM/yyyy');
      setState(() {
        produtorRural.dataVacinacao = format.format(val);
      });
      FocusScope.of(context).focusInDirection(TraversalDirection.down);
    },
        currentTime: DateTime.now(),
        locale: LocaleType.pt,
        maxTime: DateTime.now(),
        minTime: DateTime.utc(1920));
  }
}
