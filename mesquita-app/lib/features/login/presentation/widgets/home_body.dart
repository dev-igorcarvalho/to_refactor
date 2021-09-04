import 'package:flutter/material.dart';
import 'package:sagae/core/widgets/sagae_widgets/botao_empaer.dart';
import 'package:sagae/features/login/presentation/screens/login_tecnico.screen.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Expanded(
            flex: 5,
            child: BotaoEmpaer(
              'assets/images/home-brand.png',
            )),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: const <Widget>[
                BotaoEmpaer(
                  'assets/images/tecnico-card.png',
                  popPush: true,
                  route: LoginTecnico.ROUTE_NAME,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
