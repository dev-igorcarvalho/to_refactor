import 'package:flutter/material.dart';
import 'package:sagae/core/constants/style_constants.dart';
import 'package:sagae/core/data/datasource/carga_incial_http.datasource.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/widgets/sagae_widgets/sagae_button.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';
import 'package:sagae/features/login/data/datasource/user_session.datasource.dart';
import 'package:sagae/features/login/presentation/screens/login_tecnico.screen.dart';

import 'detalhe_usuario.dart';

//UST: 10/08 - TecnicoSideBar - id:21 - 9pts - Criação
//UST: 23/02/2021 - TecnicoSideBar - id:21 - 9pts - Edição
class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DrawerHeader(child: DetalheUsuario()),
          SagaeButton(
            color: backgroundColor,
            title: 'Atualizar Dependências',
            execute: () async {
              sl<LoadingStore>().isLoading = true;
              await sl<CargaInicialHttpDatasource>().updateCargaInicial();
              sl<LoadingStore>().isLoading = false;
            },
          ),
          SagaeButton(
            color: backgroundColor,
            title: 'Sair',
            execute: () {
              sl<UserSessionDatasource>().removeUsuarioSessao();
              Navigator.of(context).popAndPushNamed(LoginTecnico.ROUTE_NAME);
            },
          )
        ],
      ),
    ));
  }
}
