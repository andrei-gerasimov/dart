import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Животные',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Тест создания классов животных, их наследования и методов'),
    );
  }
}

class Animal {
  String name = '';
  int weight = 0;
  int height = 0;
  Animal(this.name, this.weight, this.height) {
  }
  String getInfo() => 'my animal $name weights $weight, its height is $height';
}

class DogAnimal extends Animal {
  String breed;
  DogAnimal(this.breed, name, weight, height) : super(name, weight, height);
  @override
  String getInfo() {
     return 'my dog $breed ' + super.getInfo();
  }
}

class CatAnimal extends Animal {
  String color;
  int taleLength;
  CatAnimal(this.color, this.taleLength, name, weight, height) : super(name, weight, height);
  void feed() {
    taleLength++;
  }
  @override
  String getInfo() {
    return 'cat $name tale Length is $taleLength';
  }
}

  String infoAnimal(Animal a) => a.getInfo();


  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  int fibonacci2(int n) => (n == 0 || n == 1) ? n : fibonacci2(n - 1) + fibonacci2(n - 2);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counterfib = 0;
  int _counterfib2 = 0;
  DogAnimal dog1 = DogAnimal('мопс', 'джек', 5, 10);
  CatAnimal cat1 = CatAnimal('серая ', 7, 'мурка', 5, 10);
  CatAnimal cat2 = CatAnimal('белая ', 8, 'мурзик', 3, 5);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      _counterfib = fibonacci(_counter);
      _counterfib2 = fibonacci2(_counter);
      if (_counter % 3 == 2) { cat2.feed(); };
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Text(
              'Число Фибоначчи кликнутого:',
            ),
            Text(
              'First func = $_counterfib, Second func = $_counterfib2',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Первая собака :' + dog1.getInfo(),
            ),
            Text(
              'Первый кот :' + cat1.getInfo(),
            ),
            Text(
              'Второй кот :' + cat2.getInfo(),
            ),
            Text(
              'Все животные: ' + infoAnimal(dog1) + ', ' + infoAnimal(cat1) + ', ' + infoAnimal(cat2),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        //focusColor: Colors.red,
        //backgroundColor: Colors.green,
        //foregroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
