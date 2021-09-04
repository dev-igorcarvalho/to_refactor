// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SyncStore on _SyncStore, Store {
  final _$isSyncAtom = Atom(name: '_SyncStore.isSync');

  @override
  bool get isSync {
    _$isSyncAtom.reportRead();
    return super.isSync;
  }

  @override
  set isSync(bool value) {
    _$isSyncAtom.reportWrite(value, super.isSync, () {
      super.isSync = value;
    });
  }

  @override
  String toString() {
    return '''
isSync: ${isSync}
    ''';
  }
}
