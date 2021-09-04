// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$isLoadingAtom = Atom(name: '_LoginStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$municipiosAtom = Atom(name: '_LoginStore.municipios');

  @override
  ObservableList<MunicipioEntity> get municipios {
    _$municipiosAtom.reportRead();
    return super.municipios;
  }

  @override
  set municipios(ObservableList<MunicipioEntity> value) {
    _$municipiosAtom.reportWrite(value, super.municipios, () {
      super.municipios = value;
    });
  }

  final _$unidadesAtom = Atom(name: '_LoginStore.unidades');

  @override
  ObservableList<UnidadeEntity> get unidades {
    _$unidadesAtom.reportRead();
    return super.unidades;
  }

  @override
  set unidades(ObservableList<UnidadeEntity> value) {
    _$unidadesAtom.reportWrite(value, super.unidades, () {
      super.unidades = value;
    });
  }

  final _$loadDropDownListsAsyncAction =
      AsyncAction('_LoginStore.loadDropDownLists');

  @override
  Future<dynamic> loadDropDownLists() {
    return _$loadDropDownListsAsyncAction.run(() => super.loadDropDownLists());
  }

  final _$_loadMunicipiosAsyncAction =
      AsyncAction('_LoginStore._loadMunicipios');

  @override
  Future<dynamic> _loadMunicipios() {
    return _$_loadMunicipiosAsyncAction.run(() => super._loadMunicipios());
  }

  final _$loadUnidadeByMunicipioAsyncAction =
      AsyncAction('_LoginStore.loadUnidadeByMunicipio');

  @override
  Future<dynamic> loadUnidadeByMunicipio({String nome}) {
    return _$loadUnidadeByMunicipioAsyncAction
        .run(() => super.loadUnidadeByMunicipio(nome: nome));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
municipios: ${municipios},
unidades: ${unidades}
    ''';
  }
}
