import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagae/core/widgets/sagae_widgets/layout_padrao.dart';
import 'package:sagae/features/login/presentation/widgets/home_body.dart';

//UST: 19/07 - HomeScreen - id:21 - 9pts - Criação
class HomeScreen extends StatelessWidget {
  static const ROUTE_NAME = "/home";

  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      pageTitle: 'EMPAER',
      body: HomeBody(), // alterar direto pra login do tecnico
    );
  }
}
