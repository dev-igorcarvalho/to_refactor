import 'package:http/http.dart' as http_service;
import 'package:sagae/core/constants/shared_prefs_constants.dart';
import 'package:sagae/core/data/datasource/dado_entrada_sembast.datasource.dart';
import 'package:sagae/core/data/datasource/entidade_sembast.datasource.dart';
import 'package:sagae/core/data/datasource/grupo_entrada_sembast.datasource.dart';
import 'package:sagae/core/data/datasource/medida_sembast.datasource.dart';
import 'package:sagae/core/data/datasource/orientacao_sembast.datasource.dart';
import 'package:sagae/core/data/datasource/produto_sembast.datasource.dart';
import 'package:sagae/core/data/datasource/unidade_producao_sembast.datasource.dart';
import 'package:sagae/core/data/model/dado_entrada.entity.dart';
import 'package:sagae/core/data/model/entidade.entity.dart';
import 'package:sagae/core/data/model/grupo_entrada.entity.dart';
import 'package:sagae/core/data/model/medida.entity.dart';
import 'package:sagae/core/data/model/produto.entity.dart';
import 'package:sagae/core/data/model/tipo_orientacao.entity.dart';
import 'package:sagae/core/data/model/unidade_producao.entity.dart';
import 'package:sagae/core/data/synchronizer/constants/datasource_constants.dart';
import 'package:sagae/core/data/synchronizer/managers/ds_sync_list_manager.dart';
import 'package:sagae/core/locators/routes.locator.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';
import 'package:sagae/core/widgets/store/sync.store.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_http.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/produtor_rural.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future verificarProdutoresNaoSincronizados() async {
  final List<ProdutorRuralEntity> list =
      await sl<ProdutorRuralSembastDatasource>()
          .buscarTodosNaoSincronizados(field: 'idPessoa');
  sl<DgLoggerService>().loggIt(
    msg: list.length,
    caller: 'DebugRoom : verificarProdutoresNaoSincronizados()',
  );
}

Future verificarProdutoresSincronizados() async {
  final List<ProdutorRuralEntity> list =
      await sl<ProdutorRuralSembastDatasource>()
          .buscarTodosSincronizados(sortParams: ['nome']);
  sl<DgLoggerService>().loggIt(
    msg: list.length,
    caller: 'DebugRoom : verificarProdutoresSincronizados()',
  );
}

Future removerProdutoresLocais() async {
  await sl<ProdutorRuralSembastDatasource>().deleteAll();
}

Future tokenTest() async {
  sl<LoadingStore>().isLoading = true;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.get(AUTH_TOKEN) as String;
  sl<DgLoggerService>().loggIt(
    msg: token,
    caller: 'CadastroProdutorForm',
  );
  final response = await http_service
      .get('${RoutesLocator.getApiUri()}/token', headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  });
  sl<DgLoggerService>()
      .loggIt(msg: response.statusCode, caller: 'CadastroProdutorForm');
  sl<LoadingStore>().isLoading = false;
}

Future testUtf8() async {
  sl<LoadingStore>().isLoading = true;
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.get(AUTH_TOKEN) as String;
  final response = await http_service
      .get('${RoutesLocator.getApiUri()}/municipio', headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Content-Language': 'pt-BR',
    'Authorization': 'Bearer $token',
  });
  // final String bodyDecoded = utf8.decode(response.bodyBytes);
  //final jsonmaped = json.decode(bodyDecoded);
  sl<DgLoggerService>().loggIt(
    msg: response.statusCode,
    caller: 'DebugRoom : testUtf8()',
  );
  sl<LoadingStore>().isLoading = false;
}

Future isCargaNecessaria() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey(CARGA_INICIAL)) {
    sl<DgLoggerService>().loggIt(
      msg: 'Carga necessária: ${prefs.get('cargaInicialNecessaria')}',
      caller: 'DebugRoom : checkCargaInicial()',
    );
  }
}

Future showSyncList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final list = prefs.get(DATASORUCE_SYNC);
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${list.length} | Lista: $list',
    caller: 'DebugRoom : showSyncList()',
  );
}

Future testSyncAlert() async {
  sl<SyncStore>().isSync = true;
  await Future.delayed(
    const Duration(seconds: 2),
  );
  sl<SyncStore>().isSync = false;
  print(sl<SyncStore>().isSync);
}

Future colocarProdutorNaListaDeSync() async {
  await sl<DatasourceSyncListManager>().addToSyncList(PRODUTOR);
}

Future colocarTestNaListaDeSync() async {
  await sl<DatasourceSyncListManager>().addToSyncList(OUTROS);
}

Future removerProdutorDaListaDeSync() async {
  await sl<DatasourceSyncListManager>().removeFromSyncList(PRODUTOR);
}

Future grupoEntradaLenght({int grupoId}) async {
  final List<GrupoEntradaEntity> result =
      await sl<GrupoEntradaSembastDatasource>().fetchAll(
          sortParams: ['descricao'],
          filterParams: {'idGrupoEntradaPai': grupoId});
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${result.length} | Lista: ${result.first.idGrupoEntradaPai}',
    caller: 'DebugRoom : grupoEntradaLenght()',
  );
}

Future checkProdutos({int dadoId}) async {
  final List<ProdutoEntity> result = await sl<ProdutoSembastDatasource>()
      .fetchAll(
          sortParams: ['descricao'], filterParams: {'idDadoEntrada': dadoId});
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${result.length} | Lista: ${result.length}',
    caller: 'DebugRoom : checkProdutos()',
  );
}

Future checkDadoEntrada() async {
  final List<DadoEntradaEntity> result =
      await sl<DadoEntradaSembastDatasource>()
          .fetchAll(sortParams: ['descricao']);
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${result.length} | Lista: $result',
    caller: 'DebugRoom : checkProdutos()',
  );
}

Future checkOrientacaoList() async {
  final List<TipoOrientacaoEntity> result =
      await sl<OrientacaoSembastDatasource>()
          .fetchAll(sortParams: ['descricao']);
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${result.length} | Lista: $result',
    caller: 'DebugRoom : checkProdutos()',
  );
}

Future checkProdutoresListaOnline() async {
  sl<LoadingStore>().isLoading = true;
  final json = await sl<ProdutorRuralHttpDatasource>().fetchAll();
  sl<DgLoggerService>().loggIt(
    msg: json,
    caller: 'CadastroProdutorHttpDatasource',
  );
  sl<LoadingStore>().isLoading = false;
}

Future checkMedidasSembast() async {
  final List<MedidaEntity> medidas =
      await sl<MedidaSembastDatasource>().fetchAll();
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${medidas.length} | Lista: $medidas',
    caller: 'DebugRoom : checkMedidasSembast()',
  );
}

Future checkEntidadeSembast(int idMunicipio) async {
  final List<EntidadeEntity> findOne = await sl<EntidadeSembastDatasource>()
      .fetchAll(
          sortParams: ['descricao'],
          filterParams: {'idMunicipio': idMunicipio});
  final List<EntidadeEntity> findAll =
      await sl<EntidadeSembastDatasource>().fetchAll();

  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${findOne.length} | Lista: $findOne',
    caller: 'DebugRoom : checkMedidasSembast()',
  );
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${findAll.length} | Lista: $findAll',
    caller: 'DebugRoom : checkMedidasSembast()',
  );
}

Future checkIndicadorCadeiaLeiteList() async {
  final List<TipoOrientacaoEntity> result =
      await sl<OrientacaoSembastDatasource>()
          .fetchAll(sortParams: ['descricao']);
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${result.length} | Lista: $result',
    caller: 'DebugRoom : checkIndicadorCadeiaLeiteList()',
  );
}

Future exibirUnidadeProducao() async {
  final List<UnidadeProducaoEntity> result =
      await sl<UnidadeProducaoSembastDatasource>().fetchAll();
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${result.length} | Lista: $result',
    caller: 'DebugRoom : exibirUnidadeProducao()',
  );
}

Future testeStressUnidadeProducao() async {
  final int idMunicipio = 133;
  final List<UnidadeProducaoEntity> result =
      await sl<UnidadeProducaoSembastDatasource>().fetchAll(
          sortParams: ['unpNome'], filterParams: {'idMunicipio': idMunicipio});
  sl<DgLoggerService>().loggIt(
    msg: 'Total: ${result.length} | Lista: $result',
    caller: 'DebugRoom : exibirUnidadeProducao()',
  );
}
