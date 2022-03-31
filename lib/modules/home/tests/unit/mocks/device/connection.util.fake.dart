import 'package:connectivity/connectivity.dart';
import 'package:flutter_sbf/core/utils/connection.util.dart';
import 'package:flutter_sbf/modules/home/tests/unit/fixtures/device/connection.fixture.dart';
import 'package:mockito/mockito.dart';

class MockConnectionUtilWithConnection extends Fake implements ConnectionUtil {
  @override
  Future<bool> hasConnection() async {
    return HasConnectionResponse.isConnection;
  }

  @override
  Stream<ConnectivityResult> connectionListener() {
    return Stream<ConnectivityResult>.value(HasConnectionResponse.connectionResult);
  }
}

class MockConnectionUtilWithoutConnection extends Fake implements ConnectionUtil {
  @override
  Future<bool> hasConnection() async {
    return HasNotConnectionResponse.isConnection;
  }

  @override
  Stream<ConnectivityResult> connectionListener() {
    return Stream<ConnectivityResult>.value(HasNotConnectionResponse.connectionResult);
  }
}
