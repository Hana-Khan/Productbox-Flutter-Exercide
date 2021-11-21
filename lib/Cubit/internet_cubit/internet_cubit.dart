import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

// class InternetCubit extends Cubit<InternetState> {
//   InternetCubit() : super(InternetInitial());
// }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;
  bool? isInternetConnected;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }


  void monitorInternetConnection() async {
    final connectionResult = await connectivity.checkConnectivity();
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  Future<bool> checkInternetConnection() async {
    print('internet checking');
    var connectivityResult = await (Connectivity().checkConnectivity());
    print('connectivityResult ${connectivityResult}');
    try {
      if (connectivityResult == ConnectivityResult.wifi) {
        isInternetConnected = true;
        print('isInternetConnected wifi ${isInternetConnected} ');
      } else if (connectivityResult == ConnectivityResult.mobile) {
        isInternetConnected = true;
      } else if (connectivityResult == ConnectivityResult.none) {
        isInternetConnected = false;
      }
      print(isInternetConnected);
      return isInternetConnected!;
    } catch (e) {
      return false;
    }
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
