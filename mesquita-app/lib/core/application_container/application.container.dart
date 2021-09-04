import 'package:flutter/material.dart';
import 'package:sagae/core/data/synchronizer/datasource_synchronizer.dart';
import 'package:sagae/core/locators/context.locator.dart';
import 'package:sagae/core/locators/routes.locator.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';

class ApplicationContainer extends StatefulWidget {
  @override
  _ApplicationContainerState createState() => _ApplicationContainerState();
}

class _ApplicationContainerState extends State<ApplicationContainer>
    with WidgetsBindingObserver {
  final _debugMe = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //UST: 26/09 - ApplicationContainer -id:11 - 2pts - Criação
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        sl<LoadingStore>().isLoading = true;
        sl<DatasourceSynchronizer>().synchronize();
        sl<LoadingStore>().isLoading = false;
        sl<DgLoggerService>().loggIt(
            msg: 'main_trhead: app in resumed',
            caller: 'LayoutPadrao',
            active: _debugMe);
        break;
      case AppLifecycleState.inactive:
        sl<DgLoggerService>().loggIt(
            msg: 'main_trhead: app in inactive',
            caller: 'LayoutPadrao',
            active: _debugMe);
        break;
      case AppLifecycleState.paused:
        //Roda apenas serviços de background
        sl<DgLoggerService>().loggIt(
            msg: 'main_trhead: app in paused',
            caller: 'LayoutPadrao',
            active: _debugMe);
        break;
      case AppLifecycleState.detached:
        sl<DgLoggerService>().loggIt(
            msg: 'main_trhead: app in detached',
            caller: 'LayoutPadrao',
            active: _debugMe);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      navigatorKey: sl<ContextLocator>().navigatorKey,
      routes: RoutesLocator.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
