import 'package:connectivity/connectivity.dart';

class HasConnectionResponse {
  static const bool isConnection = true;
  static const ConnectivityResult connectionResult = ConnectivityResult.wifi;
}

class HasNotConnectionResponse {
  static const bool isConnection = false;
  static const ConnectivityResult connectionResult = ConnectivityResult.none;
}
