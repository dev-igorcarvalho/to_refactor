import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sagae/core/application_container/user_session.dart';
import 'package:sagae/core/constants/style_constants.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_limited_text.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_separator.dart';
import 'package:sagae/features/login/presentation/screens/tecnico_home.screen.dart';

//UST: 23/02/2021 - DetalheUsuario - id:15 - 4pts - Criação
class DetalheUsuario extends StatefulWidget {
  const DetalheUsuario({
    Key key,
  }) : super(key: key);

  @override
  _DetalheUsuarioState createState() => _DetalheUsuarioState();
}

class _DetalheUsuarioState extends State<DetalheUsuario> {
  int easterEgg;

  int randomizer() {
    final random = Random();
    return random.nextInt(101);
  }

  @override
  void initState() {
    // TODO: implement initState
    // easterEgg = 101;
    easterEgg = randomizer();
    if (easterEgg <= 50) {
      print(easterEgg);
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          easterEgg = 100;
          print(easterEgg);
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => {
          Navigator.of(context).popAndPushNamed(TecnicoHome.ROUTE_NAME),
        },
        child: Row(
          children: <Widget>[
            if (easterEgg <= 50)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  radius: 25,
                  child: Image.asset(
                    'assets/images/logo_dg.png',
                  ),
                ),
              ),
            if (easterEgg >= 51 && easterEgg != 101)
              Icon(
                Icons.account_circle,
                color: primaryColor,
                size: 60,
              ),
            const DgSeparator(spacing: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DgLimitedText(
                  sl<UserSession>().usuarioAutenticado.nome ??
                      'Nome Desconhecido',
                  caracteres: 20,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                DgLimitedText(
                  sl<UserSession>().usuarioAutenticado.cpf ??
                      'Cpf Desconhecido',
                  caracteres: 20,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                DgLimitedText(
                  sl<UserSession>().usuarioAutenticado.unidade.nome ??
                      'Unidade Desconhecido',
                  caracteres: 20,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
