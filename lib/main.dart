import 'package:flutter/material.dart';
import './basic.dart';

void main() {
  
  syntax(null);
  
  var multiplyBy100 = multiplier(by: 100);
  print('[multiplier] 3 * 100 = ${multiplyBy100(3)}');

  Mice firstMice = Peripheral.factory(model: 'G102', type: 'Mice') as Mice;
  firstMice
    ..revision = 'three sixty'
    ..color = Color.fromRGBO(0, 0, 0, 1);

  print(firstMice);
  firstMice.use();

  Keyboard keyboard =
      Peripheral.factory(model: 'Logitech', type: 'type Keyboard') as Keyboard;
  print(keyboard);
  keyboard.use();

  assert(keyboard.model == 'Logitech', 'Keyboard model should be \'Logitech\'');

  // collections
  const LIMIT = 10;
  List _list1 = [for (var i = 0; i < LIMIT; i++) i * i];

  print(_list1);
  print(_list1.reduce((value, element) => value + element));

  List _list2 = [10, ..._list1, 100];

  print(_list2);

  assert(_list1.length == LIMIT, 'MAX LENGTH = $LIMIT}');

  // map = json for sure
  Map car = {
    'brand': 'Honda',
    'model': 'Civic',
    'year_create': '1998',
    'horse_power': 91,
    'my_favourite': false,
  };

  print(car);

  car['my_favourite'] = true;

  print(car);

  Set _list = {111, 300, 0};
  _list.add(999);
  _list.add(777);
  print(_list);

  assert(_list.length == 5);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TI-81 Lysyk Yuriy',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'TI-81 Lysyk Yuriy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var sumator = new BasicClass(a: _counter, b: 1); // a + b
    print(sumator);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SUMATOR CLOCK',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '+ 1:',
            ),
            Text(
              '${sumator.sum}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add_alarm_rounded),
      ),
    );
  }
}
