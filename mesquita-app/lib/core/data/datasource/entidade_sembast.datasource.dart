import 'package:sagae/core/data/model/entidade.entity.dart';
import 'package:sagae/core/generics/generic.snapshotFecher.dart';
import 'package:sagae/core/generics/genericSembast.datasource.dart';
import 'package:sembast/sembast.dart';

//UST: 25/08 - EntidadeEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - EntidadeEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - EntidadeEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - EntidadeEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 25/08 - EntidadeEntitySembastDatasource - id:1 - 0,5pts - Criação
class EntidadeSembastDatasource extends GenericSembastSource<EntidadeEntity>
    implements SnapshotFetcher {
  ///BOILERPLATE

  // Nome da STORE/(tabela)
  static const String STORE_NAME = 'Entidade_Store';

  //instancia da STORE
  static final StoreRef<int, Map<String, dynamic>> entityStore =
      intMapStoreFactory.store(STORE_NAME);

  EntidadeSembastDatasource() : super(entityStore);

  @override
  Future<List<EntidadeEntity>> fetchAll(
      {List<String> sortParams, Map<String, dynamic> filterParams}) async {
    final snapshots = await super
        .fetchAllSnapshots(sortBy: sortParams, filterBy: filterParams);

    final result = snapshots.map((snapshot) {
      final entity = EntidadeEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    return result;
  }
}
