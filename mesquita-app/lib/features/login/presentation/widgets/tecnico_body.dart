import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_alert.service.dart';
import 'package:sagae/core/widgets/sagae_widgets/sagae_button.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_http.datasource.dart';
import 'package:sagae/features/cadastro_produtor/presentation/screens/cadastro_produtor.screen.dart';

class TecnicoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SagaeButton(
            title: 'Cadastrar Paciente',
            execute: () {
              Navigator.pushNamed(context, CadastroProdutor.ROUTE_NAME);
            },
          ),
          SagaeButton(
            title: '   Enviar Cadastros     ',
            execute: () async {
              sl<LoadingStore>().isLoading = true;
              final bool cadastroSalvo =
                  await sl<ProdutorRuralHttpDatasource>().enviarCadastros();
              if (cadastroSalvo) {
                sl<LoadingStore>().isLoading = false;
                sl<DgAlertService>().alert(context,
                    msg: 'Cadastros enviados com sucesso', loggIt: true);
              } else {
                sl<DgAlertService>().alert(context,
                    msg: 'Houve algum erro no envio, tente novamente',
                    loggIt: true);
              }
              sl<LoadingStore>().isLoading = false;
            },
          )
        ],
      ),
    );
  }
}
