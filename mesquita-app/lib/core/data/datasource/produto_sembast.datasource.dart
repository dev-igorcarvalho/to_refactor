import 'package:sagae/core/data/model/produto.entity.dart';
import 'package:sagae/core/generics/generic.snapshotFecher.dart';
import 'package:sagae/core/generics/genericSembast.datasource.dart';
import 'package:sembast/sembast.dart';

//UST: 25/08 - ProdutoSembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - ProdutoSembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - ProdutoSembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - ProdutoSembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - ProdutoSembastDatasource - id:1 - 0,5pts - Criação
class ProdutoSembastDatasource extends GenericSembastSource<ProdutoEntity>
    implements SnapshotFetcher {
  ///BOILERPLATE

  // Nome da STORE/(tabela)
  static const String STORE_NAME = 'Produto_Store';

  //instancia da STORE
  static final StoreRef<int, Map<String, dynamic>> entityStore =
      intMapStoreFactory.store(STORE_NAME);

  ProdutoSembastDatasource() : super(entityStore);

  @override
  Future<List<ProdutoEntity>> fetchAll(
      {List<String> sortParams, Map<String, dynamic> filterParams}) async {
    final snapshots = await super
        .fetchAllSnapshots(sortBy: sortParams, filterBy: filterParams);

    final result = snapshots.map((snapshot) {
      final entity = ProdutoEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    return result;
  }
}
