import 'package:mobx/mobx.dart';

part 'store.g.dart';

class MyStore = _MyStore with _$MyStore;

abstract class _MyStore with Store {
  List<int> _list = [];

  @observable
  bool isFetching = false;

  @observable
  ObservableFuture<List<int>> list;


  @action
  Future<void> fetchSomething() async {
    print('fetching...');
    toggleLoadingState(true);
    list = ObservableFuture.value(await _fetcher());

    toggleLoadingState(false);
  }

  @action
  toggleLoadingState(bool loadingState) {
    isFetching = loadingState;
  }

  Future<List<int>> _fetcher() async {
    await Future.delayed(Duration(seconds: 2));
    _list.addAll(List.generate(20, (i) => i));

    return _list;
  }
}