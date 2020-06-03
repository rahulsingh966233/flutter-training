import 'package:bloc/bloc.dart';
//import 'package:flutter_timer/bloc/bloc.dart';
import 'package:fluttertimer/bloc/timer_event.dart';
import 'package:fluttertimer/bloc/timer_state.dart';

// TimerEvent is declaration of 4 methods for pre
class TimerBloc extends Bloc<TimerEvent, TimerState>{
  @override
  TimerState get initialState => throw UnimplementedError();

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async*{
    throw UnimplementedError();
  }
}