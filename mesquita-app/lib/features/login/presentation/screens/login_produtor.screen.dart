import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagae/core/widgets/sagae_widgets/layout_padrao.dart';
import 'package:sagae/features/login/presentation/widgets/login_body.dart';

//UST: 19/07 - LoginProdutor - id:21 - 9pts - Criação
class LoginProdutor extends StatelessWidget {
  static const ROUTE_NAME = "/loginProdutor";

  const LoginProdutor({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      pageTitle: 'Login do Produtor',
      body: const LoginBody(
        tipoUsuario: ROUTE_NAME,
      ),
    );
  }
}
