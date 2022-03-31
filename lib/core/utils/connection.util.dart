import 'package:connectivity/connectivity.dart';

class ConnectionUtil {
  late ConnectivityResult _connectivityResult;

  Future<void> _connect() async {
    _connectivityResult = await Connectivity().checkConnectivity();
  }

  Future<bool> hasConnection() async {
    await _connect();
    if (_connectivityResult == ConnectivityResult.mobile) 
      return true;
    if (_connectivityResult == ConnectivityResult.wifi) 
      return true;
    return false;
  }

  Stream<ConnectivityResult> connectionListener() {
    return Connectivity().onConnectivityChanged;
  }
}
