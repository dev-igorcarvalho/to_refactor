import 'package:mobx/mobx.dart';

part 'loading.store.g.dart';

// This is the class used by rest of your codebase
class LoadingStore extends _LoadingStore with _$LoadingStore {
  LoadingStore();
}

// The store-class
abstract class _LoadingStore with Store {
  _LoadingStore();

  //UST: 10/08 - LoadingStore -id:NA - 0,5pts - Criação
  @observable
  bool isLoading = false;
}
