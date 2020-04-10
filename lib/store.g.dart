// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyStore on _MyStore, Store {
  final _$isFetchingAtom = Atom(name: '_MyStore.isFetching');

  @override
  bool get isFetching {
    _$isFetchingAtom.context.enforceReadPolicy(_$isFetchingAtom);
    _$isFetchingAtom.reportObserved();
    return super.isFetching;
  }

  @override
  set isFetching(bool value) {
    _$isFetchingAtom.context.conditionallyRunInAction(() {
      super.isFetching = value;
      _$isFetchingAtom.reportChanged();
    }, _$isFetchingAtom, name: '${_$isFetchingAtom.name}_set');
  }

  final _$listAtom = Atom(name: '_MyStore.list');

  @override
  ObservableFuture<List<int>> get list {
    _$listAtom.context.enforceReadPolicy(_$listAtom);
    _$listAtom.reportObserved();
    return super.list;
  }

  @override
  set list(ObservableFuture<List<int>> value) {
    _$listAtom.context.conditionallyRunInAction(() {
      super.list = value;
      _$listAtom.reportChanged();
    }, _$listAtom, name: '${_$listAtom.name}_set');
  }

  final _$fetchSomethingAsyncAction = AsyncAction('fetchSomething');

  @override
  Future<void> fetchSomething() {
    return _$fetchSomethingAsyncAction.run(() => super.fetchSomething());
  }

  final _$_MyStoreActionController = ActionController(name: '_MyStore');

  @override
  dynamic toggleLoadingState(bool loadingState) {
    final _$actionInfo = _$_MyStoreActionController.startAction();
    try {
      return super.toggleLoadingState(loadingState);
    } finally {
      _$_MyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isFetching: ${isFetching.toString()},list: ${list.toString()}';
    return '{$string}';
  }
}
