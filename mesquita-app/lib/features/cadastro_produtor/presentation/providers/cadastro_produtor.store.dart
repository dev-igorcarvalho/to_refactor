import 'package:mobx/mobx.dart';
import 'package:sagae/core/locators/service.locator.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/categoria_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/grupo_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/produtor_rural_http.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/datasource/tipo_vacina_sembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/categoria.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/grupo.entity.dart';
import 'package:sagae/features/cadastro_produtor/data/model/tipo_vacina.entity.dart';

part 'cadastro_produtor.store.g.dart';

// This is the class used by rest of your codebase
class CadastroProdutorStore extends _CadastroProdutorStore
    with _$CadastroProdutorStore {
  CadastroProdutorStore(ProdutorRuralHttpDatasource dataSource)
      : super(dataSource);
}

// The store-class
abstract class _CadastroProdutorStore with Store {
  _CadastroProdutorStore(this.dataSource);

  //@observalbe
  //@computed
  //@action

  final ProdutorRuralHttpDatasource dataSource;

  //UST: 10/08 - CadastroProdutorStore - id:NA - 0,5pts - Criação
  @observable
  bool _isLoading = false;

  //UST: 10/08 - CadastroProdutorStore - id:NA - 0,5pts - Criação
  @computed
  bool get isLoading => _isLoading;

  @observable
  ObservableList<TipoVacinaEntity> vacinas;

  @observable
  ObservableList<GrupoEntity> grupos;

  @observable
  ObservableList<CategoriaPacienteEntity> categorias;

  //UST: 10/08 - CadastroProdutorStore - id:NA - 0,5pts - Criação
  @action
  Future loadDropDownLists() async {
    _isLoading = true;
    await _loadCategorias();
    await _loadTipoVacina();
    _isLoading = false;
  }

  //UST: 10/08 - CadastroProdutorStore - id:12 - 2pts - Criação
  @action
  Future loadGrupoByCategoria({String nome}) async {
    _isLoading = true;
    final Map<String, dynamic> filter = {
      'categoria': nome,
    };
    final List<GrupoEntity> result = await sl<GrupoSembastDatasource>()
        .fetchAll(sortParams: ['nome'], filterParams: filter);
    grupos = ObservableList.of(result);
    _isLoading = false;
  }

  //UST: 14/09 - CadastroProdutorStore - id:11 - 2pts - Criação
  @action
  Future _loadTipoVacina() async {
    final List<TipoVacinaEntity> result =
        await sl<TipoVacinaSembastDatasource>().fetchAll(sortParams: ['nome']);
    vacinas = ObservableList.of(result);
  }

  //UST: 14/09 - CadastroProdutorStore - id:11 - 2pts - Criação
  @action
  Future _loadCategorias() async {
    final List<CategoriaPacienteEntity> result =
        await sl<CategoriaSembastDatasource>().fetchAll(sortParams: ['nome']);
    categorias = ObservableList.of(result);
  }
}
