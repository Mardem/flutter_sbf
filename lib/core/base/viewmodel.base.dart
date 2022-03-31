import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel {
  final BehaviorSubject<bool> _loading = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get loading => _loading.stream;
  void setLoading(bool value) => _loading.add(value);

  final PublishSubject<String?> _info = PublishSubject<String?>();
  Stream<String?> get info => _info.stream;
  void setInfo(String? value) => _info.add(value);

  final PublishSubject<String?> _success = PublishSubject<String?>();
  Stream<String?> get success => _success.stream;
  void setSuccess(String? value) => _success.add(value);

  final PublishSubject<String?> _error = PublishSubject<String?>();
  Stream<String?> get error => _error.stream;
  void setError(String? value) => _error.add(value);

  void dispose() {
    _loading.close();
    _info.close();
    _success.close();
    _error.close();
  }
}
