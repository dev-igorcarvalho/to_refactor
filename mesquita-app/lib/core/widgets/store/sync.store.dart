import 'package:mobx/mobx.dart';

part 'sync.store.g.dart';

// This is the class used by rest of your codebase
class SyncStore extends _SyncStore with _$SyncStore {
  SyncStore();
}

// The store-class
abstract class _SyncStore with Store {
  _SyncStore();

  //UST: 19/02/2021 - SyncStore -id:NA - 0,5pts - Criação
  @observable
  bool isSync = false;
}
