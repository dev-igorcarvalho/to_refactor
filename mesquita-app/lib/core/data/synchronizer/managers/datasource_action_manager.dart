import 'package:sagae/core/data/synchronizer/constants/datasource_constants.dart';
import 'package:sagae/core/data/synchronizer/dispatchers/produtor.dispatcher.dart';
import 'package:sagae/core/data/synchronizer/dispatchers/test.dispatcher.dart';
import 'package:sagae/core/data/synchronizer/interfaces/dispatcher.interface.dart';
import 'package:sagae/core/locators/service.locator.dart';

class DatasourceActionManager {
  //UST: 10/08 - DatasourceActionManager - id:11 - 2pts - Criação
  void manageActions(String ds) {
    switch (ds) {
      case PRODUTOR:
        _dispatch(sl<ProdutorDispatcher>());
        break;
      case OUTROS:
        _dispatch(sl<TestDispatcher>());
        break;
    }
  }

  void _dispatch(final Dispatcher dispatcher) {
    dispatcher.dispatch();
  }
}
