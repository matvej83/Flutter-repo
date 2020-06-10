import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Counter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _setZero() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You\'ve pushed this button many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade900,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //increment button
                Container(
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    color: Colors.greenAccent, // Цвет кнопки.
                    textColor: Colors.black, // Цвет текста кнопки.
                    child: Text("increase"), // Текст кнопки.
                    onPressed: _incrementCounter,
                  ),
                ),

                //decrement button
                Container(
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    color: Colors.yellowAccent, // Цвет кнопки.
                    textColor: Colors.black, // Цвет текста кнопки.
                    child: Text("decrease"), // Текст кнопки.
                    onPressed: _decrementCounter,
                  ),
                ),

                //set zero button
                Container(
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    color: Colors.redAccent, // Цвет кнопки.
                    textColor: Colors.black, // Цвет текста кнопки.
                    child: Text("set zero"), // Текст кнопки.
                    onPressed: _setZero,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
