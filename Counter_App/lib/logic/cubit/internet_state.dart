// part of 'interent_cubit.dart';

import 'package:todo_bloc/constants/enums.dart';

abstract class InternetState {}

class InternetLoading extends InternetState {

}

class InternetConnected extends InternetState{
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState{

}
