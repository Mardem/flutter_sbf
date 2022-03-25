import 'package:rxdart/rxdart.dart';
import 'package:flutter_sbf/core/base/viewmodel.base.dart';

class HomeViewModel extends BaseViewModel {
  final _name = BehaviorSubject<String>.seeded('');
  Stream<String> get name => _name.stream;
  void setName(String value) => _name.add(value);
}
