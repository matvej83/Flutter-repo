import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBlocBloc, CounterBlocState>(
                  builder: (context, state) {
                if (state is CounterBlocInitial) {
                  return counter(context, state.initialState);
                } else if (state is CounterState) {
                  return counter(context, state.counter);
                } else {
                  return Container();
                }
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.greenAccent, // Цвет кнопки.
                        textColor: Colors.black,
                        onPressed: () {
                          BlocProvider.of<CounterBlocBloc>(context)
                              .add(IncreaseCounter());
                        },
                        child: Text("increase"),
                      )),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: RaisedButton(
                        color: Colors.redAccent, // Цвет кнопки.
                        textColor: Colors.black,
                        onPressed: () {
                          BlocProvider.of<CounterBlocBloc>(context)
                              .add(DecreaseCounter());
                        },
                        child: Text("decrease"),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  counter(context, int count) {
    return Text('$count');
  }
}
