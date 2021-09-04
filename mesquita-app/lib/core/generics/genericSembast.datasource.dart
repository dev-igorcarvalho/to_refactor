import 'package:flutter/foundation.dart';
import 'package:sagae/core/generics/generic.entity.dart';
import 'package:sagae/core/locators/sembastDatabase.locator.dart';
import 'package:sembast/sembast.dart';

class GenericSembastSource<T extends GenericEntity> {
  GenericSembastSource(this._entityStore);

  // Store com chave `int` e valores `Map<String, dynamic>`
  //Funciona como um map persistido, e recebe valores do GenericEntity T convertidos em Map
  final StoreRef<int, Map<String, dynamic>> _entityStore;

  // Getter da instancia singleton da BD aberta
  Future<Database> get _db async => SembastDatabaseLocator.instance.database;

  Future insert(T entity) async {
    await _entityStore.add(await _db, entity.toJsonMap());
  }

  Future<int> insertAndReturn(T entity) async {
    return _entityStore.add(await _db, entity.toJsonMap());
  }

  Future<List<int>> insertMany(List<T> entities) async {
    return _entityStore.addAll(
        await _db, entities.map((e) => e.toJsonMap()).toList());
  }

  Future<int> update(T entity) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(entity.keyRef));
    return _entityStore.update(
      await _db,
      entity.toJsonMap(),
      finder: finder,
    );
  }

  Future<int> delete(T entity) async {
    final finder = Finder(filter: Filter.byKey(entity.keyRef));
    return _entityStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<int> deleteById(int id) async {
    final finder = Finder(filter: Filter.byKey(id));
    return _entityStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<int> deleteBy(Finder finder) async {
    return _entityStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<int> deleteAll() async {
    return _entityStore.delete(
      await _db,
    );
  }

  //TODO: Adicionar parametros de paginaçao -> start, end, limit, offset
  /*
  * Colocar generic entity pra ter um factory fromjson map
  * chamar o map na colecao de snapshot e transformar em generic entity
  * e castar apenas em quem recebe,
  * */

  Future<List<RecordSnapshot<int, Map<String, dynamic>>>> fetchAllSnapshots(
      {List<String> sortBy, Map<String, dynamic> filterBy}) async {
    final List<SortOrder> sortParams =
        sortBy?.map((e) => SortOrder(e))?.toList();
    final List<Filter> filters = [];
    filterBy?.forEach((key, value) {
      if (value != null) {
        filters.add(Filter.equals(key, value));
      }
    });

    final recordSnapshots = await _entityStore.find(
      await _db,
      finder: Finder(sortOrders: sortParams, filter: Filter.and(filters)),
    );
    return recordSnapshots;
  }

  Future<List<RecordSnapshot<int, Map<String, dynamic>>>> fetchAllCloudOrLocal(
      {List<String> sortBy,
      @required String filterField,
      @required DatasourceType dsType}) async {
    final List<SortOrder> sortParams =
        sortBy?.map((e) => SortOrder(e))?.toList();
    Filter filter;
    switch (dsType) {
      case DatasourceType.LOCAL:
        filter = Filter.isNull(filterField);
        break;
      case DatasourceType.CLOUD:
        filter = Filter.notNull(filterField);
        break;
    }

    final recordSnapshots = await _entityStore.find(
      await _db,
      finder: Finder(sortOrders: sortParams, filter: filter),
    );
    return recordSnapshots;
  }
}

enum DatasourceType { CLOUD, LOCAL }
