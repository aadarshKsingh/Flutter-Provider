import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Counter())
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Provider Example"),
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

_incrementCount(BuildContext context) {
  Provider.of<Counter>(context, listen: false).incrementCounter();
}

class _HomePageState extends State<HomePage> {
  int _count;

  @override
  Widget build(BuildContext context) {
    print("<=====widget rebuilt=====>");
    _count = Provider.of<Counter>(context, listen: false).getCounter;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("You have pressed FAB this many times"),
        Consumer<Counter>(
          builder: (context, data, widget) => Text('${data.getCounter}'),
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {_incrementCount(context)},
        ),
      ],
    ));
  }
}
