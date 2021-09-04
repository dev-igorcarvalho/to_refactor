import 'package:flutter/cupertino.dart';
import 'package:sagae/core/generics/generic.snapshotFecher.dart';
import 'package:sagae/core/generics/genericSembast.datasource.dart';
import 'package:sagae/features/cadastro_produtor/data/model/produtor_rural.entity.dart';
import 'package:sembast/sembast.dart';

//UST: 10/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
//UST: 10/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação

class ProdutorRuralSembastDatasource
    extends GenericSembastSource<ProdutorRuralEntity>
    implements SnapshotFetcher {
  ///BOILERPLATE

  // Nome da STORE/(tabela)
  static const String STORE_NAME = 'Produtor_Store';

  //instancia da STORE
  static final StoreRef<int, Map<String, dynamic>> entityStore =
      intMapStoreFactory.store(STORE_NAME);

  ProdutorRuralSembastDatasource() : super(entityStore);

  @override
  Future<List<ProdutorRuralEntity>> fetchAll(
      {List<String> sortParams, Map<String, dynamic> filterParams}) async {
    final snapshots = await super
        .fetchAllSnapshots(sortBy: sortParams, filterBy: filterParams);

    final result = snapshots.map((snapshot) {
      final entity = ProdutorRuralEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    return result;
  }

  //UST: 27/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
  Future<ProdutorRuralEntity> fetchByCpf(String cpf) async {
    final snapshots = await super.fetchAllSnapshots(filterBy: {'cpf': cpf});
    final result = snapshots.map((snapshot) {
      final entity = ProdutorRuralEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    if (result != null && result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  //UST: 27/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
  Future<List<ProdutorRuralEntity>> buscarTodosNaoSincronizados(
      {@required String field, List<String> sortParams}) async {
    final snapshots = await super.fetchAllCloudOrLocal(
        sortBy: sortParams, filterField: field, dsType: DatasourceType.LOCAL);

    final result = snapshots.map((snapshot) {
      final entity = ProdutorRuralEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    return result;
  }

  //UST: 27/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
  Future<List<ProdutorRuralEntity>> buscarTodosSincronizados(
      {List<String> sortParams}) async {
    final snapshots = await super.fetchAllCloudOrLocal(
        sortBy: sortParams,
        filterField: 'idPessoa',
        dsType: DatasourceType.CLOUD);

    final result = snapshots.map((snapshot) {
      final entity = ProdutorRuralEntity.fromJsonMap(snapshot.value);
      // An ID is a key of a record from the database.
      entity.keyRef = snapshot.key;
      return entity;
    }).toList();
    return result;
  }

  //UST: 27/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
  Future<int> deletarNaoSincronizados() {
    final Finder finder = Finder(filter: Filter.isNull('idPessoa'));
    return super.deleteBy(finder);
  }

  //UST: 27/08 - ProdutorRuralSembastDatasource - id:1 - 0,5pts - Criação
  Future<int> deletarSincronizados() {
    final Finder finder = Finder(filter: Filter.notNull('idPessoa'));
    return super.deleteBy(finder);
  }
}
