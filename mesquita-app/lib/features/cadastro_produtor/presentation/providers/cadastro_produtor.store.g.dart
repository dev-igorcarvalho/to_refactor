// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_produtor.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroProdutorStore on _CadastroProdutorStore, Store {
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_CadastroProdutorStore.isLoading'))
          .value;

  final _$_isLoadingAtom = Atom(name: '_CadastroProdutorStore._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$vacinasAtom = Atom(name: '_CadastroProdutorStore.vacinas');

  @override
  ObservableList<TipoVacinaEntity> get vacinas {
    _$vacinasAtom.reportRead();
    return super.vacinas;
  }

  @override
  set vacinas(ObservableList<TipoVacinaEntity> value) {
    _$vacinasAtom.reportWrite(value, super.vacinas, () {
      super.vacinas = value;
    });
  }

  final _$gruposAtom = Atom(name: '_CadastroProdutorStore.grupos');

  @override
  ObservableList<GrupoEntity> get grupos {
    _$gruposAtom.reportRead();
    return super.grupos;
  }

  @override
  set grupos(ObservableList<GrupoEntity> value) {
    _$gruposAtom.reportWrite(value, super.grupos, () {
      super.grupos = value;
    });
  }

  final _$doseAtom = Atom(name: '_CadastroProdutorStore.dose');

  @override
  ObservableList<DoseEntity> get dose {
    _$doseAtom.reportRead();
    return super.dose;
  }

  @override
  set dose(ObservableList<DoseEntity> value) {
    _$doseAtom.reportWrite(value, super.dose, () {
      super.dose = value;
    });
  }

  final _$lotesAtom = Atom(name: '_CadastroProdutorStore.lotes');

  @override
  ObservableList<LoteEntity> get lotes {
    _$lotesAtom.reportRead();
    return super.lotes;
  }

  @override
  set lotes(ObservableList<LoteEntity> value) {
    _$lotesAtom.reportWrite(value, super.lotes, () {
      super.lotes = value;
    });
  }

  final _$categoriasAtom = Atom(name: '_CadastroProdutorStore.categorias');

  @override
  ObservableList<CategoriaPacienteEntity> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(ObservableList<CategoriaPacienteEntity> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  final _$loadDropDownListsAsyncAction =
      AsyncAction('_CadastroProdutorStore.loadDropDownLists');

  @override
  Future<dynamic> loadDropDownLists() {
    return _$loadDropDownListsAsyncAction.run(() => super.loadDropDownLists());
  }

  final _$loadGrupoByCategoriaAsyncAction =
      AsyncAction('_CadastroProdutorStore.loadGrupoByCategoria');

  @override
  Future<dynamic> loadGrupoByCategoria({String nome}) {
    return _$loadGrupoByCategoriaAsyncAction
        .run(() => super.loadGrupoByCategoria(nome: nome));
  }

  final _$loadLoteByLaboratorioAsyncAction =
      AsyncAction('_CadastroProdutorStore.loadLoteByLaboratorio');

  @override
  Future<dynamic> loadLoteByLaboratorio({String nome}) {
    return _$loadLoteByLaboratorioAsyncAction
        .run(() => super.loadLoteByLaboratorio(nome: nome));
  }

  final _$_loadDoseAsyncAction =
      AsyncAction('_CadastroProdutorStore._loadDose');

  @override
  Future<dynamic> _loadDose() {
    return _$_loadDoseAsyncAction.run(() => super._loadDose());
  }

  final _$_loadLoteAsyncAction =
      AsyncAction('_CadastroProdutorStore._loadLote');

  @override
  Future<dynamic> _loadLote() {
    return _$_loadLoteAsyncAction.run(() => super._loadLote());
  }

  final _$_loadTipoVacinaAsyncAction =
      AsyncAction('_CadastroProdutorStore._loadTipoVacina');

  @override
  Future<dynamic> _loadTipoVacina() {
    return _$_loadTipoVacinaAsyncAction.run(() => super._loadTipoVacina());
  }

  final _$_loadCategoriasAsyncAction =
      AsyncAction('_CadastroProdutorStore._loadCategorias');

  @override
  Future<dynamic> _loadCategorias() {
    return _$_loadCategoriasAsyncAction.run(() => super._loadCategorias());
  }

  @override
  String toString() {
    return '''
vacinas: ${vacinas},
grupos: ${grupos},
dose: ${dose},
lotes: ${lotes},
categorias: ${categorias},
isLoading: ${isLoading}
    ''';
  }
}
