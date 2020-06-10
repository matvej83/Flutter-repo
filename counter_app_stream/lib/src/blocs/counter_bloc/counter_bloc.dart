import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter;

  CounterBloc() {
    _counter = 0;
    _actionController.stream.listen(_changeStream);
  }

  final _counterStream = BehaviorSubject<int>.seeded(0);

  Stream get pressedCount => _counterStream.stream;

  Sink get _addValue => _counterStream.sink;

  StreamController _actionController = StreamController();

  StreamSink get incrementCounter => _actionController.sink;

  void _changeStream(data) {
    switch (data) {
      case '':
        {
          _counter = 1;
        }
        break;
      case 'decrement':
        {
          if (_counter > 0) _counter--;
        }
        break;
      case 'increment':
        {
          _counter++;
        }
        break;
      case 'zero':
        {
          _counter = 0;
        }
    }

    _addValue.add(_counter);
  }

  void dispose() {
    _counterStream.close();
    _actionController.close();
  }
}
