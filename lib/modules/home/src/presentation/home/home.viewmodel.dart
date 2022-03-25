import 'package:flutter_sbf/core/base/viewmodel.base.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel {
  final BehaviorSubject<String> _name = BehaviorSubject<String>.seeded('');
  Stream<String> get name => _name.stream;
  void setName(String value) => _name.add(value);
}
