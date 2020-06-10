import 'package:flutter/material.dart';
import 'package:counterappblock/src/blocs/counter_bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<int>(
          stream: counterBloc.pressedCount,
          builder: (context, snapshot) {
            return Text(
              'You have pushed this button ${snapshot.data.toString()} times',
            );
          },// builder
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You\'ve pushed this button many times:',
            ),
            StreamBuilder<int>(
                stream: counterBloc.pressedCount,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data.toString()}',
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                }),
            SizedBox(
              height: 20.0,
              width: 200.0,
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
                    color: Colors.greenAccent, // button color
                    textColor: Colors.black, // button text color
                    child: Text("increase"), // button text
                    onPressed: () {
                      counterBloc.incrementCounter.add('increment');
                    }, // onPressed()
                  ),
                ),

                //decrement button
                Container(
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    color: Colors.yellowAccent, // button color
                    textColor: Colors.black, // button text color
                    child: Text("decrease"), // button text
                    onPressed: () {
                      counterBloc.incrementCounter.add('decrement');
                    }, // onPressed()
                  ),
                ),

                //set zero button
                Container(
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    color: Colors.redAccent, // button color
                    textColor: Colors.black, // button text color
                    child: Text("set zero"), // button text
                    onPressed: () {
                      counterBloc.incrementCounter.add('zero');
                    }, // onPressed()
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
