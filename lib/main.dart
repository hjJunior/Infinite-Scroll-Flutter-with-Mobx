import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_infinite_scroll/store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MyStore store = MyStore();
  ScrollController _scrollController;

  @override
  void initState() {
    store.fetchSomething();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final maxPosition = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      final positionToLoadMore = maxPosition - 200;

      if (currentPosition >= positionToLoadMore && !store.isFetching) {
        store.fetchSomething();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InfiniteScroll'),
      ),
      body: Observer(
        builder: (_) {
          final lenghtItems = store.list?.result?.length ?? 0;
          final isLoading = store.isFetching;

          return ListView.builder(
              controller: _scrollController,
              itemCount: lenghtItems + (isLoading ? 1 : 0),
              itemBuilder: (_, index) {
                final isIndexForLoadingWidget = lenghtItems == index;

                if (isIndexForLoadingWidget) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return ListTile(
                  title: Text('Item on $index'),
                );
              });
        },
      ),
    );
  }
}
