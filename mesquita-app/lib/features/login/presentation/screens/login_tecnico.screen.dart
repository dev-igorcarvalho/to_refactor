import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/widgets/sagae_widgets/layout_padrao.dart';
import 'package:sagae/features/login/data/datasource/user_session.datasource.dart';
import 'package:sagae/features/login/presentation/screens/tecnico_home.screen.dart';
import 'package:sagae/features/login/presentation/widgets/login_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

//UST: 19/07 - LoginTecnico - id:21 - 9pts - Criação
class LoginTecnico extends StatefulWidget {
  //static const ROUTE_NAME = "/loginTecnico";
  static const ROUTE_NAME = "/";

  const LoginTecnico({
    Key key,
  }) : super(key: key);

  @override
  _LoginTecnicoState createState() => _LoginTecnicoState();
}

class _LoginTecnicoState extends State<LoginTecnico> {
  @override
  void initState() {
    //TODO: melhorar metodo de verificaçao e distribuiçao de codigo
    verificarUsuarioLogado();
    super.initState();
  }

  Future verificarUsuarioLogado() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isUsuarioLogado =
        await sl<UserSessionDatasource>().isUsuarioLogado();
    if (isUsuarioLogado) {
      await Navigator.popAndPushNamed(context, TecnicoHome.ROUTE_NAME,
          arguments: prefs.get(USUARIO_LOGADO));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      pageTitle: 'Bot da Vacina',
      body: const LoginBody(
        tipoUsuario: LoginTecnico.ROUTE_NAME,
      ),
    );
  }
}
