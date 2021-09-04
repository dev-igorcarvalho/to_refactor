import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_animated_loading.dart';
import 'package:sagae/features/login/presentation/providers/login.store.dart';

import 'login_form.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({@required this.tipoUsuario});

  final String tipoUsuario;

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => DgAnimatedLoading(
        isLoading: sl<LoginStore>().isLoading,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: LoginForm()),
      ),
    );
  }
}
