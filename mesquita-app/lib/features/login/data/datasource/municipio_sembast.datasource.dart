import 'package:sagae/core/generics/generic.snapshotFecher.dart';
import 'package:sagae/core/generics/genericSembast.datasource.dart';
import 'package:sagae/features/login/data/model/municipio.entity.dart';
import 'package:sembast/sembast.dart';

//UST: 10/08 - CategoriaEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - CategoriaEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - CategoriaEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - CategoriaEntitySembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - CategoriaEntitySembastDatasource - id:1 - 0,5pts - Criação

class MunicipioSembastDatasource extends GenericSembastSource<MunicipioEntity>
    implements SnapshotFetcher {
  ///BOILERPLATE

  // Nome da STORE/(tabela)
  static const String STORE_NAME = 'municipio_store';

  //instancia da STORE
  static final StoreRef<int, Map<String, dynamic>> entityStore =
      intMapStoreFactory.store(STORE_NAME);

  MunicipioSembastDatasource() : super(entityStore);

  @override
  Future<List<MunicipioEntity>> fetchAll(
      {List<String> sortParams, Map<String, dynamic> filterParams}) async {
    final snapshots = await super
        .fetchAllSnapshots(sortBy: sortParams, filterBy: filterParams);

    final result = snapshots.map((snapshot) {
      final entity = MunicipioEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    return result;
  }
}
