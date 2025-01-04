import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/constants/enums.dart';
import 'package:todo_bloc/logic/cubit/counter_state.dart';
import 'package:todo_bloc/logic/cubit/internet_cubit.dart';
import 'package:todo_bloc/logic/cubit/internet_state.dart';

class CounterCubit extends Cubit<CounterState>
{
  final InternetCubit internetCubit;
  late StreamSubscription interentStreamSubscription;
  CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0))
  {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return interentStreamSubscription = internetCubit.stream.listen((internetState){
    if(internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi)
    {
      Increment();
    }
    else if(internetState is InternetConnected && internetState.connectionType == ConnectionType.mobile)
    {
      Decrement();
    }
  });
  }
  
  void Increment() =>
    emit(CounterState(counterValue: state.counterValue + 1, wasIncrement: true));


  void Decrement() => 
    emit(CounterState(counterValue: state.counterValue - 1, wasIncrement: false));

}