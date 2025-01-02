import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/counter_state.dart';

class CounterCubit extends Cubit<CounterState>
{
  CounterCubit() : super(CounterState(counterValue: 0));
  
  void Increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncrement: true));
  void Decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncrement: false));

}