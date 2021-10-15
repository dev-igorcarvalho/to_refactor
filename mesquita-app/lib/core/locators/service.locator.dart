import 'package:get_it/get_it.dart';
import 'package:sagae/core/application_container/user_session.dart';
import 'package:sagae/core/data/datasource/carga_incial_http.datasource.dart';
import 'package:sagae/core/data/model/vo/usuario_autenticado.vo.dart';
import 'package:sagae/core/data/synchronizer/datasource_synchronizer.dart';
import 'package:sagae/core/data/synchronizer/dispatchers/produtor.dispatcher.dart';
import 'package:sagae/core/data/synchronizer/dispatchers/test.dispatcher.dart';
import 'package:sagae/core/data/synchronizer/managers/datasource_action_manager.dart';
import 'package:sagae/core/data/synchronizer/managers/ds_sync_list_manager.dart';
import 'package:sagae/core/locators/context.locator.dart';
import 'package:sagae/core/util/dg_alert.service.dart';
import 'package:sagae/core/util/dg_logger.service.dart';
import 'package:sagae/core/widgets/store/loading.store.dart';
import 'package:sagae/core/widgets/store/sync.store.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/categoria_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/dose_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/grupo_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/lote_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_http.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/tipo_vacina_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/repository/produtor.repository.dart';
import 'package:sagae/features/cadastro_produtor/presentation/providers/cadastro_produtor.store.dart';
import 'package:sagae/features/login/data/datasource/login_http.datasource.dart';
import 'package:sagae/features/login/data/datasource/municipio_sembast.datasource.dart';
import 'package:sagae/features/login/data/datasource/unidade_sembast.datasource.dart';
import 'package:sagae/features/login/data/datasource/user_session.datasource.dart';
import 'package:sagae/features/login/presentation/providers/login.store.dart';

/// Arquivo responsavel pela injeçao de dependencias

// cria instancia do Service Locator
final GetIt sl = GetIt.instance;

//metodo que sera chamado no main do app para iniciar o processo de injecao de dependencias
void initServiceLocator() {
  _initCore();
  _initModules();
}

void _initModules() {
  _initLoginModule();
  _initProdutorRuralModule();
}

//UST: 26/09 - service.locator -id:11 - 2pts - Criação
//UST: 22/02/2021 - service.locator -id:11 - 2pts - Edição
void _initCore() {
  sl.registerLazySingleton(
      () => UserSession(usuarioAutenticado: UsuarioAutenticadoVo()));
  sl.registerLazySingleton(() => LoadingStore());
  sl.registerLazySingleton(() => DgAlertService());
  sl.registerLazySingleton(() => DgLoggerService());
  sl.registerLazySingleton(() => SyncStore());
  sl.registerLazySingleton(() => ContextLocator());
  _initSynchronizer();
}

//UST: 26/09 - service.locator -id:11 - 2pts - Criação
void _initSynchronizer() {
  sl.registerLazySingleton(() => DatasourceSynchronizer());
  sl.registerLazySingleton(() => DatasourceActionManager());
  sl.registerLazySingleton(() => DatasourceSyncListManager());
  sl.registerFactory(() => ProdutorDispatcher());
  sl.registerFactory(() => TestDispatcher());
}

//UST: 26/09 - service.locator -id:11 - 2pts - Criação
void _initCargaInicialModule() {}

//UST: 26/09 - service.locator -id:11 - 2pts - Criação
void _initLoginModule() {
  sl.registerFactory(() => LoginHttpDatasource());
  sl.registerFactory(() => MunicipioSembastDatasource());
  sl.registerFactory(() => UnidadeSembastDatasource());
  sl.registerFactory(() => UserSessionDatasource());
  sl.registerLazySingleton(() => LoginStore(sl<LoginHttpDatasource>()));
}

//UST: 26/09 - service.locator -id:11 - 2pts - Criação

//UST: 26/09 - service.locator -id:11 - 2pts - Criação
void _initProdutorRuralModule() {
  sl.registerFactory(() => ProdutorRuralHttpDatasource());
  sl.registerFactory(() => CargaInicialHttpDatasource());
  sl.registerFactory(() => ProdutorRuralSembastDatasource());
  sl.registerFactory(() => TipoVacinaSembastDatasource());
  sl.registerFactory(() => DoseSembastDatasource());
  sl.registerFactory(() => LoteSembastDatasource());
  sl.registerFactory(() => GrupoSembastDatasource());
  sl.registerFactory(() => CategoriaSembastDatasource());
  sl.registerFactory(() => ProdutorRepository());
  sl.registerLazySingleton(
      () => CadastroProdutorStore(sl<ProdutorRuralHttpDatasource>()));
}

//UST: 26/09 - service.locator -id:11 - 2pts - Criação
