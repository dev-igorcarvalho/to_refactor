import 'package:sagae/core/data/model/programa.entity.dart';
import 'package:sagae/core/generics/generic.snapshotFecher.dart';
import 'package:sagae/core/generics/genericSembast.datasource.dart';
import 'package:sembast/sembast.dart';

//UST: 10/08 - ProgramaSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProgramaSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProgramaSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProgramaSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProgramaSembastDatasource - id:1 - 0,5pts - Criação
class ProgramaSembastDatasource extends GenericSembastSource<ProgramaEntity>
    implements SnapshotFetcher {
  ///BOILERPLATE

  // Nome da STORE/(tabela)
  static const String STORE_NAME = 'Programa_Store';

  //instancia da STORE
  static final StoreRef<int, Map<String, dynamic>> entityStore =
      intMapStoreFactory.store(STORE_NAME);

  ProgramaSembastDatasource() : super(entityStore);

  @override
  Future<List<ProgramaEntity>> fetchAll(
      {List<String> sortParams, Map<String, dynamic> filterParams}) async {
    final snapshots = await super.fetchAllSnapshots(sortBy: sortParams);

    final result = snapshots.map((snapshot) {
      final entity = ProgramaEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    return result;
  }
}
