import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: MaterialApp(
        title: "Provider Example",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Provider Example"),
            ),
            body: MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _myVar;
  _incrementCounter() {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    _myVar = Provider.of<Counter>(context).getCounter;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You have pushed the button this many times"),
          Text(_myVar.toString(), style: Theme.of(context).textTheme.headline4),
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: Icon(Icons.plus_one_rounded),
          )
        ],
      ),
    );
  }
}
