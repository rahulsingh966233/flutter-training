import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:launchdemo/counter_block.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
        create: (BuildContext context) => CounterBloc(),
          child: DemoPage(),
        )
      ),
    );
  }
}

class DemoPage extends StatelessWidget {

  void dispose(){
    CounterBloc().close();
  }

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        BlocBuilder<CounterBloc, int>(
          builder: (BuildContext context, int state){
            return Text("Counter Value: $state", style: TextStyle(fontSize: 20),);
          },
        ),
        RaisedButton(
          child: Text("increment"),
          onPressed: () {
              _counterBloc.add(CounterEvents.increment);
          },
        ),
        RaisedButton(
          child: Text("decrement"),
          onPressed: () {
            _counterBloc.add(CounterEvents.decrement);
          },
        ),
      ],
    );
  }
}
