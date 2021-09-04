import 'package:mobx/mobx.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/features/login/data/datasource/login_http.datasource.dart';
import 'package:sagae/features/login/data/datasource/municipio_sembast.datasource.dart';
import 'package:sagae/features/login/data/datasource/unidade_sembast.datasource.dart';
import 'package:sagae/features/login/data/model/municipio.entity.dart';
import 'package:sagae/features/login/data/model/unidade.entity.dart';

part 'login.store.g.dart';

// This is the class used by rest of your codebase
class LoginStore extends _LoginStore with _$LoginStore {
  LoginStore(LoginHttpDatasource dataSource) : super(dataSource);
}

// The store-class
abstract class _LoginStore with Store {
  _LoginStore(this.dataSource);

  //UST: 10/08 - LoginStore - id:NA - 0,5pts - Criação
  @observable
  bool isLoading = false;

  final LoginHttpDatasource dataSource;

  @observable
  ObservableList<MunicipioEntity> municipios;

  @observable
  ObservableList<UnidadeEntity> unidades;

  //UST: 10/08 - CadastroProdutorStore - id:NA - 0,5pts - Criação
  @action
  Future loadDropDownLists() async {
    isLoading = true;
    await _loadMunicipios();
    isLoading = false;
  }

  //UST: 14/09 - CadastroProdutorStore - id:11 - 2pts - Criação
  @action
  Future _loadMunicipios() async {
    final List<MunicipioEntity> result =
        await sl<MunicipioSembastDatasource>().fetchAll(sortParams: ['nome']);
    municipios = ObservableList.of(result);
  }

  //UST: 10/08 - CadastroProdutorStore - id:12 - 2pts - Criação
  @action
  Future loadUnidadeByMunicipio({String nome}) async {
    isLoading = true;
    final Map<String, dynamic> filter = {
      'municipio': nome,
    };
    final List<UnidadeEntity> result = await sl<UnidadeSembastDatasource>()
        .fetchAll(sortParams: ['nome'], filterParams: filter);
    unidades = ObservableList.of(result);
    isLoading = false;
  }
}
