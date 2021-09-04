import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:sagae/core/data/synchronizer/managers/datasource_action_manager.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatasourceSynchronizer {
  final bool _debugMe = true;

  //UST: 10/08 - DatasourceSynchronizer - id:11 - 2pts - Criação
  Future synchronize() async {
    final bool isConnected = await DataConnectionChecker().hasConnection;
    sl<DgLoggerService>().loggIt(
        msg: 'Conection Status: $isConnected',
        caller: 'DatasourceSynchronizer',
        active: _debugMe);
    if (isConnected) {
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        // ignore: avoid_function_literals_in_foreach_calls
        prefs.getStringList(DATASORUCE_SYNC).forEach((datasource) {
          sl<DatasourceActionManager>().manageActions(datasource);
        });
      } catch (e) {
        sl<DgLoggerService>().loggIt(
          msg: 'Houve algum erro: $e',
          caller: 'DatasourceSynchronizer',
        );
      }
    }
  }
}
