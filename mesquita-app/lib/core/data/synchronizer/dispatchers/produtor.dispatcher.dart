import 'package:sagae/core/data/synchronizer/constants/datasource_constants.dart';
import 'package:sagae/core/data/synchronizer/interfaces/dispatcher.interface.dart';
import 'package:sagae/core/data/synchronizer/managers/ds_sync_list_manager.dart';
import 'package:sagae/core/locators/context.locator.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_alert.service.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/core/widgets/store/sync.store.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_http.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/produtor_rural.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/repository/produtor.repository.dart';

class ProdutorDispatcher implements Dispatcher {
  //UST: 10/08 - ProdutorDispatcher - id:11 - 2pts - Criação
  //UST: 27/08 - ProdutorDispatcher - id:11 - 2pts - Ediçao - Alterao da regra de find
  //UST: 10/09 - ProdutorDispatcher - id:11 - 2pts - Ediçao - adicionando novas funcionalidades
  //UST: 22/02/2021 - ProdutorDispatcher - id:11 - 2pts - Ediçao - adicionando display sinc
  @override
  Future dispatch() async {
    sl<SyncStore>().isSync = true;
    bool success = false;
    try {
      final List<ProdutorRuralEntity> produtorList =
          await sl<ProdutorRuralSembastDatasource>()
              .buscarTodosNaoSincronizados(field: 'idPessoa');

      if (produtorList != null && produtorList.isNotEmpty) {
        success = await sl<ProdutorRuralHttpDatasource>()
            .inserirBatchProdutor(produtorList);

        sl<DgLoggerService>().loggIt(
            msg: 'Cadastro Produtor Status: $success ',
            caller: 'ProdutorDispatcher');
      }
      if (success) {
        await sl<ProdutorRuralSembastDatasource>().deletarNaoSincronizados();
        await sl<DatasourceSyncListManager>().removeFromSyncList(PRODUTOR);
        await sl<ProdutorRepository>().reloadCargaProdutores();

        sl<DgAlertService>().alert(sl<ContextLocator>().currentContext,
            msg: '${produtorList.length} produtores  foram sincronizados',
            loggIt: true);
      }
    } catch (e) {
      sl<DgLoggerService>()
          .loggIt(msg: e.toString(), caller: 'ProdutorDispatcher');
    }
    sl<SyncStore>().isSync = false;
  }
}
