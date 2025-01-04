

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/constants/enums.dart';
import 'package:todo_bloc/logic/cubit/internet_state.dart';

class InternetCubit extends Cubit<InternetState>
{
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading())
  {
    monitorInternetConnection();
  }
  

  StreamSubscription<List<ConnectivityResult>> monitorInternetConnection() {
    return connectivityStreamSubscription = 
      connectivity.onConnectivityChanged.listen((connectivityResult)
      {
        if(connectivityResult.contains(ConnectivityResult.wifi))
        {
          emitInternetConnected(ConnectionType.wifi);
        }
        else if (connectivityResult.contains(ConnectivityResult.bluetooth))
        {
          emitInternetConnected(ConnectionType.bluetooth);
        }
        else if(connectivityResult.contains(ConnectivityResult.ethernet))
        {
          emitInternetConnected(ConnectionType.ethernet);
        }
        else if(connectivityResult.contains(ConnectivityResult.mobile))
        {
          emitInternetConnected(ConnectionType.mobile);
        }
        else if(connectivityResult.contains(ConnectivityResult.vpn))
        {
          emitInternetConnected(ConnectionType.vpn);
        }
        else if(connectivityResult.contains(ConnectivityResult.other))
        {
          emitInternetConnected(ConnectionType.other);
        }
        else if(connectivityResult.contains(ConnectivityResult.none))
        {
          emitInternetDisconnected();
        }
      });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
    emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}