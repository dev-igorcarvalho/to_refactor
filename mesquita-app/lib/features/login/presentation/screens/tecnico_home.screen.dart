import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sagae/core/widgets/sagae_widgets/layout_padrao.dart';
import 'package:sagae/core/widgets/sagae_widgets/sidebar.dart';
import 'package:sagae/features/login/presentation/widgets/tecnico_body.dart';

//UST: 25/07 - TecnicoHome - id:21 - 9pts - Criação
class TecnicoHome extends StatelessWidget {
  static const ROUTE_NAME = "/homeTecnico";

  const TecnicoHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutPadrao(
      pageTitle: 'Menu',
      homeButton: true,
      menu: SideBar(),
      body: TecnicoBody(),
    );
  }
}
