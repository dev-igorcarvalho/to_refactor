import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sagae/core/constants/style_constants.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_animated_loading.dart';
import 'package:sagae/core/widgets/sagae_widgets/sagae_header_title.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';
import 'package:sagae/features/login/presentation/screens/tecnico_home.screen.dart';

import 'footer.dart';

//UST: 10/08 - LayoutPadrao - id:15 - 4pts - Criação
//UST: 19/02/2021 - LayoutPadrao - id:15 - 4pts - Modificação
// ignore: must_be_immutable
class LayoutPadrao extends StatelessWidget {
  LayoutPadrao({
    Key key,
    @required this.body,
    @required this.pageTitle,
    this.homeButton,
    this.menu,
  }) : super(key: key);

  final Widget body;
  final Widget menu;
  final String pageTitle;
  final bool homeButton;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //final bool _debugMe = true;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => DgAnimatedLoading(
        isLoading: sl<LoadingStore>().isLoading,
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: primaryColor,
              leading: homeButton == true
                  ? IconButton(
                      icon: Icon(
                        Icons.home,
                        color: backgroundColor,
                        size: 50.0,
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(
                          context,
                          TecnicoHome.ROUTE_NAME,
                        );
                      },
                    )
                  : const Icon(null),
              title: SagaeHeaderTitle(title: pageTitle),
              actions: <Widget>[
                if (menu != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: backgroundColor,
                        size: 50.0,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  )
                else
                  const Icon(null)
              ],
            ),
            body: body,
            drawer: menu,
            drawerEnableOpenDragGesture: false,
            bottomNavigationBar: Footer()),
      ),
    );
  }
}
